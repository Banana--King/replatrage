package com.journaldev.spring.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.Mission;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.EtatService;
import com.journaldev.spring.service.MissionService;
import com.journaldev.spring.service.RoleService;
import com.journaldev.spring.service.RoleUserService;
import com.journaldev.spring.service.UserService;

@Controller
public class MissionController
{
	private MissionService missionService;
	private EtatService etatService;
	private UserService userService;
	private RoleUserService roleUserService;
	
	@Autowired
	public void setMissionService(MissionService ms) {
		this.missionService = ms;
	}
	@Autowired
	public void setEtatService(EtatService es) {
		this.etatService = es;
	}
	@Autowired
	public void setUserService(UserService us) {
		this.userService = us;
	}
	@Autowired
	public void setRoleUserService(RoleUserService rus) {
		this.roleUserService = rus;
	}
	
	
	@RequestMapping(value="/Missions", method = RequestMethod.GET)
	public String listMissions(Model model)
	{
		String actualUsername = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println("*");
		System.out.println("* USER CONNECTED : " + actualUsername);
		System.out.println("*");
		
		User user = userService.getUserByName(actualUsername);
		int userId = user.getId();
		
		System.out.println("***************");
		List<String> rolesNames = roleUserService.getRoleUserByUsername(actualUsername);
		System.out.println(rolesNames);
		System.out.println("***************");
		
		model.addAttribute("Mission", new Mission());
		model.addAttribute("listEtats", this.etatService.listEtats());
		model.addAttribute("listUsers", this.userService.listUsers());
		if(rolesNames.contains("ROLE_ADMIN"))
		{
			model.addAttribute("listMissions", this.missionService.listMissions());
		}
		else
		{
			model.addAttribute("listMissions", this.missionService.listMissionsByUserId(user));
		}
		
		/*model.addAttribute("Mission", new Mission());
		model.addAttribute("listMissions", this.missionService.listMissions());
		model.addAttribute("listEtats", this.etatService.listEtats());
		model.addAttribute("listUsers", this.userService.listUsers());*/
		
		return "mission";
	}
	
	
	@RequestMapping(value= "/Mission/add", method = RequestMethod.POST)
	public String addMission(@ModelAttribute("Mission") Mission m, BindingResult result, @RequestParam("user") int userId, RedirectAttributes redirectAttributes)
	{
		User user  = null;
		if(userId != 0){
			user = userService.getUserById(userId);
		}
		m.setUser(user);
		
		Date date = new Date();
		m.setDateLastAction(date);
		
		System.out.println("*");
		System.out.println("********* DEBUG MISSION : "+m.toString());
		System.out.println("*");
		String message = "";
    	if(m.getTitre() == null || m.getTitre().isEmpty()
        		|| m.getDescription() == null || m.getDescription().isEmpty()
        		|| m.getEtat() == null
        		|| m.getAdresse() == null || m.getAdresse().isEmpty()){
    		redirectAttributes.addFlashAttribute("message", "ERREUR : tous les champs doivent être remplis ...");
        	return "redirect:/Missions";
        }
    	
    	m.setId(0);
		if(m.getId() == 0){
            //new Mission, add it
        	System.out.println("------MISSION ADD------ :"+m.toString());
        	message = "SUCCES : La mission a été ajoutée";
            this.missionService.addMission(m);
        }else{
            //existing Mission, on ajoute quand meme !
        	System.out.println("------MISSION UPDATE------ :"+m.toString());
        	message = "SUCCES : La mission a été modifiée";
        	this.missionService.addMission(m);
        }
        
		redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/Missions";
	}
	
	
	@RequestMapping("/Mission/remove/{idMission}")
    public String removeMission(@PathVariable("idMission") int idMission){
         
        this.missionService.removeMission(idMission);
        return "redirect:/Missions";
    }
	
	@RequestMapping("/Mission/edit/{idMission}")
    public String editPartenaire(@PathVariable("idMission") int idMission, Model model){
        model.addAttribute("Mission", this.missionService.getMissionById(idMission));
        model.addAttribute("listMissions", this.missionService.listMissions());
        model.addAttribute("listEtats", this.etatService.listEtats());
        model.addAttribute("listUsers", this.userService.listUsers());
        
        return "mission";
	}
}
