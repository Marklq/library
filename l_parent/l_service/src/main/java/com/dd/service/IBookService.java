package com.dd.service;

import com.dd.domain.Book;

import java.util.List;

public interface IBookService {


    List<Book> findAll(Integer page,Integer size);

    List<Book> findByName(String bookName,Integer page,Integer size);

    void addBook(Book book);

    Book findBookById(String bookId);

    void modify(Book book);

    void deleteBook(String bookId);

    List<Book> findByType(Integer book_type, Integer page, Integer size);

    List<Book> findAll2(Integer page, Integer size);
}
