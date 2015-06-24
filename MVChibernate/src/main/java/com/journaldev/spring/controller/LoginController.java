package com.journaldev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController
{
	/**
	 * Page de login de l'application
	 * @return -> le formulaire de connexion
	 */
	@RequestMapping("/login")
	public String doLogin()
	{
		return "login";
	}
}
