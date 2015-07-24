package com.eshop.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eshop.controller.BaseController;
import com.eshop.entity.ProductType;
import com.eshop.service.ProductTypeService;
import com.eshop.vo.ProductTypeVO;


@Controller
@RequestMapping("/adminproduct")
public class ProductManageController extends BaseController {
	@Autowired ProductTypeService productTypeService;
	
	
	
	/**
	 * 加载产品类型数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/loadtype")
	@ResponseBody
	Object loadType(Integer parentId) {
		Map<String, Object> model = new HashMap<>();
		List<ProductTypeVO> productTypeVOs = productTypeService.getProductTypeVOByParentId(parentId);
		model.put("status", 1);
		model.put("data", productTypeVOs);
		return model;
	}
	
	/**
	 * 删除产品类型
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deletetype")
	@ResponseBody
	Object deleteType(@RequestParam(required = true) Integer id) {
		Map<String, Object> model = new HashMap<>();
		productTypeService.deleteOwnAndChildren(id);
		model.put("status", 1);
		model.put("id", id);
		return model;
	}
	
	
	/**
	 * 去产品类型管理页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/typemanage")
	String typeManage() {
		
		return "product/typemanage";
	}
	
	/**
	 * 添加产品类
	 * @param account
	 * @param password
	 * @param code
	 * @param remember
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping(value = "/producttypesave", method = RequestMethod.POST)
	@ResponseBody
	Object productTypeSave(Integer id, @RequestParam(required = true) String name,
			String params, Integer parentId) {
		int status = 0;
		ProductType productType = null;
		if(id != null){
			productType = productTypeService.searchById(id);
		}else{
			productType = new ProductType();
		}
		productType.setName(name);
		productType.setParams(params);
		if(parentId != null){
			ProductType parent = new ProductType();
			parent.setId(parentId);
			productType.setParent(parent);
		}
		productTypeService.saveOrUpdate(productType);
		status = 1;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("status", status);
		model.put("entity", productType);
		model.put("parentId", parentId);
		return model;
	}
}
