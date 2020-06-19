package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;

public class Amerce {

    private Integer amerce_id;
    private Integer is_pay;
    private String is_payStr;
    private String student_id;
    private String name;
    private String book_name;
    private String book_Num;
    private Double money;

    private String pay_timeStr;
    private Date pay_time;

    public Date getPay_time() {
        return pay_time;
    }

    public void setPay_time(Date pay_time) {
        this.pay_time = pay_time;
    }

    public String getPay_timeStr() {

        if (pay_time == null) {
            pay_timeStr = "尚未支付";
        } else {
            TimeUtils timeUtils = new TimeUtils();
            pay_timeStr = timeUtils.DateToString(pay_time);
        }

        return pay_timeStr;
    }

    public void setPay_timeStr(String pay_timeStr) {
        this.pay_timeStr = pay_timeStr;
    }

    public Integer getAmerce_id() {
        return amerce_id;
    }

    public void setAmerce_id(Integer amerce_id) {
        this.amerce_id = amerce_id;
    }

    public Integer getIs_pay() {
        return is_pay;
    }

    public void setIs_pay(Integer is_pay) {
        this.is_pay = is_pay;
    }

    public String getIs_payStr() {
        if (is_pay == 0) {
            is_payStr = "未支付";
        } else if (is_pay == 1) {
            is_payStr = "已支付";
        }
        return is_payStr;
    }

    public void setIs_payStr(String is_payStr) {
        this.is_payStr = is_payStr;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_Num() {
        return book_Num;
    }

    public void setBook_Num(String book_Num) {
        this.book_Num = book_Num;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}
