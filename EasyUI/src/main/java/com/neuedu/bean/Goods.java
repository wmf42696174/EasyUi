package com.neuedu.bean;

/**
 * Created by Administrator on 2016-12-17.
 */
public class Goods {
    private String id;

    private int num; //数量

    private String name;

    private float price;

    private int type; //1代表学习用品，2代表生活用品，3代表电子设备，4其他

    private String mark; //商品说明

    private int flag;//商品是否通过审核 1通过，0失败

    private String userid;// 发布人id

     private int pagenum;

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id='" + id + '\'' +
                ", num=" + num +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", type=" + type +
                ", mark='" + mark + '\'' +
                ", flag=" + flag +
                ", userid='" + userid + '\'' +
                ", pagenum=" + pagenum +
                '}';
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
}
