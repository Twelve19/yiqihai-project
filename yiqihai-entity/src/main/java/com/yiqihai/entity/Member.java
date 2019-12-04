package com.yiqihai.entity;

import lombok.Data;

import java.util.Date;

/**
 * 会员表
 * lombok懒人生成setter和getter方式
 */
@Data
public class Member {
    private String mId; //会员编号
    private Integer mIntegral;  //会员积分
    private Integer mGrade; //会员等级
    private Date mCreation; //创建时间
    private Date mLastusetime;  //上次使用时间
    private Integer mState; //状态

}
