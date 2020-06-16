package com.dd.utils;

public class BookUtils {

    public static String checkType(Integer type) {
        String typeStr = null;

        if (type == 0) {
            typeStr = "计算机";
        } else if (type == 1) {
            typeStr = "社科类";
        } else if (type == 2) {
            typeStr = "小说类";
        } else if (type == 3) {
            typeStr = "人文类";
        }
        return typeStr;
    }

    public static void main(String[] args) {
        String s = new BookUtils().checkType(1);
        System.out.println(s);
    }

}
