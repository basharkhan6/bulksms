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
public interface UserService {
    
    void save(User user);
    User findByEmail(String email);

}
