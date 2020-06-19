package com.dd.dao;

import com.dd.domain.Manager;
import org.apache.ibatis.annotations.*;

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


    @Select("select * from j2ee_managers where username = #{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "reg_time", column = "reg_time"),
            @Result(property = "phoneNumber", column = "phoneNumber"),
            @Result(property = "roles", column = "id", javaType = java.util.List.class,
                    many = @Many(select = "com.dd.dao.IRoleDao.findByManagerId"))
    })
    Manager findByUserName(String username);

    @Insert("insert into j2ee_manager_role (m_id,r_id) values (#{id},2)")
    void addForeignKey(String id);


    @Delete("delete from j2ee_manager_role where m_id = #{id}")
    void deleteForeignKey(String id);
}
