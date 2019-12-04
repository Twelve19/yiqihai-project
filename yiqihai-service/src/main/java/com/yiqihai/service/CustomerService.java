package com.yiqihai.service;

import com.yiqihai.entity.CustomerInfo;

public interface CustomerService {

    boolean insertCustomer(CustomerInfo customerInfo);

    CustomerInfo customerLogin(CustomerInfo customerInfo);
}
