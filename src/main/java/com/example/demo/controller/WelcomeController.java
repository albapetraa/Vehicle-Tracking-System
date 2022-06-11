/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Controller.java to edit this template
 */
package com.example.demo.controller;

import com.example.demo.dbService.CarRepository;
import com.example.demo.model.CarData;
import com.example.demo.model.VehicleOwner;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.dbService.VehicleOwnerRepository;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Emree
 */
@Controller
public class WelcomeController {

    @Autowired
    private CarRepository carRepo;
    @Autowired
    private VehicleOwnerRepository y;

    private String[] tarihDeneme;
    private String mevcutGun;
    private String mevcutSaat;
    private ArrayList<Integer> carIds = new ArrayList<Integer>();
    private String userName;

    @RequestMapping(value = "/welcome")
    public String loginPage(Map<String, Object> model, HttpServletRequest request) {

        if (request.getSession().getAttribute("sessionUser") == null) {
            return "redirect:/login";
        }
        HttpSession session = request.getSession();
        userName = (String) session.getAttribute("sessionUser");

        tarihDeneme = zaman().split(" ");
        mevcutGun = "2018-11-" + tarihDeneme[0].substring(8);//
        mevcutGun = "2018-10-01";// Sunum demosu için tarih manipüle edildi.
        mevcutSaat = tarihDeneme[1].substring(0, 5);
        System.out.println("Sistem zamanları: " + mevcutGun + " " + mevcutSaat);

        return "welcome";
    }

    @RequestMapping(value = "/anlik")
    public String currentLocPage(Map<String, Object> model, HttpServletRequest request, ModelMap mod) throws JsonProcessingException {
        if (request.getSession().getAttribute("sessionUser") == null) {
            return "redirect:/login";
        }

        carIds.clear();
        HttpSession session = request.getSession();
        userName = (String) session.getAttribute("sessionUser");
        tarihDeneme = zaman().split(" ");
        mevcutGun = "2018-11-" + tarihDeneme[0].substring(8);//
        mevcutGun = "2018-10-01";// Sunum demosu için tarih manipüle edildi.
        mevcutSaat = tarihDeneme[1].substring(0, 5);
        System.out.println("Sistem zamanları: " + mevcutGun + " " + mevcutSaat);
        mod.addAttribute("mevcutGun", mevcutGun);
        mod.addAttribute("mevcutSaat", mevcutSaat);

        List<VehicleOwner> n = y.findAll();

        for (int i = 0; i < n.size(); i++) {
            if (!n.get(i).getCarownername().equals(userName)) {
            } else {
                carIds.add(Integer.parseInt(n.get(i).getCarid()));
            }
        }

        ArrayList<CarData> car = carRepo.findPositionalParameters(mevcutGun, mevcutSaat);
        ArrayList<CarData> realCars = new ArrayList<CarData>();
        for (CarData a : car) {
            if ((a.getCarId() == carIds.get(0)) || (a.getCarId() == carIds.get(1))) {
                realCars.add(a);
            } else {

            }
        }
        mod.addAttribute("carCurrent", realCars);

        return "anlik";
    }

    @RequestMapping(value = "/sonkonumlar")
    public String sonkonumlar(Map<String, Object> model, HttpServletRequest request, ModelMap mod) {

        if (request.getSession().getAttribute("sessionUser") == null) {
            return "redirect:/login";
        }
        carIds.clear();
        HttpSession session = request.getSession();
        userName = (String) session.getAttribute("sessionUser");
        tarihDeneme = zaman().split(" ");
        mevcutGun = "2018-11-" + tarihDeneme[0].substring(8);//
        mevcutGun = "2018-10-01";// Sunum demosu için tarih manipüle edildi.
        mevcutSaat = tarihDeneme[1].substring(0, 5);
        System.out.println("Sistem zamanları: " + mevcutGun + " " + mevcutSaat);
        mod.addAttribute("mevcutGun", mevcutGun);
        mod.addAttribute("mevcutSaat", mevcutSaat);

        List<VehicleOwner> n = y.findAll();

        for (int i = 0; i < n.size(); i++) {
            if (!n.get(i).getCarownername().equals(userName)) {
            } else {
                carIds.add(Integer.parseInt(n.get(i).getCarid()));
            }
        }

        ArrayList<CarData> car = carRepo.findPositionalParameters(mevcutGun, mevcutSaat);
        ArrayList<CarData> realCars = new ArrayList<CarData>();
        for (CarData a : car) {
            if ((a.getCarId() == carIds.get(0)) || (a.getCarId() == carIds.get(1))) {
                realCars.add(a);
            } else {

            }
        }
        ArrayList<CarData> carLastThirtyMinutes = new ArrayList<CarData>();
        for (int i = 0; i < realCars.size(); i++) {
            System.out.println(realCars.get(i).toString());
            System.out.println(realCars.get(i).getCarId() + " Numaralı Aracın Son 30dklık Verisi---------");
            for (int j = realCars.get(i).getId() - 30; j < realCars.get(i).getId(); j++) {
                CarData dkveri = carRepo.findById(j);
                carLastThirtyMinutes.add(dkveri);
                System.out.println(dkveri.toString());
            }
        }
        mod.addAttribute("carLastThirty", carLastThirtyMinutes);
        mod.addAttribute("carIds", carIds);

        return "sonkonumlar";
    }

