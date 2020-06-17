package com.dd.dao;

import com.dd.domain.Master;
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

}
