/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import java.util.ArrayList;
import java.util.List;
import me.abulbasar.bulksms.exception.ResourceNotFoundException;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.repository.PackageRepository;
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
    PackageRepository packageRepository;
    
    @Autowired
    SecurityService securityService;


    @GetMapping("/list")
    public String listPacage(Model model,
                             @PathVariable("role") String role) {
        List<Package> packages = packageRepository.findAll();
        model.addAttribute("packages", packages);
        model.addAttribute("role", role);

        return "packageList";
    }

    @GetMapping("/add")
    public String addPage(Model model, @PathVariable("role") String role) {
        Package pack = new Package();
        model.addAttribute("pack", pack);
        model.addAttribute("role", role);

        return "packageAdd";
    }

    @PostMapping("/add")
    public String addPackage(@ModelAttribute Package pack,
                             RedirectAttributes redirectAttributes) {
        packageRepository.save(pack);
        redirectAttributes.addFlashAttribute("sm", "Package Add Successful");
        
        return "redirect:list";
    }

    @GetMapping("/update/{id}")
    public String updatePage(Model model,
                             @PathVariable("id") int id,
                             @PathVariable("role") String role) {
        Package pack = packageRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Package", "id", id));
        model.addAttribute("pack", pack);
        model.addAttribute("role", role);

        return "packageUpdate";
    }

    @PostMapping("/update")
    public String updatePackage(@ModelAttribute Package newPack,
                                RedirectAttributes redirectAttributes) {
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorized Access");
            return "redirect:list";
        }
        
        Package pack = packageRepository.findById(newPack.getId()).orElseThrow(
                () -> new ResourceNotFoundException("Package", "id",
                                                    newPack.getId()));
        pack.setpName(newPack.getpName());
        pack.setPrice(newPack.getPrice());
        pack.setSms(newPack.getSms());
        pack.setDuration(newPack.getDuration());
        pack.setType(newPack.getType());
        pack.setActivated(newPack.isActivated());
        packageRepository.save(pack);
        redirectAttributes.addFlashAttribute("sm", "Package Update Successful");
        
        return "redirect:update/"+pack.getId();
    }

    @GetMapping("/delete/{id}")
    public String deletePackage(@PathVariable("id") int id,
                                RedirectAttributes redirectAttributes) {
        System.out.println("Enter Delete Package Controller ...\n");
        if(!securityService.findUserRole().equals("ADMIN")) {
            redirectAttributes.addFlashAttribute("em", "Unauthorized Access");
            return "redirect:../list";
        }

        Package pack = packageRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Package", "id", id));
        packageRepository.delete(pack);
        System.out.println("Package Delete Success...\n");
        redirectAttributes.addFlashAttribute("em", "Package Deleted");
        System.out.println("Redirecting to the list with sm....\n\n");
        return "redirect:../list";
    }

    @ModelAttribute("types")
    public List<String> getTypes() {
        List<String> types = new ArrayList<String>();
        types.add("NON MASKING");
        types.add("MASKING");
        return types;
    }

}