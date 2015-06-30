package com.journaldev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Etat;
import com.journaldev.spring.model.Mission;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.MissionService;
import com.journaldev.spring.service.RoleUserService;
import com.journaldev.spring.service.UserService;

@Controller
public class AjaxController
{
	private MissionService missionService;
	private RoleUserService roleUserService;
	private UserService userService;
	
	@Autowired
	public void setMissionService(MissionService ms) {
		this.missionService = ms;
	}
	@Autowired
	public void setRoleUserService(RoleUserService rus) {
		this.roleUserService = rus;
	}
	@Autowired
	public void setUserService(UserService us) {
		this.userService = us;
	}
	
	@RequestMapping(value="/Ajax", method = RequestMethod.GET)
	public String listEtats(Model model)
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
		if(rolesNames.contains("ROLE_ADMIN"))
		{
			model.addAttribute("listMissions", this.missionService.listMissions());
		}
		else
		{
			model.addAttribute("listMissions", this.missionService.listMissionsByUserId(user));
		}
		
		model.addAttribute("action", "getAllAdresses");
		return "ajax";
	}
	
	@RequestMapping(value="/Ajax/checkAdresse", method = RequestMethod.GET)
	public String checkAdresse(Model model)
	{
		model.addAttribute("action", "checkAdresse");
		return "ajax";
	}
}
