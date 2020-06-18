package com.dd.dao;

import com.dd.domain.Reader;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IReaderDao {

    @Select("select * from j2ee_readers order by reg_time desc")
    List<Reader> findAll();


    @Insert("insert into j2ee_readers (id,username,password,phoneNum,sex,reg_time,student_id,trueName,nickname)" +
            " values (#{id},#{username},#{password},#{phoneNum},#{sex},#{reg_time},#{student_id},#{trueName},#{nickname})")
    void addReader(Reader reader);

    @Delete("delete from j2ee_readers where id = #{id}")
    void deleteReader(String id);


    @Select("select * from j2ee_readers where trueName like #{trueName}")
    List<Reader> findByName(String trueName);

    @Select("select * from j2ee_readers where id = #{id}")
    Reader findById(String id);

    @Update("update j2ee_readers set username=#{username},password=#{password},phoneNum=#{phoneNum},sex=#{sex},student_id=#{student_id},nickname=#{nickname},trueName=#{trueName} " +
            "where id=#{id}")
    void modifyReader(Reader reader);
}
