package com.eshop.service;

import java.util.List;

import com.eshop.entity.ProductType;
import com.eshop.vo.ProductTypeVO;

/**
 * Created by zhouzh on 2015/7/18.
 */
public interface ProductTypeService extends BaseService<ProductType, Integer> {
	 List<ProductTypeVO> getProductTypeVOByParentId(Integer parentId);
	 void deleteOwnAndChildren(Integer id);
}
