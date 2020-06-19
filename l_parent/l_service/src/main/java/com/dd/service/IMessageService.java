package com.dd.service;

import com.dd.domain.Message;

import java.util.List;

public interface IMessageService {
    List<Message> findAll(Integer page, Integer size);

    List<Message> findByS_id(String student_id, Integer page, Integer size);

    void deleteMessage(String id);

    void addMessage(Message message);
}
