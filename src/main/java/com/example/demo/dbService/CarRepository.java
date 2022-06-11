/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.dbService;

import com.example.demo.model.CarData;
import java.util.ArrayList;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

/**
 *
 * @author Emree
 */
public interface CarRepository extends MongoRepository<CarData, Integer> {

    @Query("{'carDate' : ?0, 'carTime' : ?1}")
    ArrayList<CarData> findPositionalParameters(String carDate, String carTime);

    @Query("{'carDate' : ?0, 'carTime' : ?1, 'carId' :?2}")
    ArrayList<CarData> findPositionalParameters2(String carDate, String carTime, int carId);

    CarData findById(int id);

}
