package eComSite.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.HibernateException;

import com.mysql.cj.x.protobuf.MysqlxCrud.Find;
import com.mysql.cj.x.protobuf.MysqlxSession.AuthenticateContinue;

import eComSite.dao.CategoryDao;
import eComSite.dao.ProductDao;
import eComSite.entities.Category;
import eComSite.entities.Product;
import eComSite.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet{
	//use multipart config annotation or config in xml file
	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, HibernateException  {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter() ){	
			
			String op=request.getParameter("operation");
			
			if(op.trim().equals("addCategory")) {
				
				
				//fetching category data
				String title=request.getParameter("catTitle");
				String description=request.getParameter("catDescription");
				
				Category category=new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				//category database save
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				int catId=categoryDao.saveCategory(category);
				//out.println("Category Saved");
				
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message", "Category added successfully-"+catId);
				response.sendRedirect("admin.jsp");
				return;
				
			} else if(op.trim().equals("addProduct")) {
				String pName=request.getParameter("pName");
				String pDesc=request.getParameter("pDesc");
				int pPrice=Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
				int catId=Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic");
				
				Product p=new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				//get category by id
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category category=cdao.getCategoryById(catId);
				
				p.setCategory(category);
				
				//save product
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
//				pic upload, using func? put in try block?
//			   find out the path to upload image 
				String path=request.getServletContext().getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
						//
						//+ File.separator +"products" + File.separator +part.getSubmittedFileName();
				//request.getContextPath("img");
				System.out.println(path);
				
//				 try{
					
				//uploading code
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
				//InputStream 
				
				//reading data
				byte[] data=new byte[is.available()];
				is.read(data);
				
				//writing the data
				fos.write(data);
				fos.close();
				
//				}catch (Exception e) {
//					e.printStackTrace();
//				}
				
				//out.println("product saved successfully");
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message", "Product added successfully");
				response.sendRedirect("admin.jsp");
				return;
			
			}
						
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
