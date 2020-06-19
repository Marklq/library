package com.dd.service.impl;

import com.dd.dao.IMessageDao;
import com.dd.domain.Message;
import com.dd.service.IMessageService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IMessageServiceImpl implements IMessageService {


    @Autowired
    private IMessageDao messageDao;


    @Override
    public List<Message> findAll(Integer page, Integer size) {

        PageHelper.startPage(page,size);
        return messageDao.findAll();
    }

    @Override
    public List<Message> findByS_id(String student_id, Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return messageDao.findByS_id(student_id);
    }

    @Override
    public void deleteMessage(String id) {
        messageDao.deleteMessage(id);
    }

    @Override
    public void addMessage(Message message) {
        messageDao.addMessage(message);
    }
}
