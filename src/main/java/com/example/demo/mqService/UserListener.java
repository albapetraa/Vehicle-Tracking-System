/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.mqService;

import com.example.demo.dbService.CarRepository;
import com.example.demo.model.CarData;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Emree
 */
@Component
public class UserListener {

    @Autowired
    private CarRepository carRepo;

    @RabbitListener(queues = MessagingConfig.QUEUE)
    public void consumeMessageFromQueue(CarData s) {
        carRepo.save(s);
        
//        System.out.println("Message recieved from queue : " + s.getCarDate()+" "+s.getCarTime());
    }
}
