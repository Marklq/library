package com.dd.domain;

import java.util.Date;

public class Book {
    private String book_Id;
    private String book_name;
    private String author;
    private String press;

    private Integer book_type;
    private Integer is_borrow;

    private Double price;

    private Date publish_date;
    //    private Date register_time;


    @Override
    public String toString() {
        return "Book{" +
                "book_Id='" + book_Id + '\'' +
                ", book_name='" + book_name + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", book_type=" + book_type +
                ", is_borrow=" + is_borrow +
                ", price=" + price +
                ", publish_date=" + publish_date +
                '}';
    }

    public String getBook_Id() {
        return book_Id;
    }

    public void setBook_Id(String book_Id) {
        this.book_Id = book_Id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public Integer getBook_type() {
        return book_type;
    }

    public void setBook_type(Integer book_type) {
        this.book_type = book_type;
    }

    public Integer getIs_borrow() {
        return is_borrow;
    }

    public void setIs_borrow(Integer is_borrow) {
        this.is_borrow = is_borrow;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(Date publish_date) {
        this.publish_date = publish_date;
    }
}
