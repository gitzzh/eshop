package com.eshop.utils;

import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

public class QiniuUtils {
	
	private static final String ACCESS_KEY ="GIUNc981eMHkSVHn2DboMwynLE5OPUasxc9czJm-";
	private static final String SECRET_KEY ="Qdhcwn5da02fPayJ5Ikhc2O5NI8_XFnvtBV2J_Xc";
	
	public static String getDefaultUploadToken(){
		Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		return auth.uploadToken("zhouzhanghuan", null, 3600, 
				new StringMap().put("returnBody", "{\"key\": $(key), \"hash\": $(etag),\"name\":$(fname) }"));
	}
}
