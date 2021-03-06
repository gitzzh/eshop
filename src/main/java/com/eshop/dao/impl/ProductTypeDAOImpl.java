package com.eshop.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.eshop.dao.ProductTypeDAO;
import com.eshop.entity.ProductType;
import com.eshop.vo.ProductTypeVO;

/**
 * Created by zhouzh on 2015/7/18.
 */
public class ProductTypeDAOImpl extends BaseDAOImpl<ProductType, Integer> implements
		ProductTypeDAO {

	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductTypeVO> findProductTypeVOByParentId(Integer parentId) {
		Query query = getSession()
				.createQuery(
						"select new com.eshop.vo.ProductTypeVO(productType.id,productType.name,(select count(*) from ProductType where parent.id = productType.id) > 0)"
								+ " FROM ProductType productType "
								+ " where "
								+ " productType.parent.id"
								+ (parentId == null ? " is null" : " = "
										+ parentId));
		Object result = query.list();
		return (List<ProductTypeVO>) result;
	}
	
	@Override
	public void deleteOwnAndChildren(Integer id) {
		removeOwnAndChildren(id);
	}
	
	@SuppressWarnings("unchecked")
	private void removeOwnAndChildren(Integer... ids) {
		if (ids != null && ids.length != 0) {
			for (Integer id : ids) {
				List<Integer> childrenIds = getSession().createQuery(
						"select id from ProductType where parent.id = "
								+ id).list();
				removeOwnAndChildren(childrenIds
						.toArray(new Integer[childrenIds.size()]));
			}
			getSession().createQuery("delete ProductType where id in (:ids)")
					.setParameterList("ids", ids).executeUpdate();
		}
	}
}
