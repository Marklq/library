package com.dd.service.impl;

import com.dd.dao.IReaderDao;
import com.dd.domain.Reader;
import com.dd.service.IReaderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IReaderServiceImpl implements IReaderService {

    @Autowired
    private IReaderDao readerDao;

    @Override
    public List<Reader> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return readerDao.findAll();

    }

    @Override
    public void addReader(Reader reader) {
         readerDao.addReader(reader);
    }

    @Override
    public void deleteReader(String id) {
        readerDao.deleteReader(id);
    }
}
