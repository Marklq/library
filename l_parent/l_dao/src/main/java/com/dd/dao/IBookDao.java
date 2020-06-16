package com.dd.dao;

import com.dd.domain.Book;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * DAL
 */
@Repository
public interface IBookDao {

    @Select("select * from j2ee_books")
    List<Book> findAll();
}
