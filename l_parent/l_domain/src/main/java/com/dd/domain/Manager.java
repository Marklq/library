package com.dd.domain;

import com.dd.utils.TimeUtils;

import java.util.Date;
import java.util.List;

public class Manager {

    private String id;
    private String username;
    private String password;
    private String phoneNumber;
    private Integer sex;
    private String sexStr;
    private Date reg_time;

    private String reg_timeStr;

    private List<Role> roles;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getSexStr() {

        if (sex==0){
            sexStr="男";
        }else {
            sexStr="女";
        }

        return sexStr;
    }

    public void setSexStr(String sexStr) {
        this.sexStr = sexStr;
    }

    public String getReg_timeStr() {
        TimeUtils timeUtils = new TimeUtils();

        reg_timeStr = timeUtils.DateToString(reg_time);

        return reg_timeStr;
    }

    public void setReg_timeStr(String reg_timeStr) {
        this.reg_timeStr = reg_timeStr;
    }

    public Date getReg_time() {
        return reg_time;
    }

    public void setReg_time(Date reg_time) {
        this.reg_time = reg_time;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", sex='" + sex + '\'' +
                ", reg_time=" + reg_time +
                ", reg_timeStr='" + reg_timeStr + '\'' +
                '}';
    }
}
