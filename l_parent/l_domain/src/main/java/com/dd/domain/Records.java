package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;

public class Records {

    private String student_id;
    private String book_Num;
    private Date borrow_time;
    private String borrow_timeStr;
    private String should_r_timeStr;
    private String return_timeStr;

    private Date should_r_time;
    private Integer is_return;
    private String is_returnStr;
    private Date return_time;
    private Integer id;

    public String getIs_returnStr() {
        if (is_return == 0) {
            is_returnStr = "未还";
        } else if (is_return == 1) {
            is_returnStr = "已还";
        }
        return is_returnStr;
    }

    public void setIs_returnStr(String is_returnStr) {
        this.is_returnStr = is_returnStr;
    }

    public String getBook_Num() {
        return book_Num;
    }

    public void setBook_Num(String book_Num) {
        this.book_Num = book_Num;
    }

    public Date getBorrow_time() {
        return borrow_time;
    }

    public void setBorrow_time(Date borrow_time) {
        this.borrow_time = borrow_time;
    }

    public String getBorrow_timeStr() {
        TimeUtils timeUtils = new TimeUtils();
        borrow_timeStr = timeUtils.DateToString(borrow_time);
        return borrow_timeStr;
    }

    public void setBorrow_timeStr(String borrow_timeStr) {
        this.borrow_timeStr = borrow_timeStr;
    }

    public String getShould_r_timeStr() {
        TimeUtils timeUtils = new TimeUtils();
        should_r_timeStr = timeUtils.DateToString(should_r_time);
        return should_r_timeStr;
    }

    public void setShould_r_timeStr(String should_r_timeStr) {
        this.should_r_timeStr = should_r_timeStr;
    }

    public String getReturn_timeStr() {

        if (return_time == null) {
            return_timeStr = "暂时未还书";
        } else {
            TimeUtils timeUtils = new TimeUtils();
            return_timeStr = timeUtils.DateToString(return_time);
        }
        return return_timeStr;
    }

    public void setReturn_timeStr(String return_timeStr) {
        this.return_timeStr = return_timeStr;
    }

    public Date getShould_r_time() {
        return should_r_time;
    }

    public void setShould_r_time(Date should_r_time) {
        this.should_r_time = should_r_time;
    }

    public Integer getIs_return() {
        return is_return;
    }

    public void setIs_return(Integer is_return) {
        this.is_return = is_return;
    }

    public Date getReturn_time() {
        return return_time;
    }

    public void setReturn_time(Date return_time) {
        this.return_time = return_time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }
}
