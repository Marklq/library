package com.dd.service;

import com.dd.domain.Amerce;

import java.util.List;

public interface IAmerceService {
    List<Amerce> findAll(Integer page, Integer size);
}
