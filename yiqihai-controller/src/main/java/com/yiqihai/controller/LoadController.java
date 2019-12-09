package com.yiqihai.controller;

import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/load")
public class LoadController {
    @Autowired
    private CustomerService customerService;

    //用户注册界面
    @RequestMapping("/customer/add")
    public String loadCustomerAdd(){
        return "customer/add";
    }

    //主页面
    @RequestMapping("/index")
    public String loadIndex(){
        return "index";
    }

    //用户修改资料界面
    @RequestMapping("/customer/update")
    public String loadCustomerUpdate(String cNumber){
        return "customer/update";
    }
}
