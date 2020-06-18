package com.dd.service;

import com.dd.domain.Records;

import java.util.List;

public interface IRecordsService {
    List<Records> findAllRecords(Integer page, Integer size);

    List<Records> findNot_R_Records(Integer page, Integer size);
}
