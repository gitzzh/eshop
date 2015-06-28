package com.eshop.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class DomainUtils {
	public static String getAssets(){
		return getLocalDomain() +"/assets";
	}
	public static String getVersionCode(){
		return "20150401";
	}

	public static String getLocalDomain() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		return request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath();
	}
}
