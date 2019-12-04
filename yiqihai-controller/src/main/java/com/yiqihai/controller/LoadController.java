package com.yiqihai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/load")
public class LoadController {
    //用户登录界面
    @RequestMapping("/Customer/login")
    public String loadCustomerLogin(){
        return "customer/login";
    }
}
