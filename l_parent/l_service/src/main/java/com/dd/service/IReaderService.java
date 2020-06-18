package com.dd.service;

import com.dd.domain.Reader;

import java.util.List;

public interface IReaderService {
    List<Reader> findAll(Integer page, Integer size);

    void addReader(Reader reader);

    void deleteReader(String id);

    List<Reader> findByName(String trueName, Integer page, Integer size);

    Reader findById(String id);

    void modifyReader(Reader reader);
}
