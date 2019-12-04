package com.yiqihai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping("")
    public ModelAndView loadIndex(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/loadCustomerAdd")
    public ModelAndView loadAdd(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("customer/add");
        return modelAndView;
    }
}
