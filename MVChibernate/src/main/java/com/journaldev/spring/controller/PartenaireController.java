package com.journaldev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
/* ---------- Methodes ---------- */
	/**
	 * Affiche une liste de tous les partenaires, avec un formulaire d'ajout (en fonction des droits)
	 * @param model -> Objet qui sert à créer une vue
	 * @return -> la page des partenaires
	 */
	@RequestMapping(value="/Partenaires", method = RequestMethod.GET)
	public String listPartenaires(Model model)
	{
		model.addAttribute("Partenaire", new Partenaire());
		model.addAttribute("listPartenaires", this.partenaireService.listPartenaires());
		return "partenaire";
	}
	
	/**
	 * Ajoute un partenaire en BDD.
	 * @param p -> Objet de type Partenaire
	 * @return -> redirection vers la liste des partenaires
	 */
	@RequestMapping(value= "/Partenaire/add", method = RequestMethod.POST)
	public String addPartenaire(@ModelAttribute("Partenaire") Partenaire p, RedirectAttributes redirectAttributes)
	{
		String message = "";
		if(p.getNom() == null || p.getNom().isEmpty()){
			redirectAttributes.addFlashAttribute("message", "ERREUR : Le champs doit être remplis ...");
			return "redirect:/Partenaires";
		}
		if(partenaireService.getPartenaireByName(p.getNom()) != null){
			redirectAttributes.addFlashAttribute("message", "ERREUR : Le partenaire existe déjà ...");
			return "redirect:/Partenaires";
		}
		if(p.getId() == 0){
            //new Partenaire, add it
        	System.out.println("------PARTENAIRE ADD------ :"+p.toString());
        	message = "SUCCES : Le partenaire a été ajouté !";
            this.partenaireService.addPartenaire(p);
        }else{
            //existing Partenaire, call update
        	System.out.println("------PARTENAIRE UPDATE------ :"+p.toString());
        	message = "SUCCES : Le partenaire a été modifié !";
            this.partenaireService.updatePartenaire(p);
        }
        
		redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/Partenaires";
	}
	
	/**
	 * Supprime un Partenaire de la BDD
	 * @param idPartenaire -> l'ID du Partenaire concerné en BDD
	 * @return -> redirection vers la liste des Partenaires
	 */
	@RequestMapping("/Partenaire/remove/{idPartenaire}")
    public String removePartenaire(@PathVariable("idPartenaire") int idPartenaire, RedirectAttributes redirectAttributes){
        this.partenaireService.removePartenaire(idPartenaire);
        
        redirectAttributes.addFlashAttribute("message", "SUCCES : Le partenaire a été supprimé !");
        return "redirect:/Partenaires";
    }
	
	/**
	 * Modifie un partenaire en BDD
	 * @param idPartenaire -> l'ID du Partenaire concerné en BDD
	 * @param model 	   -> Objet qui permettra de créer la vue
	 * @return -> le formulaire de modification d'un Partenaire
	 */
    @RequestMapping("/Partenaire/edit/{idPartenaire}")
    public String editPartenaire(@PathVariable("idPartenaire") int idPartenaire, Model model){
        model.addAttribute("Partenaire", this.partenaireService.getPartenaireById(idPartenaire));
        model.addAttribute("listPartenaires", this.partenaireService.listPartenaires());
        return "partenaire";
    }
}
