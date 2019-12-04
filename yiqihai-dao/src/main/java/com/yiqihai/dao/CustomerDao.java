package com.yiqihai.dao;

import com.yiqihai.entity.CustomerInfo;

/**
 * 用于对用户的一些增删查改操作
 */
public interface CustomerDao {

    int insertCustomer(CustomerInfo customerInfo);

    CustomerInfo customerLogin(CustomerInfo customerInfo);
}
