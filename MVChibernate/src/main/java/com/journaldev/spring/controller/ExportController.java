package com.journaldev.spring.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.Mission;
import com.journaldev.spring.model.Partenaire;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.ExportService;
import com.journaldev.spring.service.MissionService;

@Controller
public class ExportController
{
	private ExportService exportService;
	private MissionService missionService;
	
	@Autowired
	public void setExportService(ExportService es) {
		this.exportService = es;
	}
	@Autowired
	public void setMissionService(MissionService ms) {
		this.missionService = ms;
	}
	
	
	@RequestMapping(value="/Export", method = RequestMethod.GET)
	public String exportMission(Model model)
	{
		model.addAttribute("Mission", new Mission());
		model.addAttribute("listMissions", this.missionService.listMissions());
		
		return "export";
	}
	
	@RequestMapping(value= "/Export/mission", method = RequestMethod.POST)
	public String addPartenaire(@RequestParam("adresse") String adresse, RedirectAttributes redirectAttributes) throws IOException
	{
		boolean export = this.exportService.exportMission(adresse);
		if(!export){
			redirectAttributes.addFlashAttribute("message", "ERREUR : erreur lors de l'exportation de la mission");
	        return "redirect:/Export";
		}
		redirectAttributes.addFlashAttribute("message", "SUCCES : La mission a bien été exportée");
        return "redirect:/Export";
	}
}
