package com.yiqihai.service.impl;

import com.yiqihai.dao.CustomerDao;
import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    //增加用户
    @Transactional
    public int insertCustomer(CustomerInfo customerInfo) {
        return customerDao.insertCustomer(customerInfo);
    }
    //账号密码登录
    public CustomerInfo customerLogin(CustomerInfo customerInfo) {
        return customerDao.customerLogin(customerInfo);
    }
    //手机验证码登录
    public CustomerInfo phoneLogin(String phoneNumber) {
        return customerDao.phoneLogin(phoneNumber);
    }
    //查询单个用户
    public CustomerInfo queryCustomer(String cNumber){
        return customerDao.queryCustomer(cNumber);
    }
}
