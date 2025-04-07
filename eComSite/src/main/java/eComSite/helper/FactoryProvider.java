package eComSite.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		try {
			if(factory==null){
				factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return factory;
	}
	
//	null pointer exception:Cannot invoke "org.hibernate.boot.registry.StandardServiceRegistry.getService(java.lang.Class)" because "serviceRegistry" is null
//<property name="connection.url">jdbc:mysql://localhost:3306/my_project</property>

}
