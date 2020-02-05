package _00_init.web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;

import _00_init.util.HibernateUtils;

//@WebListener
public class CreateSessionFactoryListener implements ServletContextListener {
    SessionFactory factory;
	
	public CreateSessionFactoryListener() {
    }
    
    public void contextDestroyed(ServletContextEvent sce)  { 
    	factory.close();
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	factory = HibernateUtils.getSessionFactory();
    }
	
}
