package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Mission;
import com.journaldev.spring.service.MissionService;

@Controller
public class MissionController
{
	private MissionService missionService;

	@Autowired
	public void setPartenaireService(MissionService ms) {
		this.missionService = ms;
	}
	
	
	@RequestMapping(value="/Missions", method = RequestMethod.GET)
	public String listMissions(Model model)
	{
		model.addAttribute("Mission", new Mission());
		model.addAttribute("listMissions", this.missionService.listMissions());
		return "mission";
	}
	
	
	@RequestMapping(value= "/Mission/add", method = RequestMethod.POST)
	public String addMission(@ModelAttribute("Mission") Mission m)
	{
		if(m.getId() == 0){
            //new Mission, add it
        	System.out.println("------MISSION ADD------ :"+m.toString());
            this.missionService.addMission(m);
        }else{
            //existing Mission, call update
        	System.out.println("------MISSION UPDATE------ :"+m.toString());
            this.missionService.updateMission(m);
        }
         
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
        return "mission";
	}
}
