package com.eshop.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.controller.BaseController;
import com.eshop.entity.Admin;
import com.eshop.service.AdminService;
import com.eshop.utils.page.ListInfo;

/**
 * 用户管理
 * @author zhouz
 *
 */
@Controller
@RequestMapping("/usermanage")
public class UserManageController extends BaseController {
	@Autowired AdminService adminService;
	
	@RequestMapping(value = "/adminlist")
	String adminList(@RequestParam(defaultValue = "1") Integer currentPageNO,
			@RequestParam(defaultValue = "10") Integer pageSize,
			Map<String, Object> model) {
		ListInfo<Admin> listInfo = adminService.searchByMapAlias(null, null, null, null, null, null, null, null, "createTime", true, currentPageNO, pageSize, null);
		model.put("listInfo", listInfo);
		model.put("currentPageNO", currentPageNO);
		model.put("pageSize", pageSize);
		return "usermanage/admin_list";
	}
}
