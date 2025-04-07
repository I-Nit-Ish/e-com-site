<%
User user=(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","you are not logged in, log in first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}


%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<h1>CHECKOUT</h1>
<div class="container">
	<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				
					<h3>Your selected items</h3>
						<div class="cart-body">
				
						</div>
			</div>
	
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class=card-body>
						<h3> your details for order</h3>
							<form action="#!">
								  <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Email address</label>
								    <input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
								    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								  </div>
								   <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Your Name</label>
								    <input value="<%=user.getUserName() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">							
								  </div>
								   <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Your Contact</label>
								    <input value="<%=user.getUserPhone() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">							
								  </div>
								  <div class="form-group">
								  	<label for="exampleFormControlTextarea1">Your shipping address</label>
								  	<textarea value="<%=user.getUserAddress() %>"class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"><%=user.getUserAddress() %></textarea>
								  </div>
								  
								  <div class="container">
								  	<button class="btn btn-outline-success">Order Now</button>
								  	<button class="btn btn-outline-primary">Continue shopping</button>
								  </div>
							</form>
					</div>
				
				</div>
			</div>
	
	
	</div>

</div>

<%@include file="components/common_modals.jsp" %>
</body>
</html>