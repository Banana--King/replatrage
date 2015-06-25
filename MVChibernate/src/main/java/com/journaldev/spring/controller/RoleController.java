package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.Role;
import com.journaldev.spring.service.RoleService;

@Controller
public class RoleController
{
	private RoleService roleService;

	@Autowired
	public void setRoleService(RoleService rs) {
		this.roleService = rs;
	}
	
	@RequestMapping(value= "/Roles", method = RequestMethod.GET)
	public String listRoles(Model model)
	{
		model.addAttribute("Role", new Role());
		model.addAttribute("listRoles", this.roleService.listRoles());
		return "role";
	}
	
	@RequestMapping(value= "/Role/add", method = RequestMethod.POST)
	public String addRole(@ModelAttribute("Role") Role r, RedirectAttributes redirectAttributes)
	{
		String message = "";
		if(r.getName() == null || r.getName().isEmpty()){
			redirectAttributes.addFlashAttribute("message", "ERREUR : le champs doit être remplis ...");
			return "redirect:/Roles";
		}
		if( roleService.getRoleByName(r.getName()) != null )
		{
			redirectAttributes.addFlashAttribute("message", "ERREUR : ce role existe déjà ...");
			return "redirect:/Roles";
		}
		if(r.getId() == 0){
			//new Role, add it
        	System.out.println("------ROLE ADD------ :"+r.toString());
        	message = "SUCCES : Le role a été ajouté !";
        	this.roleService.addRole(r);
        }else{
            //existing Role, call update
        	System.out.println("------ROLE UPDATE------ :"+r.toString());
        	message = "SUCCES : Le role a été modifié !";
            this.roleService.updateRole(r);
        }
        
		redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/Roles";
	}
	
	@RequestMapping("/Role/remove/{idRole}")
    public String removeRole(@PathVariable("idRole") int idRole, RedirectAttributes redirectAttributes){
        this.roleService.removeRole(idRole);
        
        redirectAttributes.addFlashAttribute("message", "SUCCES : Le role à été supprimé !");
        return "redirect:/Roles";
    }
	
	@RequestMapping("/Role/edit/{idRole}")
	public String editRole(@PathVariable("idRole") int idRole, Model model){
        model.addAttribute("Role", this.roleService.getRoleById(idRole));
        model.addAttribute("listRoles", this.roleService.listRoles());
        return "role";
    }
}
