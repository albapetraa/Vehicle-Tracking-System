/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo.mqService;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 *
 * @author Emree
 */
@Service
@EnableScheduling
public class Zamanli {

    @Autowired
    private RabbitTemplate template;

    // her 1 dakikada calısır
    // Sistemin modülleri düzgün calısıyorsa calısmaya devam eder.
    @Scheduled(cron = "0 0/1 * * * ?")
    public void boo() {
        System.out.println("Sistem modülleri düzgün çalışmakta");
//        template.convertAndSend(MessagingConfig.EXCHANGE, MessagingConfig.ROUTING_KEY, "HER 1DKDA 1calısan sey");

    }
}
