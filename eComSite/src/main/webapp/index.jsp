<%@page import="javax.swing.undo.AbstractUndoableEdit"%>
<%@page import="eComSite.helper.Helper"%>
<%@page import="eComSite.entities.Category"%>
<%@page import="eComSite.dao.CategoryDao"%>
<%@page import="eComSite.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="eComSite.dao.ProductDao"%>
<%@page import="eComSite.helper.FactoryProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   <%@include file="components/common_css_js.jsp" %>
	<title>JSP Page</title> 
</head>
	<body >
	 <%@include file="components/navbar.jsp" %>
	<!--  <h2 style="background-colour:#ccff90;" >Ecom site!</h2>
	<h2>creating session factory object</h2>
	 
	<% //out.println(FactoryProvider.getFactory()); %> -->
	
	<div class="row mt-3 mx-2">
	
	<%
			String cat=(String)request.getParameter("category");
				//out.println(cat);
	
			ProductDao dao=new ProductDao(FactoryProvider.getFactory());
			List<Product> list=null;//dao.getAllProducts();null;
			
			if(cat==null){
				list=dao.getAllProducts();
			}else if(cat.equals("all")){
				list=dao.getAllProducts();
			}else{
				int cid=Integer.parseInt(cat.trim());
				list=dao.getAllProductsById(cid);
			}
			
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist=cdao.getCategories();
	%>
	
	<!--show categories-->
		<div class="col-md-2">
		
			<!--  <h2>Categories <%=clist.size() %></h2>-->
			
			<div class="list-group">
			  <a href="index.jsp?category=all" class="list-group-item active">All products</a>
			
			
			<%
				for(Category c:clist){%>
					<!--  out.println(c.getCategoryTitle()+"<br>");-->
				 <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item "><%=c.getCategoryTitle() %></a>
			
				<% }
			//show selected category as active on click
			%>
			
			</div>
		
		</div>
		
		<!--show products-->
		<div class="container col-md-10 " >
		<!--  <h2>Number of products is <%//=list.size() %></h2>-->
			<!--  
			<%
				//for(Product product:list){ 
				//	out.println(product.getpPhoto()+"<br>");
				//	out.println(product.getpName()+"<br><br>");
				//}style="display:flex"
			
			%>-->
			
			
			<!-- col:12   -->
			
				<div class="col-md-5" >
					<!-- traversing products -->
					<% 
					   for(Product p:list){
					
					
 					%>
 					<div class="card-columns" >
						<div class="card" >
						 <!--  style="width: 18rem;  -->
						 <div class="container text-center">
						 	 <img src="img/products/<%=p.getpPhoto() %>" style="max-height:270px; max-width:200px; width:auto;" class="card-img-top" alt="...">
						 </div>
						  <div class="card-body">
						    <h5 class="card-title"><%=p.getpName() %></h5>
						    <p class="card-text"><%=Helper.get10Words(p.getpDesc()) %></p>
						    <div class="card-footer">
						    	 <button class="btn btn-primary" onClick="add_to_cart(<%=p.getPid()%>, '<%=p.getpName()%>', <%=p.getPriceAfterDiscount()%>);">Add to cart</button>
						    	 <button class="btn btn-primary">&#8377;<%=p.getPriceAfterDiscount() %> /-<span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> <%=p.getpDiscount()%>% off</span></button>
						    </div>
						    
						   
						  </div>
						</div>
						<!-- .col-md-12{
						 	display: flex;
						 	flex-wrap:wrap;
						 }  -->
						</div> 
					<%} 
					
						if(list.size()==0){
							out.println("No item in this category");
						}
					
					%>	
			  </div>
		</div>
	
	</div>
	
	<%@include file="components/common_modals.jsp" %>
	</body>
</html>