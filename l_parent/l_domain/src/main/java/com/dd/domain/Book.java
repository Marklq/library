package com.dd.domain;

import com.dd.utils.BookUtils;
import com.dd.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Book {
    private String book_id;
    private String book_name;
    private String author;
    private String press;

    private Integer book_type;
    private String book_typeStr;
    private Integer is_borrow;
    private String is_borrowStr;

    private Double price;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publish_date;
    private String publish_dateStr;
    //注册时间
    private Date register_time;

    private Integer borrow_times;
    private String book_Num;


    @Override
    public String toString() {
        return "Book{" +
                "book_id='" + book_id + '\'' +
                ", book_name='" + book_name + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", book_type=" + book_type +
                ", book_typeStr='" + book_typeStr + '\'' +
                ", is_borrow=" + is_borrow +
                ", is_borrowStr='" + is_borrowStr + '\'' +
                ", price=" + price +
                ", publish_date=" + publish_date +
                ", publish_dateStr='" + publish_dateStr + '\'' +
                ", register_time=" + register_time +
                ", borrow_times=" + borrow_times +
                ", book_Num='" + book_Num + '\'' +
                '}';
    }

    /**
     * 判断是否借出
     *
     * @return
     */
    public String getIs_borrowStr() {
        if (is_borrow == 0) {
            is_borrowStr = "已借出";
        } else if (is_borrow > 0) {
            is_borrowStr = "可借";
        }

        return is_borrowStr;
    }

    public void setIs_borrowStr(String is_borrowStr) {
        this.is_borrowStr = is_borrowStr;
    }

    /**
     * 判断书籍类别
     *
     * @return
     */
    public String getBook_typeStr() {
        BookUtils bookUtils = new BookUtils();
        book_typeStr = bookUtils.checkType(book_type);

        return book_typeStr;
    }

    public void setBook_typeStr(String book_typeStr) {
        this.book_typeStr = book_typeStr;
    }

    public String getPublish_dateStr() {
        TimeUtils timeUtils = new TimeUtils();
        publish_dateStr = timeUtils.DateToString(publish_date);

        return publish_dateStr;
    }

    public Integer getBorrow_times() {
        return borrow_times;
    }

    public void setBorrow_times(Integer borrow_times) {
        this.borrow_times = borrow_times;
    }

    public String getBook_Num() {
        return book_Num;
    }

    public void setBook_Num(String book_Num) {
        this.book_Num = book_Num;
    }

    public void setPublish_dateStr(String publish_dateStr) {
        this.publish_dateStr = publish_dateStr;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
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

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }
}
