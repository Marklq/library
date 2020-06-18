package com.dd.service.impl;

import com.dd.dao.IRecordsDao;
import com.dd.domain.Records;
import com.dd.service.IRecordsService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IRecordsServiceImpl implements IRecordsService {

    @Autowired
    private IRecordsDao recordsDao;

    @Override
    public List<Records> findAllRecords(Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return recordsDao.findAllRecords();
    }

    @Override
    public List<Records> findNot_R_Records(Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return recordsDao.findNot_R_Records();
    }
}
