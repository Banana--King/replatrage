package com.journaldev.spring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.journaldev.spring.model.User;
import com.journaldev.spring.service.UserService;
 
@Controller
public class UserController {
     
    private UserService UserService;
     
    @Autowired
    public void setUserService(UserService ps){
        this.UserService = ps;
    }
    
    /**
	 * Affiche une liste de tous les Users, avec un formulaire d'ajout (en fonction des droits)
	 * @param model -> Objet qui sert à créer une vue
	 * @return -> la page des Users
	 */
    @RequestMapping(value = "/Users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("User", new User());
        model.addAttribute("listUsers", this.UserService.listUsers());
        return "user";
    }
     
    /**
	 * Ajoute un User en BDD.
	 * @param u -> Objet de type User
	 * @return -> redirection vers la liste des Users
	 */
    @RequestMapping(value= "/User/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("User") User u, RedirectAttributes redirectAttributes){
        String message = "";
    	if(u.getNom() == null || u.getNom().isEmpty()
        		|| u.getPrenom() == null || u.getPrenom().isEmpty()
        		|| u.getUsername() == null || u.getUsername().isEmpty()
        		|| u.getPassword() == null || u.getPassword().isEmpty()){
    		redirectAttributes.addFlashAttribute("message", "ERREUR : tous les champs doivent être remplis ...");
        	return "redirect:/Users";
        }
        if(UserService.getUserByName(u.getUsername()) != null){
        	redirectAttributes.addFlashAttribute("message", "ERREUR : Cet utilisateur existe déjà ...");
        	return "redirect:/Users";
        }
        if(u.getId() == 0){
            // le user n'existe pas, donc on le créé (en cryptant son mdp façon Bcrypt)
    		String password = u.getPassword();
    		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    		String hashedPassword = passwordEncoder.encode(password);
    		u.setPassword(hashedPassword);
        	System.out.println("------USER ADD------ :"+u.toString());
        	message = "SUCCES : L'utilisateur a été ajouté !";
            this.UserService.addUser(u);
        }else{
        	// le user existe, donc on le modifie (en cryptant son mdp façon Bcrypt)
        	String password = u.getPassword();
    		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    		String hashedPassword = passwordEncoder.encode(password);
    		u.setPassword(hashedPassword);
        	System.out.println("------USER UPDATE------ :"+u.toString());
        	message = "SUCCES : L'utilisateur a été modifié !";
            this.UserService.updateUser(u);
        }
        
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/Users";  
    }
    
    /**
     * Supprime un User en BDD
     * @param idUser -> l'ID du User concerné en BDD
     * @return -> redirectin vers la liste des Users
     */
    @RequestMapping("/User/remove/{idUser}")
    public String removeUser(@PathVariable("idUser") int idUser, RedirectAttributes redirectAttributes){
        this.UserService.removeUser(idUser);
        
        redirectAttributes.addFlashAttribute("message", "SUCCES : L'utilisateur à été supprimé !");
        return "redirect:/Users";
    }
  
    /**
     * Modifie un User en BDD
     * @param idUser -> l'ID du User concerné en BDD
     * @param model  -> Objet qui permettra de créer la vue
     * @return -> le formulaire de modification d'un User
     */
    @RequestMapping("/User/edit/{idUser}")
    public String editUser(@PathVariable("idUser") int idUser, Model model){
        model.addAttribute("User", this.UserService.getUserById(idUser));
        model.addAttribute("listUsers", this.UserService.listUsers());
        return "user";
    }
     
}