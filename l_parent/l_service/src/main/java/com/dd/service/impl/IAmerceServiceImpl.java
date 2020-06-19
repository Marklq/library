package com.dd.service.impl;

import com.dd.dao.IAmerceDao;
import com.dd.domain.Amerce;
import com.dd.service.IAmerceService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IAmerceServiceImpl implements IAmerceService {

    @Autowired
    private IAmerceDao amerceDao;


    @Override
    public List<Amerce> findAll(Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return amerceDao.findAll();
    }

    @Override
    public void addAmerce(Amerce amerce) {
        amerceDao.addAmerce(amerce);
    }

    @Override
    public List<Amerce> findByS_id(String student_id, Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return amerceDao.findByS_id(student_id);

    }

    @Override
    public void deleteAmerce(String id) {
        amerceDao.deleteAmerce(id);
    }
}
