package com.eshop.dao;

import java.util.List;

import com.eshop.entity.ProductType;
import com.eshop.vo.ProductTypeVO;

/**
 * Created by zhouzh on 2015/7/18.
 */
public interface ProductTypeDAO extends BaseDAO<ProductType, Integer> {

   List<ProductTypeVO> findProductTypeVOByParentId(Integer parentId);
}
