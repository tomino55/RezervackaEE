package com.kacmar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

/**
 * Created by tomas on 17.3.2016.
 */

@Controller
public class HomeController {

    boolean logged = true;
    int i = 0;
    @RequestMapping("/")
    public String welcome(Model model) {
        i++;
        model.addAttribute("message", "Welcome	to	Web	Store!");
        model.addAttribute("username", i);
        return "welcome";
    }

    @RequestMapping("/welcome")
    public String wel(Model model){
        if(this.logged){
            model.addAttribute("message", "Welcome");
            model.addAttribute("username", "Tomas");
        }
        else{
            model.addAttribute("message", "Not Logged");
        }
        return "welcome";
    }
}
