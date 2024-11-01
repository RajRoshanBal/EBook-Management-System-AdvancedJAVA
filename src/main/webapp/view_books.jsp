<%@page import="com.entity.BooksDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_component/navbar.jsp"%>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
BooksDtls b=dao.getBookById(bid);

%>
<div class="Container p-3">
 	<div class="row p-5">
 		<div class="col-md-6 text-center p-5 border bg-white"> 
 			<img  src="book/<%=b.getPhotoName() %>" style="height: 150px;width: 100px"><br>
 			<h4 class="mt-3">Book Name:<span class="text-success"><%=b.getBookName() %></span></h4>
 			<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
 			<h4>Category:<span class="text-success"><%=b.getBookCategory() %></span></h4>	
			 </div>
			 
	    <div class="col-md-6 text-center p-5 border bg-white">
	    <h2><%=b.getBookName() %></h2>
	    <%
	    if("old".equals(b.getBookCategory()))
	    {%>
	        <h5 class="text-primary">Contact To Seller</h5>
	    	<h5 class="text-primary"><i class="fa-solid fa-envelope"></i>EMail:<%=b.getEmail() %></h5>
	    	
	    <%}
	    %>
	    
	    <div class="row">
	    <div class="col-md-4 text-danger text-center p-2">
	    <i class="fa-solid fa-money-check-dollar fa-2x"></i>
	    <p>Cash on Delivery</p>
	    </div>
	    <div class="col-md-4 text-danger text-center p-2">
	    <i class="fa-solid fa-person-walking-arrow-loop-left fa-2x"></i>
	    <p>Return available</p> 
	    </div>
	    <div class="col-md-4 text-danger text-center p-2">
	    <i class="fa-solid fa-truck fa-2x"></i>
	    <p>free Shipping</p>
	    </div>
	     
	    </div>
	     <%
	    if("old".equals(b.getBookCategory()))
	    {%>
	        <div class=" text-center p-3">
	       <a href="index.jsp" class="btn btn-success"><i
								class="fa-solid fa-cart-shopping"></i>Continue shopping</a>
	       <a href="" class="btn btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i> 300</a>
	       </div> 
	    	
	    <%}else
	    {%>
	    	<div class=" text-center p-3">
	       <a href="" class="btn btn-primary"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
	       <a href="" class="btn btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i> 300</a>
	       </div>
	    <%}
	    %>
	    
	    	</div>
		 </div>
	</div>
</body>
</html>