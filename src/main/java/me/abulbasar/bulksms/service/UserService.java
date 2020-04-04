/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.service;

import java.util.List;
import me.abulbasar.bulksms.model.StatusEnum;
import me.abulbasar.bulksms.model.User;

/**
 *
 * @author Bashar
 */
public interface UserService {
    
    User findById(Long id);

    User findByEmail(String email);
    
    List<User> findAll();
    
    void save(User user);
    
    void saveAdmin(User user);
    
    void updateProfile(User user);
    
    void updateStatus(User user, StatusEnum statusEnum);
    
    void updatePassword(String email, String password);
    
}
