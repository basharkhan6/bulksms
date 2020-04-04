/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import me.abulbasar.bulksms.model.User;
import me.abulbasar.bulksms.service.SecurityService;
import me.abulbasar.bulksms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Bashar
 */

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private SecurityService securityService;
    
    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    
    @GetMapping("/view")
    public String viewProfile(Model model) {
        User user = securityService.findLoggedUser();
        model.addAttribute("user", user);
        
        return "profileView";
    }
    
    @GetMapping("/view/{id}")
    public String viewProfile(@PathVariable("id") long id,
                              Model model,
                              RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorize Access");
            return "redirect:../view";
        }
        User user = userService.findById(id);
        model.addAttribute("user", user);
        
        return "profileView";
    }

    
    @GetMapping("/update")
    public String updateProfilePage(Model model) {
        User user = securityService.findLoggedUser();
        //clear instance password before sending view page
        user.setPassword("");
        model.addAttribute("userForm", user);

        return "profileUpdate";
    }
    
    @GetMapping("/update/{id}")
    public String updateProfilePage(@PathVariable("id") long id,
                                    Model model,
                                    RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorize Access");
            return "redirect:../view";
        }
        User user = userService.findById(id);
        //clear instance password before sending view page
        user.setPassword("");
        model.addAttribute("userForm", user);
        
        return "profileUpdate";
    }
    
    @PostMapping("/update")
    public String updateProfile(@ModelAttribute("userForm") User userForm,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            if(!securityService.findUserEmail().equals(userForm.getEmail())) {
                redirectAttributes.addFlashAttribute("em", "Unauthorized Access");
                return "redirect:view";
            }
        }
        if(bindingResult.hasErrors()) {
            return "profileUpdate";
        }
        
        userService.updateProfile(userForm);
        if(securityService.findUserRole().equals("ADMIN")) {
            userService.updateStatus(userForm, userForm.getStatus());
        }
        redirectAttributes.addFlashAttribute("sm", "Profile Update Success");

        return "redirect:view";
    }
    
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("userEmail") String userEmail,
                                 @RequestParam("password") String password,
                                 @RequestParam("passwordConfirm") String passwordConfirm,
                                 RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            if(!securityService.findUserEmail().equals(userEmail)) {
                redirectAttributes.addAttribute("em", "Unauthorize Access");
                return "redirect:view";
            }
        }
        if(!password.equals(passwordConfirm)) {
            redirectAttributes.addFlashAttribute("em", "Password Doesn't Match");
            return "redirect:view";
        }
        if(password.length()<6 || password.length()>32) {
            redirectAttributes.addFlashAttribute("em", "Please Write a Valid(>6 & <32) Password");
            return "redirect:view";
        }
        userService.updatePassword(userEmail, password);
        redirectAttributes.addFlashAttribute("sm", "Password Change Success");

        return "redirect:view";
    }
    
    @PostMapping("/updatePicture")
    public String updateImage() {
        
        return "";
    }

}
