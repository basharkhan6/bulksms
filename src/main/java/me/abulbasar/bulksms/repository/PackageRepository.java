/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.model.StatusEnum;

/**
 *
 * @author Bashar
 */
public interface PackageRepository extends JpaRepository<Package, Integer> {
    List<Package> findAllByStatus(StatusEnum status);
}
