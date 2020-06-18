package com.dd.dao;

import com.dd.domain.Records;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRecordsDao {

    @Select("select * from j2ee_borrow order by borrow_time desc")
    List<Records> findAllRecords();

    @Select("select * from j2ee_borrow where is_return = 0 order by borrow_time desc")
    List<Records> findNot_R_Records();

}
