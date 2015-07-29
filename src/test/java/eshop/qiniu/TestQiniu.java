package eshop.qiniu;

import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

public class TestQiniu {
	public static void main(String[] args) {
		System.out.println(getDefaultUploadToken());
	}
	
	public static String getDefaultUploadToken(){
		Auth auth = Auth.create("GIUNc981eMHkSVHn2DboMwynLE5OPUasxc9czJm-", "Qdhcwn5da02fPayJ5Ikhc2O5NI8_XFnvtBV2J_Xc");
		return auth.uploadToken("zhouzhanghuan", null, 3600, new StringMap().put("returnBody", "{\"key\": $(key), \"hash\": $(etag),\"name\":$(fname) }")
				.put("insertOnly",1));
	}
}
