package com.yiqihai.vo;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

@Data
public class RegisteredCustomerVo {
    @NotEmpty
    private String cPhone;
    @NotEmpty
    private String cPassword;
    @NotEmpty
    private String cPassword2;
    @NotEmpty
    private String phoneCode;
}
