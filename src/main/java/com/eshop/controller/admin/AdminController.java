package com.eshop.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eshop.controller.BaseController;
import com.eshop.entity.Admin;
import com.eshop.service.AdminService;
import com.eshop.utils.PasswordUtils;
import com.eshop.vo.AdminPassport;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{
	
	@Autowired AdminService adminService;
	
	/**
	 * 去登录页面
	 * @return
	 */
	@RequestMapping("/login")
	String login(Map<String, Object> model) {
		if (getAdminPassport() == null) {
			if (request.getCookies() != null) {
				for (Cookie cookie : request.getCookies()) {
					if (cookie.getName().equals("admin_login_info")) {
						try {
							JSONObject info = new JSONObject(cookie.getValue());
							if (info.has("account") && info.has("password")
									&& !info.isNull("account")
									&& !info.isNull("password")) {
								Admin admin = adminService
										.searchByAdminName(info
												.getString("account"));
								if (admin != null
										&& info.getString("password").equals(
												admin.getPassword())) {
									AdminPassport passport = new AdminPassport();
									passport.setId(admin.getAdminId());
									httpSession.setAttribute(
											AdminPassport.PASSPORT_NAME,
											passport);
									return "redirect:/admin/home";
								}
							}
						} catch (JSONException e) {
							cookie.setHttpOnly(true);
							cookie.setMaxAge(0);
						}
					}
				}
			}
			boolean canVerify = false;
			Integer errorNum = (Integer) httpSession.getAttribute("admin_login_error_num");
			errorNum = errorNum == null ? 0 : errorNum;
			canVerify = errorNum >= 3;
			model.put("canVerify", canVerify);
			return "/admin/login";
		} else {
			return "redirect:/admin/home";
		}
	}
	
	/**
	 * 登录
	 * @param account
	 * @param password
	 * @return
	 * @throws JSONException 
	 */
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@ResponseBody
	Object signIn(String account, String password, String code,
			@RequestParam(defaultValue = "false") Boolean remember) throws JSONException {
		int status = 0;
		String redirectURL = null;
		Integer errorNum = (Integer) httpSession
				.getAttribute("admin_login_error_num");
		errorNum = errorNum == null ? 0 : errorNum;
		if (errorNum >= 3) {
			if (StringUtils.isBlank(code)
					|| !StringUtils.equalsIgnoreCase(code,
							(String) httpSession.getAttribute("code"))) {
				status = -3;
			}
		}
		if (status != -3) {
			Admin admin = adminService.searchByAdminName(account);
			if (admin != null) {
				PasswordUtils passwordUtils = new PasswordUtils();
				if (passwordUtils.isPasswordValid(admin.getPassword(),
						password, admin.getPasswordSalt())) {
					if(remember){
						JSONObject info = new JSONObject();
						info.put("account", account);
						info.put("password", admin.getPassword());
						Cookie cookie = new Cookie("admin_login_info",info.toString());
						cookie.setMaxAge(60 * 60 * 24);
						cookie.setPath("/");
						cookie.setHttpOnly(true);
						response.addCookie(cookie);
					}/*
					 * else{ if (request.getCookies() != null) { for (Cookie
					 * cookie : request.getCookies()) { if
					 * (cookie.getName().equals("admin_login_info")) {
					 * cookie.setValue(null); cookie.setMaxAge(0);
					 * cookie.setPath("/"); cookie.setHttpOnly(true);
					 * response.addCookie(cookie); } } } }
					 */
					AdminPassport passport = new AdminPassport();
					passport.setId(admin.getAdminId());
					httpSession.setAttribute(AdminPassport.PASSPORT_NAME,passport);
					httpSession.removeAttribute("admin_login_error_num");
					httpSession.removeAttribute("code");
					redirectURL = "../admin/home";
					status = 1;
				} else {
					errorNum++;
					httpSession.setAttribute("admin_login_error_num", errorNum);
					status = -2;
				}
			} else {
				status = -1;
			}
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("account", account);
		model.put("status", status);
		model.put("errorNum", errorNum);
		model.put("redirectURL", redirectURL);
		return model;
	}
	
	/**
	 * 登出
	 * @return
	 * @throws ServletException
	 */
	@RequestMapping(value = "/signout")
	String signOut() throws ServletException {
		if(request.getCookies() != null){
			for (Cookie cookie : request.getCookies()) {
				if (cookie.getName().equals("admin_login_info")) {
					cookie.setValue(null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					cookie.setHttpOnly(true);
					response.addCookie(cookie);
				}
			}
		}
		httpSession.invalidate();
		return "redirect:/admin/login";
	}
	
	@RequestMapping(value = "/home")
	String home(){
		return "redirect:/adminproduct/productlist";
	}
}
