package com.dd.dao;

import com.dd.domain.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * DAL
 */
@Repository
public interface IBookDao {

    @Select("select * from j2ee_books")
    List<Book> findAll();

    @Select("select * from j2ee_books where book_name like #{bookName}")
    List<Book> findByName(String bookName);

    @Insert("insert into j2ee_books(book_id,book_Num,book_name,book_type,author,press,publish_date,price,register_time,is_borrow)" +
            " values (#{book_id},#{book_Num},#{book_name},#{book_type},#{author},#{press},#{publish_date},#{price},#{register_time},#{is_borrow})")
    void addBook(Book book);

    @Select("select * from j2ee_books where book_id = #{bookId}")
    Book findBookById(String bookId);

    /*时间更改不可用
        @Update("update j2ee_books set book_id=#{book_id},book_name=#{book_name},book_type=#{book_type},author=#{author},press=#{press}," +
                "publish_date=#{publish_date},price=#{price},is_borrow=#{is_borrow}" +
                " where register_time = #{register_time}")*/
    @Update("update j2ee_books set book_Num = #{book_Num},register_time = #{register_time},book_name=#{book_name},book_type=#{book_type},author=#{author},press=#{press}," +
            "publish_date=#{publish_date},price=#{price},is_borrow=#{is_borrow}" +
            " where book_id=#{book_id}")
    void modify(Book book);

    @Delete("delete from j2ee_books where book_id = #{bookId}")
    void deleteBook(String bookId);


    @Select("select * from j2ee_books where book_type = #{book_type}")
    List<Book> findByType(Integer book_type);

    @Select("select * from j2ee_books order by borrow_times desc")
    List<Book> findAll2();

}
