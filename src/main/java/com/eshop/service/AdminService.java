package com.eshop.service;

import com.eshop.entity.Admin;

/**
 * Created by zhouzh on 2015/7/18.
 */
public interface AdminService extends BaseService<Admin, Integer> {
	Admin searchByAdminName(String adminName);
    
}
