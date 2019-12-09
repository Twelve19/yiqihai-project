package com.yiqihai.controller.customer;

import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import com.yiqihai.util.CustomerNumberUtils;
import com.yiqihai.vo.RegisteredCustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/registered")
public class RegisteredController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/customer")
    public ModelAndView registeredCustomer(@Valid RegisteredCustomerVo registeredCustomerVo
    , BindingResult bindingResult, HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("forward:/load/customer/add");
        if(bindingResult.hasErrors()){
            modelAndView.addObject("err","请将信息填写完整");
        }else {
            //验证码正确
            //支付宝短信限制先搞掉
            if(httpSession.getAttribute("phoneCode").equals(registeredCustomerVo.getPhoneCode())){
                //两次密码一致
                if(registeredCustomerVo.getCPassword().equals(registeredCustomerVo.getCPassword2())){
                    //添加
                    CustomerInfo customerInfo = new CustomerInfo();
                    customerInfo.setCNumber(CustomerNumberUtils.getCustomerNumber());
                    customerInfo.setCPassword(registeredCustomerVo.getCPassword());
                    customerInfo.setCPhone(registeredCustomerVo.getCPhone());

                    int result = customerService.insertCustomer(customerInfo);
                    if (result > 0){
                        modelAndView.setViewName("index");
                    }
                }
                else {
                    modelAndView.addObject("err","两次密码不一致");
                }
            }
            //验证码错误
            else {
                modelAndView.addObject("err","验证码错误");
            }
        }
        return modelAndView;
    }


}
