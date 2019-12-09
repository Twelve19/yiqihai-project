package com.yiqihai.dao;

import com.yiqihai.entity.CustomerInfo;

/**
 * 用于对用户的一些增删查改操作
 */
public interface CustomerDao {
    //注册账号
    int insertCustomer(CustomerInfo customerInfo);

    //账号密码登录
    CustomerInfo customerLogin(CustomerInfo customerInfo);

    //手机号登录
    CustomerInfo phoneLogin(String phoneNumber);

    //查询单条信息
    CustomerInfo queryCustomer(String cNumber);

    //修改个人信息
    int updateCustomer(CustomerInfo customerInfo);
}
