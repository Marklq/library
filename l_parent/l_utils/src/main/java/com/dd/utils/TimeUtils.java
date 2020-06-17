package com.dd.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

    private String pattern = "YY-MM-dd";

    public String DateToString(Date date) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        String time = simpleDateFormat.format(date);

        return time;
    }

    public Date StringToDate(String date) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        Date date1 = simpleDateFormat.parse(date);

        return date1;
    }

    public static void main(String[] args) {
        TimeUtils timeUtils = new TimeUtils();

        String s = timeUtils.DateToString(new Date());

        System.out.println(s);


    }


}
