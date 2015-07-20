package com.eshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.ProductTypeDAO;
import com.eshop.entity.ProductType;
import com.eshop.service.ProductTypeService;
import com.eshop.vo.ProductTypeVO;

/**
 * Created by zhouzh on 2015/7/18.
 */
@Transactional
public class ProductTypeServiceImpl extends
		BaseServiceImpl<ProductType, Integer> implements ProductTypeService {
	
	@Autowired ProductTypeDAO productTypeDAO;
	
	@Override
	public List<ProductTypeVO> getProductTypeVOByParentId(Integer parentId) {
		return productTypeDAO.findProductTypeVOByParentId(parentId);
	}
}
