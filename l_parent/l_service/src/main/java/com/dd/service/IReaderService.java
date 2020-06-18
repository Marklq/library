package com.dd.service;

import com.dd.domain.Reader;

import java.util.List;

public interface IReaderService {
    List<Reader> findAll(Integer page, Integer size);

    void addReader(Reader reader);

    void deleteReader(String id);
}
