/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/springframework/Controller.java to edit this template
 */
package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.UserLog;
import com.example.demo.model.UserLogRepository;
import com.example.demo.model.UserRepository;
import java.text.ParseException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Emree
 */
@Controller
public class LoginController {

    @Autowired
    private UserRepository repo;
    @Autowired
    private UserLogRepository repo2;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Map<String, Object> model, HttpServletRequest request) {
        if (request.getSession().getAttribute("sessionUser") != null) {
            return "redirect:/welcome";
        }
        boolean userCheck = false;

        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Map<String, Object> model, Model mod, @RequestParam(value = "userName", required = true) String userName,
            @RequestParam(value = "userPassword", required = true) String userPassword, HttpServletRequest request) throws ParseException {

        boolean userCheck = false;
        User n = new User();
        n.setUserName(userName);
        n.setUserPass(userPassword);
        n.setUserWrongPass(0);

        User findUs = repo.findByuserName(n.getUserName());

        if (findUs == null) {
            userCheck = true;
            model.put("userCheck", userCheck);
            return "login";

        }
        int wrongCount = findUs.getUserWrongPass();
        if (wrongCount >= 3) {
            System.out.println("Kullanıcı şifresi birçok kez yanlış girildiği için deaktif.");
            model.put("wrongCount", findUs.getUserWrongPass());
            return "login";
        } else if (findUs.getUserPass().equals(n.getUserPass())) {
            System.out.println("Kullanıcı Şifre ve Name dogru");
            HttpSession session = request.getSession();
            session.setAttribute("sessionUser", findUs.getUserName());

            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = sdf.format(dt);
            UserLog userLog = new UserLog();
            userLog.setUserName(userName);
            userLog.setUserActNumber(1);
            userLog.setTime(dt);

            String[] tarihDeneme = currentTime.split(" ");
            String mevcutGun = tarihDeneme[0].substring(8);
            String mevcutSaat = tarihDeneme[1].substring(0, 5);

            System.out.println("Mevcut gun: " + mevcutGun + " Mevcut Saat: " + mevcutSaat);

            repo2.save(userLog);

            return "redirect:/welcome";

        } else if (!findUs.getUserPass().equals(n.getUserPass())) {
            System.out.println("Kullanıcı şifresi yanlış. Count bir arttırılıyor.");
            findUs.setUserWrongPass(findUs.getUserWrongPass() + 1);
            repo.save(findUs);
            model.put("wrongCount", findUs.getUserWrongPass());
            return "login";

        }
        return "login";
    }

    @RequestMapping("/logout")
    public String page(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userName = session.getAttribute("sessionUser").toString();

        session.setAttribute("sessionUser", null);

        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        UserLog userLog = new UserLog();
        userLog.setUserName(userName);
        userLog.setUserActNumber(0);
        userLog.setTime(dt);
        repo2.save(userLog);
        return "redirect:/login";
    }

}
