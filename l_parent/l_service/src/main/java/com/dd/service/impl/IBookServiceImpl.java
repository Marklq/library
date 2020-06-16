package com.dd.service.impl;

import com.dd.dao.IBookDao;
import com.dd.domain.Book;
import com.dd.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public List<Book> findAll() {
        return bookDao.findAll();
    }
}
