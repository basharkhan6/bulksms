/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import me.abulbasar.bulksms.exception.ResourceNotFoundException;
import me.abulbasar.bulksms.model.Profile;
import me.abulbasar.bulksms.model.Role;
import me.abulbasar.bulksms.model.StatusEnum;
import me.abulbasar.bulksms.model.User;
import me.abulbasar.bulksms.repository.RoleRepository;
import me.abulbasar.bulksms.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Bashar
 */
@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

        
    @Override
    public User findById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(()->new ResourceNotFoundException("User",
                        "id",
                        id));
    }
    
    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    @Override
    public List<User> findAll() {
        return (List<User>)userRepository.findAll();
    }
    
    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.getProfile().setUser(user);
        Role userRole = roleRepository.findByName("USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        
        userRepository.save(user);
    }

    @Override
    public void saveAdmin(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role userRole = roleRepository.findByName("ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));

        userRepository.save(user);
    }

    @Override
    public void updateProfile(User user) {
        User oldUser = findByEmail(user.getEmail());
        Profile oldProfile = oldUser.getProfile();
        Profile profile = user.getProfile();
        
        oldProfile.setFirstName(profile.getFirstName());
        oldProfile.setLastName(profile.getLastName());
        oldProfile.setNid(profile.getNid());
        oldProfile.setDob(profile.getDob());
        oldProfile.setCompanyName(profile.getCompanyName());
        oldProfile.setAddress1(profile.getAddress1());
        oldProfile.setAddress2(profile.getAddress2());
        oldProfile.setCity(profile.getCity());
        oldProfile.setRegion(profile.getRegion());
        oldProfile.setZip(profile.getZip());
        oldProfile.setCountry(profile.getCountry());

        oldUser.setProfile(oldProfile);
        oldProfile.setUser(oldUser);
        
        userRepository.save(oldUser);
    }
    
    @Override
    public void updateStatus(User user, StatusEnum statusEnum) {
        User oldUser = findByEmail(user.getEmail());
        oldUser.setStatus(statusEnum);
        
        userRepository.save(oldUser);
    }
    
    @Override
    public void updatePassword(String email, String password) {
        User user = findByEmail(email);
        user.setPassword(bCryptPasswordEncoder.encode(password));
        
        userRepository.save(user);
    }
    
}
