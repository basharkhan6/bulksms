/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.service;

import me.abulbasar.bulksms.model.User;

/**
 *
 * @author Bashar
 */
public interface SecurityService {

    User findLoggedUser();
    
    String findUserRole();
    
    String findUserEmail();
        
    void autoLogin(String username, String password);
}
