/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Emree
 */
@Entity
@Table(name = "carowners")
public class VehicleOwner {

    @Column(name = "carownerid")
    private String carownername;
    @Id
    @Column(name = "carid")
    private String carid;

    public VehicleOwner() {
    }

    public String getCarownername() {
        return carownername;
    }

    public void setCarownername(String carownername) {
        this.carownername = carownername;
    }

    public String getCarid() {
        return carid;
    }

    public void setCarid(String carid) {
        this.carid = carid;
    }

    

}
