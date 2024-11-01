<%@page import="com.entity.BooksDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 

.crd-ho:hover {
	background-color: #cffcf3;
}

</style>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="Container-fluid">
<%
		BookDAOimpl dao3=new BookDAOimpl(DBConnect.getConn());
		List<BooksDtls> list3=dao3.getAllOldBook();
		for(BooksDtls b:list3)
		{%>
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/java.jpg"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p><%=b.getBookCategory() %></p>
						 <div class="add">
                            
                            <a href="view_books.jsp?bid=<%=b.getBookID() %>" class="btn btn-success btn-sm">View Details...</a>
                            <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                        </div>
					</div>
				</div>
			</div>
		
		<%}
		%>
		
				
		</div>
</div>
</body>
</html>