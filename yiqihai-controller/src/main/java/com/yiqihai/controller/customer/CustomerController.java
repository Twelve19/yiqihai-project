package com.yiqihai.controller.customer;

import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import com.yiqihai.util.CustomerNumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //添加用户
    @RequestMapping("/add")
    public ModelAndView addCustomer(CustomerInfo customerInfo){
        ModelAndView modelAndView = new ModelAndView();
        customerInfo.setCNumber(CustomerNumberUtils.getCustomerNumber());
        customerInfo.setCMemberid(customerInfo.getCNumber());
        boolean result = customerService.insertCustomer(customerInfo);
        if(result){
            modelAndView.setViewName("index");
        }else {
            modelAndView.setViewName("customer/add");
        }
        return modelAndView;
    }
    //用户登录
    @RequestMapping("/login")
    public ModelAndView login(CustomerInfo customerInfo, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        CustomerInfo customer = customerService.customerLogin(customerInfo);
        if(customer != null){
            modelAndView.setViewName("index");
            session.setAttribute("customerNumber",customer.getCNumber());
        }else {
            modelAndView.setViewName("forward:/load//Customer/login");
        }
        return modelAndView;
    }
}
