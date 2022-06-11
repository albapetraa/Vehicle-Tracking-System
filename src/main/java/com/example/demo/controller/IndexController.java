package com.example.demo.controller;

import com.example.demo.model.CarData;
import com.example.demo.mqService.MessagingConfig;
import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvValidationException;
import com.example.demo.dbService.CarRepository;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private RabbitTemplate template;

    @Autowired
    private CarRepository carRepo;

    @RequestMapping("/")
    public String home(Map<String, Object> model) throws IOException, CsvValidationException {

        var fileName = "C:\\Users\\Emree\\Desktop/arabalar2.txt";

        Path path = Paths.get(fileName);

        String[] line;

        CSVParser parser = new CSVParserBuilder()
                .withSeparator(';')
                .withIgnoreQuotations(true)
                .build();

        CSVReader reader = new CSVReaderBuilder(Files.newBufferedReader(path))
                .withCSVParser(parser)
                .build();

        try {
            reader.readNext();
            int i = 0;
            while ((line = reader.readNext()) != null) {
                String[] s = line;
//                System.out.println("Gün: [" + s[0] + "] Lat: [" + s[1] + "] Lng: [" + s[2] + "] VehicleID: [" + s[3] + "]");

                String[] tarihDeneme = s[0].split(" ");
                String mevcutGun = tarihDeneme[0];
                String mevcutSaat = tarihDeneme[1].substring(0, 5);
                CarData data = new CarData(mevcutGun, mevcutSaat, Double.parseDouble(s[1]), Double.parseDouble(s[2]), Integer.parseInt(s[3]));
                data.setId(i);

                if (carRepo.existsById(data.getId())) {
                    return "index";
                }

                template.convertAndSend(MessagingConfig.EXCHANGE, MessagingConfig.ROUTING_KEY, data);

                i = i + 1;

            }
        } catch (CsvValidationException | IOException e1) {
            e1.printStackTrace();
        }

        return "index";
    }

}
