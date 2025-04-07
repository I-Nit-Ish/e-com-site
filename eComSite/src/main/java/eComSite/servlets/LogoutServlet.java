package eComSite.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;

import eComSite.dao.UserDao;
import eComSite.entities.User;
import eComSite.helper.FactoryProvider;

public class LogoutServlet extends HttpServlet{
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, HibernateException  {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter() ){
			
			
			HttpSession httpSession=request.getSession();
			httpSession.removeAttribute("current-user");
			response.sendRedirect("login.jsp");
				
					
					
				}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		processRequest(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		processRequest(request, response);
	}

}
