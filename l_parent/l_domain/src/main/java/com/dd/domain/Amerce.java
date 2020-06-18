package com.dd.domain;

public class Amerce {

    private Integer amerce_id;
    private Integer is_pay;
    private String is_payStr;
    private String student_id;
    private String name;
    private String book_name;
    private String book_Num;
    private Double money;


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
