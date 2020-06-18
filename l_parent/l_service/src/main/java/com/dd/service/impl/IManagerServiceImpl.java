package com.dd.service.impl;

import com.dd.dao.IManagerDao;
import com.dd.domain.Manager;
import com.dd.service.IManagerService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IManagerServiceImpl implements IManagerService {

    @Autowired
    private IManagerDao managerDao;

    @Override
    public List<Manager> findAll(Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return managerDao.findAll();
    }

    @Override
    public List<Manager> findByName(String username, Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return managerDao.findByName("%"+username+"%");

    }

    @Override
    public void addManager(Manager manager) {
        managerDao.addManager(manager);
    }

    @Override
    public Manager findById(String id) {
        return managerDao.findById(id);
    }

    @Override
    public void modifyManager(Manager manager) {
        managerDao.modifyManager(manager);
    }

    @Override
    public void deleteManager(String id) {
        managerDao.deleteManager(id);
    }
}
