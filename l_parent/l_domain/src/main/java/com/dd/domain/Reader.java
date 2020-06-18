package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;

public class Reader {

    private String id;
    private String username;
    private String password;
    private String nickname;
    private Integer sex;
    private String student_id;
//    private String borrow_id;


    private String trueName;
    private String phoneNum;
    private Date reg_time;
    private String reg_timeStr;

    private String sexStr;

    public String getReg_timeStr() {
        TimeUtils timeUtils = new TimeUtils();

        reg_timeStr = timeUtils.DateToString(reg_time);

        return reg_timeStr;
    }

    public void setReg_timeStr(String reg_timeStr) {
        this.reg_timeStr = reg_timeStr;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", sex=" + sex +
                ", student_id='" + student_id + '\'' +
                ", trueName='" + trueName + '\'' +
                ", reg_time=" + reg_time +
                ", sexStr='" + sexStr + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public Date getReg_time() {
        return reg_time;
    }

    public void setReg_time(Date reg_time) {
        this.reg_time = reg_time;
    }

    public String getSexStr() {
        if (sex == 0) {
            sexStr = "男";
        } else if (sex == 1) {
            sexStr = "女";
        } else if (sex == 2) {
            sexStr = "保密";
        }


        return sexStr;
    }

    public void setSexStr(String sexStr) {
        this.sexStr = sexStr;
    }
}
