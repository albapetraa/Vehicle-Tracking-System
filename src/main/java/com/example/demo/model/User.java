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
@Table(name = "users")

public class User {

    @Id
    @Column(name = "userid")
    private Integer userId;

    @Column(name = "username")
    private String userName;

    @Column(name = "userpass")
    private String userPass;

    @Column(name = "userwrongpasscount")
    private int userWrongPass;
    
    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public int getUserWrongPass() {
        return userWrongPass;
    }

    public void setUserWrongPass(int userWrongPass) {
        this.userWrongPass = userWrongPass;
    }

}
