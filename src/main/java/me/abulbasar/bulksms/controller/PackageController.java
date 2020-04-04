/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import java.util.List;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.service.PackageService;
import me.abulbasar.bulksms.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Bashar
 */
@Controller
@RequestMapping("{role}/package")
public class PackageController {
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    PackageService packageService;


    @GetMapping("/list")
    public String listPacage(Model model,
                             @PathVariable("role") String role) {
        List<Package> packages = packageService.findAll();
        model.addAttribute("packages", packages);

        return "packageList";
    }

    @GetMapping("/add")
    public String addPage(Model model, @PathVariable("role") String role) {
        Package pack = new Package();
        model.addAttribute("pack", pack);

        return "packageAdd";
    }

    @PostMapping("/add")
    public String addPackage(@ModelAttribute Package pack,
                             RedirectAttributes redirectAttributes) {
        packageService.save(pack);
        redirectAttributes.addFlashAttribute("sm", "Package Add Successful");
        
        return "redirect:list";
    }

    @GetMapping("/update/{id}")
    public String updatePage(Model model, @PathVariable("id") int id) {
        Package pack = packageService.findById(id);
        model.addAttribute("pack", pack);

        return "packageUpdate";
    }

    @PostMapping("/update")
    public String updatePackage(@ModelAttribute Package newPack,
                                RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorized Access");
            return "redirect:list";
        }
        packageService.update(newPack);
        redirectAttributes.addFlashAttribute("sm", "Package Update Successful");
        
        return "redirect:update/"+newPack.getId();
    }

    @GetMapping("/delete/{id}")
    public String deletePackage(@PathVariable("id") int id,
                                RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorized Access");
            return "redirect:../list";
        }
        packageService.delete(packageService.findById(id));
        redirectAttributes.addFlashAttribute("em", "Package Deleted");

        return "redirect:../list";
    }

}