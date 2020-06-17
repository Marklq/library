package com.dd.service.impl;

import com.dd.dao.IMasterDao;
import com.dd.domain.Master;
import com.dd.service.IMasterService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * BLL
 */
@Service
public class IMasterServiceImpl implements IMasterService {

    @Autowired
    private IMasterDao masterDao;


    @Override
    public List<Master> findAll(Integer page, Integer size) {

        PageHelper.startPage(page, size);
        return masterDao.findAll();
    }
}
