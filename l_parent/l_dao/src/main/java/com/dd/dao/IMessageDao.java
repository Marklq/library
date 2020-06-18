package com.dd.dao;

import com.dd.domain.Message;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IMessageDao {

    @Select("select * from j2ee_messages order by time desc")
    List<Message> findAll(Integer page, Integer size);
}
