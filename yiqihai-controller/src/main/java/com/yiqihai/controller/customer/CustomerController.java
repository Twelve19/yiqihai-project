package com.yiqihai.controller.customer;

import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import com.yiqihai.util.CustomerNumberUtils;
import com.yiqihai.util.SendSms;
import com.yiqihai.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //用户登录
    @RequestMapping("/loginforNumber")
    @ResponseBody
    public ResponseVo login(@Valid CustomerInfo customerInfo, BindingResult bindingResult, HttpSession session){
        ResponseVo responseVo = new ResponseVo();
        if(bindingResult.hasErrors()){
            responseVo.setCode("500");
            responseVo.setMsg("账号密码不能为null");
        }else {
            CustomerInfo customer = customerService.customerLogin(customerInfo);
            if(customer!=null){
                responseVo.setCode("200");
                responseVo.setMsg("登录成功");
                responseVo.setData(customer);
                session.setAttribute("cNumber",customer.getCNumber());
                return responseVo;
            }else {
                responseVo.setCode("500");
                responseVo.setMsg("账号密码不正确");
            }

        }
        return responseVo;
    }

    //获取验证码
    @RequestMapping("/getcode")
    @ResponseBody
    public ResponseVo get_PhoneCode(String phone,HttpSession session){

        ResponseVo responseVo = new ResponseVo();
        responseVo.setCode("200");
        responseVo.setData(SendSms.sendSms(phone));
        responseVo.setMsg("获取手机验证码");
        session.setAttribute("phoneCode",responseVo.getData());
        return responseVo;
    }

    //手机号码登录
    @RequestMapping("/loginforPhone")
    @ResponseBody
    public ResponseVo login_forPhone(String phoneNumber,String phoneCode,HttpSession session){
        ResponseVo responseVo = new ResponseVo();

        //验证码输入正确
        if(session.getAttribute("phoneCode").equals(phoneCode)){
            CustomerInfo customerInfo = customerService.phoneLogin(phoneNumber);
            if (customerInfo!= null){
                //登录成功
                session.setAttribute("cNumber",customerInfo.getCNumber());
                responseVo.setCode("200");
                responseVo.setMsg("登录成功");
                responseVo.setData(customerInfo);
            }else {
                //登录失败
                responseVo.setCode("500");
                responseVo.setMsg("请检查手机号是否正确");
            }
        }
        //验证码输入错误
        else {
            responseVo.setCode("400");
            responseVo.setMsg("验证码输入错误");
        }
        return responseVo;
    }

    //用户信息查询，返回json数据
    @RequestMapping("/queryCustomer")
    @ResponseBody
    public ResponseVo queryCustomer(HttpSession session){
        System.out.println("用户信息查询");
        ResponseVo responseVo = new ResponseVo();
        if (session.getAttribute("cNumber")!= null){
            System.out.println("session中存在用户信息");


            CustomerInfo customer = customerService.queryCustomer((String) session.getAttribute("cNumber"));
            if(customer != null){
                responseVo.setCode("200");
                responseVo.setMsg("查询信息成功");
                responseVo.setData(customer);
            }else {
                responseVo.setCode("500");
                responseVo.setMsg("查询失败");
            }
        }else {
            responseVo.setCode("500");
            responseVo.setMsg("您还未登录");
        }
        return responseVo;
    }
}
