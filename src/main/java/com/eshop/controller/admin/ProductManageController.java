package com.eshop.controller.admin;

import java.util.HashMap;
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


@Controller
@RequestMapping("/adminproduct")
public class ProductManageController extends BaseController {
	@Autowired ProductTypeService productTypeService;
	
	/**
	 * 去产品类型输入页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/producttypeinput")
	@ResponseBody
	String productTypeInput(Integer id,Map<String, Object> model) {
		if(id != null){
			model.put("productType", productTypeService.searchById(id));
		}
		return "product/producttypeinput";
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
			@RequestParam(required = true) String params, Integer parentId) {
		int status = 0;
		ProductType productType = null;
		if(id != null){
			productType = productTypeService.searchById(id);
		}else{
			productType = new ProductType();
		}
		productType.setName(name);
		productType.setParams(params);
		productType.setParentId(parentId);
		productTypeService.saveOrUpdate(productType);
		status = 1;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("status", status);
		return model;
	}
}