    @RequestMapping(value = "/gecmiskonum")
    public String gecmiskonum(Map<String, Object> model, HttpServletRequest request, ModelMap mod) {
        if (request.getSession().getAttribute("sessionUser") == null) {
            return "redirect:/login";
        }

        carIds.clear();
        HttpSession session = request.getSession();
        userName = (String) session.getAttribute("sessionUser");
        tarihDeneme = zaman().split(" ");
        mevcutGun = "2018-11-" + tarihDeneme[0].substring(8);//
        mevcutGun = "2018-10-01";// Sunum demosu için tarih manipüle edildi.
        mevcutSaat = tarihDeneme[1].substring(0, 5);
        System.out.println("Sistem zamanları: " + mevcutGun + " " + mevcutSaat);
        mod.addAttribute("mevcutGun", mevcutGun);
        mod.addAttribute("mevcutSaat", mevcutSaat);

        List<VehicleOwner> n = y.findAll();

        for (int i = 0; i < n.size(); i++) {
            if (!n.get(i).getCarownername().equals(userName)) {
            } else {
                carIds.add(Integer.parseInt(n.get(i).getCarid()));
            }
        }

        ArrayList<CarData> car = carRepo.findPositionalParameters(mevcutGun, mevcutSaat);
        ArrayList<CarData> realCars = new ArrayList<CarData>();
        for (CarData a : car) {
            if ((a.getCarId() == carIds.get(0)) || (a.getCarId() == carIds.get(1))) {
                realCars.add(a);
            } else {

            }
        }
        mod.addAttribute("carIds", carIds);

        return "gecmiskonum";
    }

    @RequestMapping(value = "/gecmiskonum", method = RequestMethod.POST)
    public String sorgu(Map<String, Object> model, HttpServletRequest request, ModelMap mod, @RequestParam(required = false, name = "startDate") String tarih,
            @RequestParam(required = false, name = "carselect") String carid, @RequestParam(required = false, name = "startTime") String baslangic,
            @RequestParam(required = false, name = "endTime") String bitis) {
        if (request.getSession().getAttribute("sessionUser") == null) {
            return "redirect:/login";
        }
        System.out.println("POST METHODDAN ALINAN Tarih: " + tarih + " CarId: " + carid + " StartTime: " + baslangic + " EndTime: " + bitis);

        ArrayList<CarData> cd1 = carRepo.findPositionalParameters2(tarih, baslangic, Integer.parseInt(carid));
        ArrayList<CarData> cd2 = carRepo.findPositionalParameters2(tarih, bitis, Integer.parseInt(carid));
        if ((cd1.size() == 0) || cd2.size() == 0) {
            mod.addAttribute("hata", "İstediğiniz aralıkta kesin veri bulunamamaktadır. Dilerseniz saat aralığını değiştirerek verilere erişebilirsiniz.");
            return "sorgulama";
        }
        int q = cd2.get(0).getId() - cd1.get(0).getId();
        System.out.println("kaçdata var: " + q);
        ArrayList<CarData> carMarkers = new ArrayList<CarData>();
        carMarkers.add(cd1.get(0));
        for (int i = cd1.get(0).getId() + 1; i < cd2.get(0).getId(); i++) {
            CarData temp = carRepo.findById(i);
            carMarkers.add(temp);
        }
        mod.addAttribute("carMarkers", carMarkers);

        carIds.clear();
        HttpSession session = request.getSession();
        userName = (String) session.getAttribute("sessionUser");
        tarihDeneme = zaman().split(" ");
        mevcutGun = "2018-11-" + tarihDeneme[0].substring(8);//
        mevcutGun = "2018-10-01";// Sunum demosu için tarih manipüle edildi.
        mevcutSaat = tarihDeneme[1].substring(0, 5);
        System.out.println("Sistem zamanları: " + mevcutGun + " " + mevcutSaat);
        mod.addAttribute("mevcutGun", mevcutGun);
        mod.addAttribute("mevcutSaat", mevcutSaat);

        return "sorgulama";
    }

    public String zaman() {
        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        return currentTime;
    }

}
