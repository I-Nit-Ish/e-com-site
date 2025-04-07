<%@page import="eComSite.helper.Helper"%>
<%@page import="eComSite.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="eComSite.dao.CategoryDao"%>
<%@page import="eComSite.helper.FactoryProvider"%>
<%@page import="eComSite.entities.User" %>
<%
	User user=(User)session.getAttribute("current-user");
		if(user==null){
			session.setAttribute("message","you are not logged in, log in first");
			response.sendRedirect("login.jsp");
			return;
		}
		else{
			if(user.getUserType().equals("normal")){
				session.setAttribute("message","you are not admin, access denied");
				response.sendRedirect("login.jsp");
				return;
			}
			
		}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
 
 					<%
		        	 CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
		        	 List<Category> list=cdao.getCategories();
		        	 
		        	 //getting count
		        	 
		        	 Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
		        	%> 
		     
<html>
<head>
<meta charset="UTF-8">
<title>admin page</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>

<%@include file="components/navbar.jsp" %>
<!--  <h1>admin panel</h1>-->

<div class="container admin">

	<div class="container-fluid">
		<%@include file="components/message.jsp" %> 
	</div>

	<div class="row mt-3">
	
		<!-- first col -->
		<div class="col-md-4">
			<div class="card admin ">
				<div class="card-body text-centre">
				
					<div class="container">
						<img style="max-width:125px;" class="img-fluid" src="img/programmer.png" alt="user_icon"/>
					</div>
					<h1 class="text-uppercase text-muted">User</h1>
					<h2><%=m.get("userCount") %></h2>
				</div>
			</div>
		
		</div>
		
		<!-- second col -->
		<div class="col-md-4">
			<div class="card" >
				<div class="card-body text-centre">		
					<div class="container">
						<img style="max-width:125px;" class="img-fluid" src="img/list.png" alt="categories_icon"/>
					</div>
					<h1 class="text-uppercase text-muted" >Categories</h1>
					<h2><%=list.size() %></h2>
				</div>
			</div>
		</div>
		
		<!-- third col -->
		<div class="col-md-4">
			<div class="card">
				<div class="card-body text-centre">
					<div class="container">
						<img style="max-width:125px;" class="img-fluid" src="img/delivery-box.png" alt="products_icon"/>
					</div>
					<h1 class="text-uppercase text-muted">Products</h1>
					<h2><%=m.get("productCount") %></h2>
				</div>
			</div>
		</div>
	
	</div>
	
<div class="row mt-3">
	<div class="col-md-6">
			<div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
				<div class="card-body text-centre">
					<div class="container">
						<img style="max-width:125px;" class="img-fluid" src="img/add.png" alt="add_products_icon"/>
					</div>
					<h1 class="text-uppercase text-muted">Add Products</h1>
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
				<div class="card-body text-centre">
					<div class="container">
						<img style="max-width:125px;" class="img-fluid" src="img/save-instagram.png" alt="add_categories_icon"/>
					</div>
					<h1 class="text-uppercase text-muted">Add Categories</h1>
				</div>
			</div>
		</div>

</div>

</div>

	<!-- add category modal-->
		
		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill category details</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        <form action="ProductOperationServlet" method="post">
		        	<input type="hidden" name="operation" value="addCategory" />
		        	
		        	<div class="form-group">
		        		<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
		        	</div>
		        	
		        	<div class="form-group">
		        		<textarea style="height:250px;" class="form-control" placeholder="Enter category description" name="catDescription" required> </textarea>
		        	</div>
		        	
		        	
		        	  <div class="container text-centre">
		        	
		        	 <button type="submit" class="btn btn-outline-success">Add Category</button>
		        	</div>
		        </form>
		        
		      
		        
		      </div>
		      <div class="modal-footer">
		       
		      </div>
		    </div>
		  </div>
		</div>

	<!-- add category modal-->
	
	<!-- add product modal-->
		
		<!-- Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill product details</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
		        	<input type="hidden" name="operation" value="addProduct" />
		        	
		        	<div class="form-group">
		        		<input type="text" class="form-control" name="pName" placeholder="Enter product title" required />
		        	</div>
		        	
		        	<div class="form-group">
		        		<textarea style="height:250px;" class="form-control" placeholder="Enter product description" name="pDesc" required> </textarea>
		        	</div>
		        	
		        	<div class="form-group">
		        		<input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required />
		        	</div>
		        	
		        	<div class="form-group">
		        		<input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required />
		        	</div>
		        	
		        	<div class="form-group">
		        		<input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required />
		        	</div>
		        	
		        	<!-- product categories -->
		        	
		        	
		        	
		        	<div class="form-group">
		        		<select name="catId" class="form-control" >
		        			
		        			<%
		        				for(Category c:list){
		        			%>
		        			<option value="<%=c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
		        			<%} %>
		        		</select>
		        	</div>
		        	
		        	<div class="form-group">
		        		<label for="pPic">Select product image</label>
		        		<br>
		        		<input type="file" id="pPic" class="form-control" name="pPic" required />
		        	</div>
		        	
		        	
		        	 <div class="container text-centre">
		        	 <button type="submit" class="btn btn-outline-success">Add Product</button>
		       		 </div>
		        	
		        </form>
		        
		       
		        
		      </div>
		      <div class="modal-footer">
		       
		      </div>
		    </div>
		  </div>
		</div>

	<!-- add product modal-->
	
		<%@include file="components/common_modals.jsp" %> 
</body>
</html>

