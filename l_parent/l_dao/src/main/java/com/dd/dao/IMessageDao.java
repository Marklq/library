package com.dd.dao;

import com.dd.domain.Message;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IMessageDao {

    @Select("select * from j2ee_messages order by time desc")
    List<Message> findAll();


    @Select("select * from j2ee_messages where student_id = #{student_id}")
    List<Message> findByS_id(String student_id);

    @Delete("delete from j2ee_messages where id = #{id}")
    void deleteMessage(String id);


    @Insert("insert into j2ee_messages (student_id,student_name,message,is_del,time,phoneNumber) " +
            "values (#{student_id},#{student_name},#{message},#{is_del},#{time},#{phoneNumber})")
    void addMessage(Message message);
}
