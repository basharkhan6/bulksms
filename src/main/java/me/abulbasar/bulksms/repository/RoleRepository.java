/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.repository;

import me.abulbasar.bulksms.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Bashar
 */
public interface RoleRepository extends JpaRepository<Role, Integer> {
    Role findByName(String role);
}
