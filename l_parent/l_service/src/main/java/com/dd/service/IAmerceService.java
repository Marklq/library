package com.dd.service;

import com.dd.domain.Amerce;

import java.util.List;

public interface IAmerceService {
    List<Amerce> findAll(Integer page, Integer size);

    void addAmerce(Amerce amerce);

    List<Amerce> findByS_id(String student_id, Integer page, Integer size);

    void deleteAmerce(String id);
}
