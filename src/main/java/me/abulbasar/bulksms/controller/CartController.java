/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.exception.ResourceNotFoundException;
import me.abulbasar.bulksms.model.Item;
import me.abulbasar.bulksms.repository.PackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Bashar
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    PackageRepository packageRepository;

    @GetMapping("/index")
    public String cartPage() {
        return "cart";
    }

    @GetMapping("/{action}/{id}")
    public String addItem(@PathVariable("action") String action,
                          @PathVariable("id") int id, HttpSession session) {

        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            session.setAttribute("cart", cart);
        }
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = this.exists(id, cart);

        if(!action.equals("add") && index == -1) {
            return "redirect:../index";
        }

        if(action.equals("add")) {
            if(index == -1) {
                Package pack = packageRepository.findById(id).orElseThrow(
                        () -> new ResourceNotFoundException("Package",
                                "id", id));
                cart.add(new Item(pack, 1));
            }
            else{
                int qty = cart.get(index).getQty() + 1;
                cart.get(index).setQty(qty);                    
            }
        }
        else if(action.equals("minus")) {
            int qty = cart.get(index).getQty() - 1;
            if(qty <= 0) {
                cart.remove(index);
            }
            else {
                cart.get(index).setQty(qty);                    
            }
        }
        else if(action.equals("delete")) {
            cart.remove(index);
        }
        else {
            cart.get(index).setQty(1);
        }
        session.setAttribute("cart", cart);
        
        if(cart.size() == 0) {
            session.removeAttribute("cart");
        }
        return "redirect:../index";
    }

//    @GetMapping("remove/{id}")
//    public String removeItem(@PathVariable("id") int id, HttpSession session) {
//        Package pack = packageRepository.findById(id).orElseThrow(
//                () -> new ResourceNotFoundException("Package", "id", id));
//        
//        List<Item> cart = (List<Item>) session.getAttribute("cart");
//        int index = this.exists(id, cart);
//        cart.remove(index);
//        session.setAttribute("cart", cart);
//        return "redirect:../index";
//    }

    private int exists(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getPack().getId().equals(id)) {
                return i;
            }
        }
        return -1;
    }

}
