package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Partenaire;
import com.journaldev.spring.service.PartenaireService;

@Controller
public class PartenaireController
{
	private PartenaireService partenaireService;

	@Autowired
	public void setPartenaireService(PartenaireService ps) {
		this.partenaireService = ps;
	}
	
	@RequestMapping(value="/Partenaires", method = RequestMethod.GET)
	public String listPartenaires(Model model)
	{
		model.addAttribute("Partenaire", new Partenaire());
		model.addAttribute("listPartenaires", this.partenaireService.listPartenaires());
		return "partenaire";
	}
	
	@RequestMapping(value= "/Partenaire/add", method = RequestMethod.POST)
	public String addPartenaire(@ModelAttribute("Partenaire") Partenaire p)
	{
		if(p.getId() == 0){
            //new Partenaire, add it
        	System.out.println("------PARTENAIRE ADD------ :"+p.toString());
            this.partenaireService.addPartenaire(p);
        }else{
            //existing Partenaire, call update
        	System.out.println("------PARTENAIRE UPDATE------ :"+p.toString());
            this.partenaireService.updatePartenaire(p);
        }
         
        return "redirect:/Partenaires";
	}
	
	
	@RequestMapping("/Partenaire/remove/{idPartenaire}")
    public String removePartenaire(@PathVariable("idPartenaire") int idPartenaire){
         
        this.partenaireService.removePartenaire(idPartenaire);
        return "redirect:/Partenaires";
    }
  
    @RequestMapping("/Partenaire/edit/{idPartenaire}")
    public String editPartenaire(@PathVariable("idPartenaire") int idPartenaire, Model model){
        model.addAttribute("Partenaire", this.partenaireService.getPartenaireById(idPartenaire));
        model.addAttribute("listUsers", this.partenaireService.listPartenaires());
        return "partenaire";
    }
}
