package com.eshop.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.jolbox.bonecp.BoneCPDataSource;

/**
 * Spring 鍩虹閰嶇疆
 */
@Configuration
@EnableTransactionManagement
@Import({DAOConfig.class, ServiceConfig.class})
public class RootConfig {

    /**
     * 鏁版嵁婧�
     * @return
     */
    @Bean
    public DataSource dataSource() {
        BoneCPDataSource dataSource = new BoneCPDataSource();
        dataSource.setDriverClass("com.mysql.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://127.0.0.1:3306/eshop?useUnicode=true&characterEncoding=UTF-8");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        return  dataSource;
    }

    /**
     * 閰嶇疆sessionFactory
     *
     * @param dataSource
     * @return
     */
    @Bean
    public LocalSessionFactoryBean sessionFactory(DataSource dataSource) {
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);
        sessionFactoryBean.setPackagesToScan("com.eshop.entity");
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        hibernateProperties.setProperty("bonecp.idleMaxAge", "240");
        hibernateProperties.setProperty("bonecp.idleConnectionTestPeriod", "60");
        hibernateProperties.setProperty("bonecp.partitionCount", "3");
        hibernateProperties.setProperty("bonecp.acquireIncrement", "10");
        hibernateProperties.setProperty("bonecp.maxConnectionsPerPartition", "60");
        hibernateProperties.setProperty("bonecp.minConnectionsPerPartition", "20");
        hibernateProperties.setProperty("bonecp.statementsCacheSize", "50");
        hibernateProperties.setProperty("bonecp.releaseHelperThreads", "3");

        hibernateProperties.setProperty("hibernate.show_sql", "true");
        hibernateProperties.setProperty("hibernate.generate_statistics", "true");
        hibernateProperties.setProperty("hibernate.connection.release_mode", "auto");
        hibernateProperties.setProperty("hibernate.autoReconnect", "true");
        hibernateProperties.setProperty("cache.use_query_cache", "true");
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
        sessionFactoryBean.setHibernateProperties(hibernateProperties);
        return sessionFactoryBean;
    }

    /**
     * 浜嬪姟绠＄悊鍣�
     *
     * @param sessionFactory
     * @return
     */
    @Bean
    public PlatformTransactionManager transactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory);
        return transactionManager;
    }

    
}
