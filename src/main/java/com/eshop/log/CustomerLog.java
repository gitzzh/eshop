package com.eshop.log;


import org.apache.log4j.Level;
import org.apache.log4j.net.SyslogAppender;

/**
 * Created by Ash on 2015/5/26.
 */
public class CustomerLog {

    /**
     * 继承Level
     * @author Sevencm
     *
     */
    private static class CustomerLogLevel extends Level {

        /**
         * SVD
         */
        private static final long serialVersionUID = -289123335520242049L;

        public CustomerLogLevel(int level, String levelStr, int syslogEquivalent) {
            super(level, levelStr, syslogEquivalent);
        }
    }

    /**
     * 自定义级别名称，以及级别范围
     */
    public static final Level CUSTOMERLEVEL = new CustomerLogLevel(40050,"CUSTOMER", SyslogAppender.LOG_LOCAL0);

    /**
     * 自定义DAO级别，以及级别范围
     */
    public static final Level DAOLEVEL = new CustomerLogLevel(40060,"DAO", SyslogAppender.LOG_LOCAL0);

    /**
     * 自定义SERVICE级别，以及级别范围
     */
    public static final Level SERVICELEVEL = new CustomerLogLevel(40070,"SERVICE", SyslogAppender.LOG_LOCAL0);


}
