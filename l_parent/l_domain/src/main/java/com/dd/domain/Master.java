package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;
import java.util.List;

public class Master {
    private String sys_id;
    private String username;// 账户
    private String password;//密码
    private String truename;// 姓名
    private String sex;
    private String phoneNumber;
    private Date reg_time;
    private String reg_timeStr;
    private List<Role> roles;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

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
        return "Master{" +
                "sys_id='" + sys_id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", truename='" + truename + '\'' +
                ", sex='" + sex + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", entry_time=" + reg_time +
                '}';
    }

    public String getSys_id() {
        return sys_id;
    }

    public void setSys_id(String sys_id) {
        this.sys_id = sys_id;
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

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getReg_time() {
        return reg_time;
    }

    public void setReg_time(Date entry_time) {
        this.reg_time = entry_time;
    }


}
