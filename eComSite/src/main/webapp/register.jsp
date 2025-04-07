<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register here</title>
 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
 <h2 class="custom-bg">Registeration page</h2>
 

 
 	<div class="row mt-5">
 		<div class="col-md-6 offset-md-3">
 			<h3 class="text-centre my-3">Sign up here</h3>
 				<div class="card">
 				
 				
 					<div class="card-body">
 						<form action="RegisterServlet" method="get">
				 			 <div class="mb-3">
							    <label for="name" class="form-label">User Name</label>
							    <input type="text" name="user_name" class="form-control" id="name" placeholder="Enter Here" >
							  </div>
							  <div class="mb-3">
							    <label for="email" class="form-label">Email</label>
							    <input type="email" name="user_email" class="form-control" id="email" placeholder="Enter Here" >
							  </div>
							   <div class="mb-3">
							    <label for="password" class="form-label">password</label>
							    <input type="password" name="use_password" class="form-control" id="password" placeholder="Enter Here" >
							  </div>
								<div class="mb-3">
							    <label for="phone" class="form-label">phone number</label>
							    <input type="number" name="user_phone" class="form-control" id="phone" placeholder="Enter Here" >
							  </div>
							   </div>
								<div class="mr-3">
							    <label for="address" class="form-label">address</label>
							    <textarea style="height:200px;" name="user_address" class="form-control" placeholder="Enter Address"></textarea>
							    </div>
							  
							  <div class="container centre">
							  	<button class="btn btn-outline-success">Register</button>
							  	<button class="btn btn-outline-warning">Reset</button>
							  </div>
			  
 						</form>
 					</div>
 				
 				</div>
 		</div>
 	</div>
 
  <%@include file="components/message.jsp"%>
  
</body>
</html>