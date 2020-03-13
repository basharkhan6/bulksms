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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String registration(@ModelAttribute("userForm") User userForm,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getEmail(),
                                  userForm.getPasswordConfirm());
        redirectAttributes.addFlashAttribute("sm", "Registration Succesful");
        
        return "redirect:/dashboard";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {

        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("role", securityService.findUserRole().toLowerCase());
        
        return "dashboard";
    }

}
