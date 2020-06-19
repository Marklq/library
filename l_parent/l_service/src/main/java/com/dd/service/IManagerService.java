package com.dd.service;

import com.dd.domain.Manager;

import java.util.List;

public interface IManagerService {
    List<Manager> findAll(Integer page, Integer size);

    List<Manager> findByName(String username, Integer page, Integer size);

    void addManager(Manager manager);

    Manager findById(String id);

    void modifyManager(Manager manager);

    void deleteManager(String id);

    void addForeignKey(String id);

    void deleteForeignKey(String id);
}
