package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.RoleUser;
import com.journaldev.spring.service.RoleService;
import com.journaldev.spring.service.RoleUserService;
import com.journaldev.spring.service.UserService;

@Controller
public class RoleUserController
{
	private RoleUserService roleUserService;
	private RoleService roleService;
	private UserService userService;

	@Autowired
	public void setRoleuSERService(RoleUserService rus) {
		this.roleUserService = rus;
	}
	@Autowired
	public void setRoleService(RoleService rs) {
		this.roleService = rs;
	}
	@Autowired
	public void setUserService(UserService us) {
		this.userService = us;
	}
	
	
	@RequestMapping(value="/RoleUsers", method = RequestMethod.GET)
	public String listRoleUsers(Model model)
	{
		model.addAttribute("RoleUser", new RoleUser());
		model.addAttribute("listRoleUsers", this.roleUserService.listRoleUsers());
		model.addAttribute("listRoleNames", this.roleService.listRoles());
		model.addAttribute("listUsers", this.userService.listUsers());
		
		return "roleUser";
	}
	
	
	@RequestMapping(value= "/RoleUser/add", method = RequestMethod.POST)
	public String addRoleUser(@ModelAttribute("RoleUser") RoleUser ru, RedirectAttributes redirectAttributes)
	{
		String message = "";
		if(ru.getUsername() == null || ru.getUsername().isEmpty() || ru.getRoleName() == null || ru.getRoleName().isEmpty()){
			redirectAttributes.addFlashAttribute("message", "ERREUR : tous les champs doivent être remplis ...");
			return "redirect:/RoleUsers";
		}
		if(roleUserService.getRoleUserByCouple(ru.getUsername(), ru.getRoleName()) != null){
			redirectAttributes.addFlashAttribute("message", "ERREUR : le couple user/role existe deja ...");
			return "redirect:/RoleUsers";
		}
		if(ru.getId() == 0){
            //new Role, add it
        	System.out.println("------ROLE_USER ADD------ :"+ru.toString());
            message = "SUCCES : couple user/role ajouté !";
        	this.roleUserService.addRoleUser(ru);
        }else{
            //existing Role, call update
        	System.out.println("------ROLE_USER UPDATE------ :"+ru.toString());
        	message = "SUCCES : couple user/role modifié !";
            this.roleUserService.updateRoleUser(ru);
        }
        
		redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/RoleUsers";
	}
	
	
	@RequestMapping("/RoleUser/remove/{idRoleUser}")
    public String removeRoleUser(@PathVariable("idRoleUser") int idRoleUser, RedirectAttributes redirectAttributes)
	{
        this.roleUserService.removeRoleUser(idRoleUser);
        
        redirectAttributes.addFlashAttribute("message", "SUCCES : couple user/role supprimé !");
        return "redirect:/RoleUsers";
    }
	
	@RequestMapping("/RoleUser/edit/{idRoleUser}")
	public String editRoleUser(@PathVariable("idRoleUser") int idRoleUser, Model model){
        model.addAttribute("RoleUser", this.roleUserService.getRoleUserById(idRoleUser));
        model.addAttribute("listRoleUsers", this.roleUserService.listRoleUsers());
        model.addAttribute("listRoleNames", this.roleService.listRoles());
		model.addAttribute("listUsers", this.userService.listUsers());
		
        return "roleUser";
    }
}
