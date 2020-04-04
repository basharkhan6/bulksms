/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.service;

import java.util.List;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.model.StatusEnum;
/**
 *
 * @author Bashar
 */
public interface PackageService {
    
    Package findById(Integer id);

    List<Package> findAll();
    
    List<Package> findAllByStatus(StatusEnum status);

    List<Package> findAllActive();
    
    void save(Package pack);
    
    void update(Package pack);
    
    void delete(Package pack);
    
}
