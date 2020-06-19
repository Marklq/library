package com.dd.service.impl;

import com.dd.dao.IManagerDao;
import com.dd.dao.IMasterDao;
import com.dd.domain.Manager;
import com.dd.domain.Master;
import com.dd.domain.Role;
import com.dd.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("managerService")
@Transactional
public class IManagerLoginServiceImpl implements ILoginService {

    @Autowired
    private IManagerDao managerDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Manager manager = managerDao.findByUserName(username);

        //查询用户信息  以及和用户id所对应的角色信息
        User user = new User(manager.getUsername(), manager.getPassword(),
                true, true, true,
                true, getAuthority(manager.getRoles()));
        System.out.println(getAuthority(manager.getRoles()));
        System.out.println(manager);
        return user;
    }


    //获取用户权限   返回一个list集合  集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRole()));
        }

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
            System.out.println("____________________________");
        }
        return list;
    }


}