package com.eshop.dao;

import com.eshop.entity.Admin;

/**
 * Created by zhouzh on 2015/7/18.
 */
public interface AdminDAO extends BaseDAO<Admin, Integer> {

    Admin findByAdminName(String adminName);
    
}
