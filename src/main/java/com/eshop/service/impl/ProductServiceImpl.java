package com.eshop.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eshop.entity.Product;
import com.eshop.service.ProductService;

@Transactional
public class ProductServiceImpl extends
		BaseServiceImpl<Product, Integer> implements ProductService {
	
	
}
