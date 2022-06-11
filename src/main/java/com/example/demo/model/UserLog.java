/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Emree
 */
@Entity
@Table(name = "userlogs")

public class UserLog {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int activityId;

    @Column(name = "username")
    private String userName;

    @Column(name = "useractivitynumber")
    private int userActNumber;

    @Column(name = "activitydate", columnDefinition = "DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;

    public UserLog() {
    }

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserActNumber() {
        return userActNumber;
    }

    public void setUserActNumber(int userActNumber) {
        this.userActNumber = userActNumber;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "GeneratedId: [" + activityId + "] userName: [" + userName + "] userActivityNumber: [" + userActNumber + "] userActivityTime: [" + time + "]";
    }

}
