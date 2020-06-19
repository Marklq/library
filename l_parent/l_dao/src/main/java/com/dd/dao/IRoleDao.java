package com.dd.dao;

import com.dd.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRoleDao {

    //获取权限
    @Select("select * from j2ee_role where id in (select r_id from j2ee_master_role where m_id = #{sys_id})")
    List<Role> findByMasterId(String sys_id);

    //    获取权限
    @Select("select * from j2ee_role where id in (select r_id from j2ee_manager_role where m_id = #{id})")
    List<Role> findByManagerId(String id);
}
