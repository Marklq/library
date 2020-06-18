package com.dd.dao;

import com.dd.domain.Reader;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IReaderDao {

    @Select("select * from j2ee_readers order by reg_time desc")
    List<Reader> findAll();


    @Insert("insert into j2ee_readers (id,username,password,phoneNum,sex,reg_time,student_id,trueName,nickname)" +
            " values (#{id},#{username},#{password},#{phoneNum},#{sex},#{reg_time},#{student_id},#{trueName},#{nickname})")
    void addReader(Reader reader);

    @Delete("delete from j2ee_readers where id = #{id}")
    void deleteReader(String id);
}
