package com.dd.dao;

import com.dd.domain.Manager;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IManagerDao {


    @Select("select * from j2ee_managers order by reg_time desc")
    List<Manager> findAll();


    @Select("select * from j2ee_managers where username like #{username}")
    List<Manager> findByName(String username);

    @Insert("insert into j2ee_managers (id,username,password,phoneNumber,sex,reg_time)" +
            " values (#{id},#{username},#{password},#{phoneNumber},#{sex},#{reg_time})")
    void addManager(Manager manager);

    @Select("select * from j2ee_managers where id = #{id}")
    Manager findById(String id);

    @Update("update j2ee_managers set username=#{username},password=#{password},phoneNumber=#{phoneNumber},sex=#{sex} " +
            "where id=#{id}")
    void modifyManager(Manager manager);

    @Delete("delete from j2ee_managers where id = #{id}")
    void deleteManager(String id);
}
