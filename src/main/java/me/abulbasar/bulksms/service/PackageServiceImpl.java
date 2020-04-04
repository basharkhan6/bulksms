/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.abulbasar.bulksms.service;

import java.util.List;
import me.abulbasar.bulksms.exception.ResourceNotFoundException;
import me.abulbasar.bulksms.model.Package;
import me.abulbasar.bulksms.model.StatusEnum;
import me.abulbasar.bulksms.repository.PackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Bashar
 */
@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    PackageRepository packageRepository;
    
    
    @Override
    public Package findById(Integer id) {
        return packageRepository.findById(id)
                .orElseThrow(()->new ResourceNotFoundException("Package",
                                                                 "id", id));
    }

    @Override
    public List<Package> findAll() {
        return (List<Package>)packageRepository.findAll();
    }
    
    @Override
    public List<Package> findAllByStatus(StatusEnum status) {
        return (List<Package>)packageRepository.findAllByStatus(status);
    }

    @Override
    public List<Package> findAllActive() {
        return (List<Package>)packageRepository.findAllByStatus(StatusEnum.ACTIVE);
    }

    
    @Override
    public void save(Package pack) {
        packageRepository.save(pack);
    }

    @Override
    public void update(Package pack) {
        Package oldPack = findById(pack.getId());
        oldPack.setpName(pack.getpName());
        oldPack.setPrice(pack.getPrice());
        oldPack.setSms(pack.getSms());
        oldPack.setValidity(pack.getValidity());
        oldPack.setPackageType(pack.getPackageType());
        oldPack.setStatus(pack.getStatus());
        save(oldPack);
    }

    @Override
    public void delete(Package pack) {
        packageRepository.delete(pack);
    }
    
}
