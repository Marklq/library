package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;

public class Message {

    public Integer id;
    public String student_id;
    public String student_name;
    public String message;
    public String phoneNumber;
    public Integer is_del;
    public String is_delStr;
    public Date time;
    public String timeStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTimeStr() {
        TimeUtils timeUtils = new TimeUtils();
        timeStr = timeUtils.DateToString(time);

        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getIs_del() {
        return is_del;
    }

    public void setIs_del(Integer is_del) {
        this.is_del = is_del;
    }

    public String getIs_delStr() {

        if (is_del == 0) {
            is_delStr = "未处理";
        } else if (is_del == 1) {
            is_delStr = "已处理";
        }
        return is_delStr;
    }

    public void setIs_delStr(String is_delStr) {
        this.is_delStr = is_delStr;
    }
}
