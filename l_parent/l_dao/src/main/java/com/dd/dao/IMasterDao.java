package com.dd.dao;

import com.dd.domain.Master;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * DAL
 */
@Repository
public interface IMasterDao {


    @Select("select * from j2ee_master")
    List<Master> findAll();

    @Select("select * from j2ee_master where username = #{username}")
    @Results({
            @Result(id = true, property = "sys_id", column = "sys_id"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "truename", column = "truename"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "reg_time", column = "reg_time"),
            @Result(property = "phoneNumber", column = "phoneNumber"),
            @Result(property = "roles", column = "sys_id", javaType = java.util.List.class,
                    many = @Many(select = "com.dd.dao.IRoleDao.findByMasterId")),
    })
    Master findByName(String username);


}
