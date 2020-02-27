/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import me.abulbasar.bulksms.model.User;
import me.abulbasar.bulksms.service.SecurityService;
import me.abulbasar.bulksms.service.UserService;
import me.abulbasar.bulksms.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Bashar
 */
@Controller
public class SecurityController {

    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getEmail(), userForm.getPasswordConfirm());

        return "redirect:/user";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
//        User user = securityService.findLoggedUser();
//        System.out.println(securityService.matchRole("ADMIN"));
        if(error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }
        if(logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        return "login";
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/home")
    public String home() {
        if(securityService.matchRole("ADMIN")) {
            return "redirect:/admin";
        }
        else if(securityService.matchRole("USER")) {
            return "redirect:/user";
        }
        else {
            return "redirect:/";
        }
    }
    
    @GetMapping({"/user", "/admin"})
    public String dashboard(Model model) {
        model.addAttribute("urlRole", getUrlRole());
        return "dashboard";
    }
    
    String getUrlRole() {
        UriComponentsBuilder builder = ServletUriComponentsBuilder.fromCurrentRequest();
        String fullPath = builder.buildAndExpand().getPath();
        String target = "/bulksms/";
        String afterContext = fullPath.substring(target.length());
        String role = afterContext;
        if(afterContext.contains("/")) {
            role = afterContext.substring(0, afterContext.indexOf("/"));
        }
        return role;
    }
}