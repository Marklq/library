package com.dd.service;

import com.dd.domain.Master;

import java.util.List;

public interface IMasterService {


    List<Master> findAll(Integer page, Integer size);
}
