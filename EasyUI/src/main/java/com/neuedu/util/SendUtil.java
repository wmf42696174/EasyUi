package com.neuedu.util;

import org.springframework.stereotype.Repository;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

/**
 * Created by Administrator on 2016-12-28.
 */
@Repository
public class SendUtil {
    public String SendMail(String email) throws Exception{
        //声明properties对象用于放信息
        Properties prop=new Properties();
        //设置连接哪一台服务器
        prop.setProperty("mail.host","smtp.163.com");
        //设置是否要验证
        prop.setProperty("mail.smtp.auth","true");

        //  构建授权信息，用于进行SMTP进行身份验证
        Authenticator auth=new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //返回用户和密码的对象
                PasswordAuthentication pa=new PasswordAuthentication("18893029215","424123.wmf");
                return pa;
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session session= Session.getDefaultInstance(prop,auth);
        //设置session的调试模式
        session.setDebug(true);
        // 创建邮件消息
        MimeMessage mme=new MimeMessage(session);
        Address from=new InternetAddress("18893029215@163.com");
        //设置邮件发送人
        mme.setFrom(from);
        //设置邮件收件人
        mme.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
        //设置邮件抄送人
        mme.setRecipient(Message.RecipientType.CC,new InternetAddress("2521689738@qq.com"));
        mme.setSubject("验证码");
        Random random = new Random();
        String result="";
        for(int i=0;i<6;i++){
            result+=random.nextInt(10);
        }
        mme.setContent(result,"text/plain;charset=utf-8");
        Transport.send(mme);
        return result;
    }
}
