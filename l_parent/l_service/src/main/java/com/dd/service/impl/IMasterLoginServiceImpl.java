package com.dd.service.impl;

import com.dd.dao.IMasterDao;
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

@Service("masterService")
@Transactional
public class IMasterLoginServiceImpl implements ILoginService {

    @Autowired
    private IMasterDao masterDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Master masterInfo = masterDao.findByName(username);

        //查询用户信息  以及和用户id所对应的角色信息
        User user = new User(masterInfo.getUsername(), masterInfo.getPassword(),
                true, true, true,
                true, getAuthority(masterInfo.getRoles()));
        System.out.println(getAuthority(masterInfo.getRoles()));
        System.out.println(masterInfo);
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