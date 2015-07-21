package com.eshop.log;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class CustomerLogSupport {

	// 日志
	protected final Logger logger = Logger.getLogger("customer");

	protected void log(String message) {
		logger.log(CustomerLog.CUSTOMERLEVEL, message);
	}

	protected void log(String level, String message) {
		logger.log(getLevel(level), message);
	}

	protected Level getLevel(String level) {
		level = level.toUpperCase();
		if (level.equals("CUSTOMER")) {
			return CustomerLog.CUSTOMERLEVEL;
		}
		if (level.equals("DAO")) {
			return CustomerLog.DAOLEVEL;
		}
		if (level.equals("SERVICE")) {
			return CustomerLog.SERVICELEVEL;
		}
		if (level.equals("OFF")) {
			return Level.OFF;
		}
		if (level.equals("FATAL")) {
			return Level.FATAL;
		}
		if (level.equals("ERROR")) {
			return Level.ERROR;
		}
		if (level.equals("INFO")) {
			return Level.INFO;
		}
		if (level.equals("WARN")) {
			return Level.WARN;
		}
		if (level.equals("DEBUG")) {
			return Level.DEBUG;
		}
		if (level.equals("ALL")) {
			return Level.ALL;
		}
		return Level.OFF;
	}
}
