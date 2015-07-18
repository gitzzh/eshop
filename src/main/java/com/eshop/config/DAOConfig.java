package com.eshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.eshop.dao.AdminDAO;
import com.eshop.dao.ProductTypeDAO;
import com.eshop.dao.impl.AdminDAOImpl;
import com.eshop.dao.impl.ProductTypeDAOImpl;

/**
 * DAO配置
 */
@Configuration
public class DAOConfig {

	@Bean
	public AdminDAO adminDAO() {
		return new AdminDAOImpl();
	}
	
	@Bean
	public ProductTypeDAO productTypeDAO() {
		return new ProductTypeDAOImpl();
	}

}
