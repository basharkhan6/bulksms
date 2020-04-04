/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import java.util.List;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Bashar
 */

@Controller
public class PageController {
    
    @Autowired
    PackageService packageService;
    
    
    @GetMapping("/")
    public String index(Model model) {
        List<Package> packs = packageService.findAllActive();
        model.addAttribute("packs", packs);

        return "index";
    }
    
}
