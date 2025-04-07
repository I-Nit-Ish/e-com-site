package eComSite.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import eComSite.entities.User;
import eComSite.helper.FactoryProvider;


public class RegisterServlets extends HttpServlet{
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, HibernateException  {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter() ){
			
			try {
				String userName= request.getParameter("user_name");
				String userEmail= request.getParameter("user_email");
				String userPassword= request.getParameter("user_password");
				String userPhone= request.getParameter("user_phone");		
				String userAddress= request.getParameter("user_address");
			
			//validations
				
				
				if(userName.isEmpty()) {
					out.println("Name is blank");
					return;
				}
				
				//creating user obj to store data, try use jdbc?
				
				User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
//				
 					Session hibernateSession=FactoryProvider.getFactory().openSession(); //!!!
					Transaction tx=hibernateSession.beginTransaction();
//				
					int userId=(int)hibernateSession.save(user);
//					hibernateSession.persist(user);
//
					tx.commit();
					hibernateSession.close();
//				
//					out.println("successfully saved");
//					out.println("<br> User ID  is"+userId);
////			
					HttpSession httpSession=request.getSession();
					httpSession.setAttribute("message","Registeration Successfull !!"+ userId);
					response.sendRedirect("register.jsp");
					return;
					
					
				}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		processRequest(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		processRequest(request, response);
	}
	
}
