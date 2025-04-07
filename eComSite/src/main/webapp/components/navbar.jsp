<%@page import="eComSite.entities.User" %>
<%@include file="common_css_js.jsp" %>
 
<%
	User user1=(User)session.getAttribute("current-user");
%>
  
<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
  <div class="container "> <!--container-fluid custom-bg navbar-expand-lg-->
    <a class="navbar-brand custom-bg" href="#">eCom</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        
      </ul>
     
     <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
     
     	    <li class="nav-item">
	         <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart" ><i class="fa-solid fa-cart-shopping" style="font-size:30px;"></i><span class="cart-items" style="font-size:16px;" >(5)</span></a>
	        </li>
	        
	       <!--   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cart">
				  Launch demo modal
				</button>-->
     
     <% if(user1==null){
    	 //
    			
    	 //
    	%> <li class="nav-item">
	         <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
	        </li> 
	        <li class="nav-item">
	         <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
	        </li> 
      <%
	     }else{
	    	 
	    	 %>
	    	 	<li class="nav-item">
		         <a class="nav-link active" aria-current="page" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%=user1.getUserName() %></a>
		        </li> 
		        <li class="nav-item">
		         <a class="nav-link active"  href="LogoutServlet">Logout</a>
		        </li> 
	    	 
	    	 <%
	    	 
	     }
	     
     %>
     	
     </ul>
    </div>
  </div>
  <%@include file="common_modals.jsp" %>
</nav>