package com.eshop.log;

import org.apache.log4j.Logger;

public class DAOLogSupport extends CustomerLogSupport {

	// 日志
	protected final Logger logger = Logger.getLogger("dao");

	@Override
	protected void log(String message) {
		super.log("dao", message);
	}
}
