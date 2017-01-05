package com.neuedu.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2016-12-17.
 */
public class Record {

    private String id; //记录id
    private String gname;//商品名称
    private float gprice;//商品价值
    private int gnum;//交易数量
    private  float gsum;//交易金额
    private  String buyername;//买家
    private String salename;//卖家
    @DateTimeFormat(pattern="yyyyMMddHHmmss")
    private Date times;//交易时间
    private int pagenum;

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return "Record{" +
                "id='" + id + '\'' +
                ", gname='" + gname + '\'' +
                ", gprice=" + gprice +
                ", gnum=" + gnum +
                ", gsum=" + gsum +
                ", buyername='" + buyername + '\'' +
                ", salename='" + salename + '\'' +
                ", times=" + times +
                ", pagenum=" + pagenum +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public float getGprice() {
        return gprice;
    }

    public void setGprice(float gprice) {
        this.gprice = gprice;
    }

    public int getGnum() {
        return gnum;
    }

    public void setGnum(int gnum) {
        this.gnum = gnum;
    }

    public float getGsum() {
        return gsum;
    }

    public void setGsum(float gsum) {
        this.gsum = gsum;
    }

    public String getBuyername() {
        return buyername;
    }

    public void setBuyername(String buyername) {
        this.buyername = buyername;
    }

    public String getSalename() {
        return salename;
    }

    public void setSalename(String salename) {
        this.salename = salename;
    }


}
