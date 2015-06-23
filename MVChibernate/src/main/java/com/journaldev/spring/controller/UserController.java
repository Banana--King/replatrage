package com.journaldev.spring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.UserService;
 
@Controller
public class UserController {
     
    private UserService UserService;
     
    @Autowired
    public void setUserService(UserService ps){
        this.UserService = ps;
    }
     
    @RequestMapping(value = "/Users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("User", new User());
        model.addAttribute("listUsers", this.UserService.listUsers());
        return "user";
    }
     
    //For add and update User both
    @RequestMapping(value= "/User/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("User") User u){
         
        if(u.getIdUser() == 0){
            //new User, add it
            this.UserService.addUser(u);
        }else{
            //existing User, call update
            this.UserService.updateUser(u);
        }
         
        return "redirect:/Users";
         
    }
     
    @RequestMapping("/User/remove/{idUser}")
    public String removeUser(@PathVariable("idUser") int idUser){
         
        this.UserService.removeUser(idUser);
        return "redirect:/Users";
    }
  
    @RequestMapping("/User/edit/{idUser}")
    public String editUser(@PathVariable("idUser") int idUser, Model model){
        model.addAttribute("User", this.UserService.getUserById(idUser));
        model.addAttribute("listUsers", this.UserService.listUsers());
        return "user";
    }
     
}