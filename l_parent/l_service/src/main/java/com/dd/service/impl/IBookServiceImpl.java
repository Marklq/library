package com.dd.service.impl;

import com.dd.dao.IBookDao;
import com.dd.domain.Book;
import com.dd.service.IBookService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * BLL
 */
@Service
@Transactional
public class IBookServiceImpl implements IBookService {

    @Autowired
    private IBookDao bookDao;

    @Override
    public List<Book> findAll(Integer page, Integer size) {

        PageHelper.startPage(page, size);
        return bookDao.findAll();
    }

    @Override
    public List<Book> findByName(String bookName, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return bookDao.findByName("%" + bookName + "%");
    }

    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public Book findBookById(String bookId) {
        return bookDao.findBookById(bookId);
    }

    @Override
    public void modify(Book book) {
        bookDao.modify(book);
    }

    @Override
    public void deleteBook(String bookId) {
        bookDao.deleteBook(bookId);
    }
}
