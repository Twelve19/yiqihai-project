package com.yiqihai.service;

import com.yiqihai.entity.CustomerInfo;

public interface CustomerService {

    int insertCustomer(CustomerInfo customerInfo);

    CustomerInfo customerLogin(CustomerInfo customerInfo);

    CustomerInfo phoneLogin(String phoneNumber);

    CustomerInfo queryCustomer(String cNumber);
}
