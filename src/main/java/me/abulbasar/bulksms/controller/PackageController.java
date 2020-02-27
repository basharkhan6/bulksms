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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Bashar
 */
@Controller
@RequestMapping("{role}/package")
public class PackageController {

    @Autowired
    PackageRepository packageRepository;

    @GetMapping("/list")
    public String listPacage(Model model, @RequestParam(required=false) String sm) {
        List<Package> packages = packageRepository.findAll();
        model.addAttribute("packages", packages);
        model.addAttribute("urlRole", getUrlRole());
        if(sm != null) {
            model.addAttribute("sm", sm);
        }
        return "packageList";
    }

    @GetMapping("/add")
    public String addPage(Model model) {
        Package pack = new Package();
        model.addAttribute("pack", pack);
        model.addAttribute("urlRole", getUrlRole());
        return "packageAdd";
    }

    @PostMapping("/add")
    public String addPackage(@ModelAttribute Package pack) {
        packageRepository.save(pack);
        return "redirect:list?sm=Add Successful";
    }
    
    @GetMapping("/update/{id}")
    public String updatePage(@PathVariable("id") int id, Model model, @RequestParam(required=false) String sm) {
        Package pack = packageRepository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Package", "id", id));
        model.addAttribute("pack", pack);
        model.addAttribute("urlRole", getUrlRole());
        if(sm != null) {
            model.addAttribute("sm", sm);
        }
        return "packageUpdate";
    }
    
    @PostMapping("/update")
    public String updatePackage(@ModelAttribute Package newPack) {
        Package pack = packageRepository.findById(newPack.getId()).orElseThrow(()-> new ResourceNotFoundException("Package", "id", newPack.getId()));
        pack.setpName(newPack.getpName());
        pack.setPrice(newPack.getPrice());
        pack.setSms(newPack.getSms());
        pack.setDuration(newPack.getDuration());
        pack.setType(newPack.getType());
        packageRepository.save(pack);
        return "redirect:update/"+pack.getId()+"?sm=Update Succesful";
    }
    
    @GetMapping("/delete/{id}")
    public String deletePackage(@PathVariable("id") int id) {
        Package pack = packageRepository.findById(id).orElseThrow(()->new ResourceNotFoundException("Package", "id", id));
        packageRepository.delete(pack);
        return "redirect:../list?sm=Delete Succesful";
    }
    
    

    @ModelAttribute("types")
    public List<String> getTypes() {
        List<String> types = new ArrayList<String>();
        types.add("NON MASKING");
        types.add("MASKING");
        return types;
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
