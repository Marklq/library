package com.dd.dao;

import com.dd.domain.Amerce;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IAmerceDao {
    @Select("select * from j2ee_amerce order by is_pay asc")
    List<Amerce> findAll();

    @Insert("insert into j2ee_amerce (student_id,name,book_name,book_Num,money,is_pay,pay_time) " +
            "values (#{student_id},#{name},#{book_name},#{book_Num},#{money},#{is_pay},#{pay_time})")
    void addAmerce(Amerce amerce);

    @Select("select * from j2ee_amerce where student_id = #{student_id}")
    List<Amerce> findByS_id(String student_id);

    @Delete("delete from j2ee_amerce where amerce_id = #{id}")
    void deleteAmerce(String id);
}
