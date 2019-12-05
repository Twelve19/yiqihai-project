package com.yiqihai.service.impl;

import com.yiqihai.dao.CustomerDao;
import com.yiqihai.dao.MemberDao;
import com.yiqihai.entity.CustomerInfo;
import com.yiqihai.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private MemberDao memberDao;
    //增加用户
    @Transactional
    public boolean insertCustomer(CustomerInfo customerInfo) {
        int mresult = memberDao.insertMember(customerInfo.getCNumber());
        int cresult = customerDao.insertCustomer(customerInfo);
        if(mresult >0 && cresult >0){
            return true;
        }
        return false;
    }

    public CustomerInfo customerLogin(CustomerInfo customerInfo) {
        return customerDao.customerLogin(customerInfo);
    }

    public CustomerInfo phoneLogin(String phoneNumber) {
        return customerDao.phoneLogin(phoneNumber);
    }
}
