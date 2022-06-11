/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Repository.java to edit this template
 */
package com.example.demo.dbService;

import com.example.demo.model.VehicleOwner;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Emree
 */
public interface VehicleOwnerRepository extends JpaRepository<VehicleOwner, String> {
    
}
