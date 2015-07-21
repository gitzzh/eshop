package com.eshop.log;

import org.apache.log4j.Logger;

public class ServiceLogSupport extends CustomerLogSupport {

	// 日志
	protected final Logger logger = Logger.getLogger("service");

	@Override
	protected void log(String message) {
		super.log("service", message);
	}
}
