package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.Etat;
import com.journaldev.spring.model.Partenaire;
import com.journaldev.spring.service.EtatService;
import com.journaldev.spring.service.PartenaireService;

@Controller
public class EtatController
{
	private EtatService etatService;

	@Autowired
	public void setEtatService(EtatService es) {
		this.etatService = es;
	}
	
	
	@RequestMapping(value="/Etats", method = RequestMethod.GET)
	public String listEtats(Model model)
	{
		model.addAttribute("Etat", new Etat());
		model.addAttribute("listEtats", this.etatService.listEtats());
		return "etat";
	}
	
	@RequestMapping(value= "/Etat/add", method = RequestMethod.POST)
	public String addEtat(@ModelAttribute("Etat") Etat e, RedirectAttributes redirectAttributes)
	{
		String message = "";
		if(e.getNom() == null || e.getNom().isEmpty()){
			redirectAttributes.addFlashAttribute("message", "ERREUR : Le champs doit être remplis ...");
			return "redirect:/Etats";
		}
		if(etatService.getEtatByName(e.getNom()) != null){
			redirectAttributes.addFlashAttribute("message", "ERREUR : Cet état existe déjà ...");
			return "redirect:/Etats";
		}
		if(e.getId() == 0){
            //new Partenaire, add it
        	System.out.println("------ETAT ADD------ :"+e.toString());
        	message = "SUCCES : L'état a été ajouté !";
            this.etatService.addEtat(e);
        }else{
            //existing Partenaire, call update
        	System.out.println("------ETAT UPDATE------ :"+e.toString());
        	message = "SUCCES : L'état a été modifié !";
            this.etatService.updateEtat(e);
        }
        
		redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/Etats";
	}
	
	@RequestMapping("/Etat/remove/{idEtat}")
    public String removeEtat(@PathVariable("idEtat") int idEtat, RedirectAttributes redirectAttributes){
        this.etatService.removeEtat(idEtat);
        
        redirectAttributes.addFlashAttribute("message", "SUCCES : L'état a été supprimé !");
        return "redirect:/Etats";
    }
	
	@RequestMapping("/Etat/edit/{idEtat}")
    public String editEtat(@PathVariable("idEtat") int idEtat, Model model){
        model.addAttribute("Etat", this.etatService.getEtatById(idEtat));
        model.addAttribute("listEtats", this.etatService.listEtats());
        return "etat";
    }
}
