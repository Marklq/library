package com.dd.dao;

import com.dd.domain.Amerce;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IAmerceDao {
    @Select("select * from j2ee_amerce order by is_pay asc")
    List<Amerce> findAll();

}
