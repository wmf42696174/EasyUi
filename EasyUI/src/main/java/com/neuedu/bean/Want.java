package com.neuedu.bean;

/**
 * Created by Administrator on 2016-12-17.
 */
public class Want {

    private String id;

    private String buyername;

    private String goodname;

    private float price;

    private String description;

    private int wantnum;

    private int pagenum;

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    @Override
    public String toString() {
        return "Want{" +
                "id='" + id + '\'' +
                ", buyername='" + buyername + '\'' +
                ", goodname='" + goodname + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", wantnum=" + wantnum +
                ", pagenum=" + pagenum +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBuyername() {
        return buyername;
    }

    public void setBuyername(String buyername) {
        this.buyername = buyername;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getWantnum() {
        return wantnum;
    }

    public void setWantnum(int wantnum) {
        this.wantnum = wantnum;
    }
}
