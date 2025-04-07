package eComSite.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;

import eComSite.dao.UserDao;
import eComSite.entities.User;
import eComSite.helper.FactoryProvider;

import org.hibernate.HibernateException;
import org.hibernate.Session;

public class LoginServlet extends HttpServlet{

	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, HibernateException  {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter() ){
			
			try {
				
				String email= request.getParameter("email");
				String password= request.getParameter("password");
				
			//validations
				
			//authenticating user
				
				UserDao userDao=new UserDao(FactoryProvider.getFactory());
				User user=userDao.getUserByEmailAndPassword(email, password);
				System.out.println(user);
				HttpSession httpSession=request.getSession();
				
				if(user==null) { 
//					out.println("<h1> Invalid details</h1>");
					
					httpSession.setAttribute("message","Invalid deatils !! Try Again");
					response.sendRedirect("login.jsp");
					return;
					
				}else {
					out.println("<h1> Welcome "+user.getUserName()+"</h1>");
				
					//login
					httpSession.setAttribute("current-user", user);
					
					if(user.getUserType().equals("admin") ) {
						//admin:-admin.jsp
						response.sendRedirect("admin.jsp");
					} 
					else if(user.getUserType().equals("normal")) {
						//normal:normal.jsp
						response.sendRedirect("normal.jsp");
						
					}
					else {
						out.println("cannot identify user type");
					}
				
				}
				
				
// 				if(userName.isEmpty()) {
//					out.println("Name is blank");
//					return;
//				}
//				
//				//creating user obj to store data, try use jdbc?
//				
//				User user=new User(userName, userEmail, userPhone, userPhone, "default.jpg", userAddress, "normal");
////				
// 					Session hibernateSession=FactoryProvider.getFactory().openSession(); //!!!
//					Transaction tx=hibernateSession.beginTransaction();
////				
//					int userId=(int)hibernateSession.save(user);
////					hibernateSession.persist(user);
////
//					tx.commit();
//					hibernateSession.close();
////				
////					out.println("successfully saved");
////					out.println("<br> User ID  is"+userId);
//////			
					
					
					
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
