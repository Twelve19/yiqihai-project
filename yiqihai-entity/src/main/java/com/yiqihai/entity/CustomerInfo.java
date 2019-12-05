package com.yiqihai.entity;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

/**
 * 客户信息类
 */
@Data
public class CustomerInfo {
    private Integer cId;    //客户编号
    @NotEmpty
    private String cNumber; //账号
    @NotEmpty
    private String cPassword;   //密码
    private String cCard;   //身份证
    private String cDriving;    //驾驶证
    private String cPhone;  //手机号码
    private String cName;   //姓名
    private String cSex;    //性别
    private String cMemberid;   //会员编号
}
