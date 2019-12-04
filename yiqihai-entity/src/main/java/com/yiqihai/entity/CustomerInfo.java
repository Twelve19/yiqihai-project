package com.yiqihai.entity;

import lombok.Data;

/**
 * 客户信息类
 */
@Data
public class CustomerInfo {
    private Integer cId;    //客户编号
    private String cNumber; //账号
    private String cPassword;   //密码
    private String cCard;   //身份证
    private String cDriving;    //驾驶证
    private String cPhone;  //手机号码
    private String cName;   //姓名
    private String cSex;    //性别
    private String cMemberid;   //会员编号

//    private CustomerInfo(CustomerInfoBuilder customerInfoBuilder) {
//        this.cId = customerInfoBuilder.cId;
//        this.cNumber =customerInfoBuilder.cNumber;
//        this.cPassword = customerInfoBuilder.cPassword;
//        this.cCard = customerInfoBuilder.cCard;
//        this.cDriving = customerInfoBuilder.cDriving;
//        this.cPhone = customerInfoBuilder.cPhone;
//        this.cName =customerInfoBuilder.cName;
//        this.cSex = customerInfoBuilder.cSex;
//        this.cMemberid = customerInfoBuilder.cMemberid;
//    }
//
//    public static class CustomerInfoBuilder{
//        private Integer cId;    //客户编号
//        private String cNumber; //账号
//        private String cPassword;   //密码
//        private String cCard;   //身份证
//        private String cDriving;    //驾驶证
//        private String cPhone;  //手机号码
//        private String cName;   //姓名
//        private String cSex;    //性别
//        private String cMemberid;   //会员编号
//
//        //必填字段，账号使用工具类生成，客户编号自增
//        public CustomerInfoBuilder(String cPassword,String cCard,String cDriving,String cPhone,String cName){
//            this.cPassword = cPassword;
//            this.cCard = cCard;
//            this.cDriving = cDriving;
//            this.cPhone = cPhone;
//            this.cName = cName;
//        }
//
//        public CustomerInfoBuilder cNumber(String cNumber){
//            this.cNumber = cNumber;
//            return this;
//        }
//
//        public CustomerInfoBuilder cSex(String cSex){
//            this.cSex = cSex;
//            return this;
//        }
//
//        public CustomerInfoBuilder cMemberid(String cMemberid){
//            this.cMemberid = cMemberid;
//            return this;
//        }
//
//        public CustomerInfo builder(){
//            return new CustomerInfo(this);
//        }
//    }

}
