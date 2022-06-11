/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.model;

import java.io.Serializable;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Emree
 */
@Document(collection = "Cardata")
public class CarData implements Serializable {

    @Id
    private int id;

    private int carId;
    private String carDate;
    private String carTime;
    private double carLat;
    private double carLng;

    public CarData(String carDate, String carTime, double carLat, double carLng, int carId) {
        this.carDate = carDate;
        this.carTime = carTime;
        this.carLat = carLat;
        this.carLng = carLng;
        this.carId = carId;
    }

    public CarData() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarDate() {
        return carDate;
    }

    public void setCarDate(String carDate) {
        this.carDate = carDate;
    }

    public String getCarTime() {
        return carTime;
    }

    public void setCarTime(String carTime) {
        this.carTime = carTime;
    }

    public double getCarLat() {
        return carLat;
    }

    public void setCarLat(double carLat) {
        this.carLat = carLat;
    }

    public double getCarLng() {
        return carLng;
    }

    public void setCarLng(double carLng) {
        this.carLng = carLng;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    @Override
    public String toString() {
        return "dataId["+id+"] Gün: [" + carDate + "] Saat: [" + carTime + "] Lat: [" + carLat + "] Lng: [" + carLng + "] VehicleID: [" + carId + "]";

    }

}
