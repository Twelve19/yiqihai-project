package com.yiqihai.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 发送QQ邮件
 */
public class SendEmail {
    public void sendQQEamil(String email,String msg){
        /**
         *  第一步，确定连接
         *  因为这一步骤涉及到的信息比较多，所以这里用Properties保存，在接下来使用的时候会很方便，直接在Properties环境下创建邮件
         * */
        final Properties props=new Properties();  //记录邮箱的一些属性
        props.put("mail.smtp.auth", "true");  //表示使用SMTP发送邮件，须经过身份验证
        props.put("mail.smtp.host", "smtp.qq.com");  //此处填写SMTP服务器，我们是用QQ，所以写QQ邮箱的服务器
        props.put("mail.smtp.port", "587");  //端口号，QQ邮箱提供了两个端口，随意选一个，此处用587



        /**
         *  第二步，验证/获得权限
         *  构建授权信息，用于SMTP身份验证
         * */
        Authenticator authenticator = new Authenticator() {
            //返回一个PasswordAuthentication类型的对象
            protected PasswordAuthentication getPasswordAuthentication() {
                String userName = props.getProperty("mail.user");
                String userPwd = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, userPwd);  //将读取到的用户名和密码拿过来
            }
        };


        /**
         *  第三步，创建邮件
         *  使用环境属性和授权信息，创建邮件会话
         * */
        Session mailSession = Session.getInstance(props, authenticator);
        MimeMessage message = new MimeMessage(mailSession);  //通过Session对象创建邮件消息


        /**
         *  第四步，设置发件人
         * */
        InternetAddress sendUser = null;
        try {
            sendUser = new InternetAddress(props.getProperty("mail.user"));
            message.setFrom(sendUser);  //通过MimeMessage对象的setFrom()方法设置发件人，需要一个InternetAddress对象
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        /**
         *  第五步，设置收件人
         * */
        InternetAddress getUser = null;
        try {
            getUser = new InternetAddress(email);

	            /* Address[] addresses=new Address[]{
	                    new InternetAddress("收件人@qq.com")
	            };*/
            //Address[] addresses=new Address[]{InternetAddress对象};
            //Message.RecipientType.TO代表收件人
            //Message.RecipientType.CC代表抄送
            //Message.RecipientType.BCC代表暗送  用于群发的时候，不让别人看到其他的收件人
            //第二个参数是收件人的地址，也可以是一个Address[]数组，用于群发的场景,群发用message.setRecipients(Message.RecipientType.TO, Address[])
            message.setRecipient(Message.RecipientType.TO, getUser);  //通过MimeMessage对象的setRecipient()方法设置收件人，需要一个InternetAddress对象
        } catch (MessagingException e) {
            e.printStackTrace();
        }


        /**
         *  第六步，设置邮件标题和内容
         * */
        try {
            // 设置邮件标题
            message.setSubject("一起嗨租车");
            // 设置邮件的内容体
            message.setContent(msg, "text/html;charset=UTF-8");
            //附件
            //message.setFileName("E:\\test\\Demo.zip");
            /**
             *  最后一步，发送邮件，需要一个邮件对象作为参数
             * */
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


}
