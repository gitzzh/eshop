package com.eshop.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eshop.entity.ProductType;
import com.eshop.service.ProductTypeService;

/**
 * Created by zhouzh on 2015/7/18.
 */
@Transactional
public class ProductTypeServiceImpl extends
		BaseServiceImpl<ProductType, Integer> implements ProductTypeService {

}
