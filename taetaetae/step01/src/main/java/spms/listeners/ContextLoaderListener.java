package spms.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ContextLoaderListener implements ServletContextListener {
	Logger log = Logger.getLogger(ContextLoaderListener.class);
	
	// 웹 애플리케이션을 시작할 때 호출됨.
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext ctx = sce.getServletContext();
		
		try {
      String contextConfig = ctx.getInitParameter("contextConfig");
      ApplicationContext applicationContext = 
  				new ClassPathXmlApplicationContext(contextConfig);
      
      log.debug("빈의 수:" + applicationContext.getBeanDefinitionCount());
      for (String name : applicationContext.getBeanDefinitionNames()) {
      		log.debug("=>" + applicationContext.getBean(name));
      }
      
      ctx.setAttribute("applicationContext", applicationContext);
      
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 웹 애플리케이션을 종료할 때 호출됨.
	@Override
	public void contextDestroyed(ServletContextEvent sce) {}
}
