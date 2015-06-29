package com.journaldev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController
{
		/**
		 * Page d'accueil de l'application
		 * @return -> la page d'accueil
		 */
		@RequestMapping(value = "/")
		public String home()
		{
			return "home";
		}
}
