<%@page import="java.util.List"%>
<%@page import="com.entity.BooksDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BooksDtls> list = dao.getAllBooks();
			for (BooksDtls b : list) {
			%>
			<tr>

				<td><%=b.getBookID()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50Px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookID()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a> <a
					href="../delete?id=<%=b.getBookID()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-pen-to-square"></i>Delete</a></td>

			</tr>

			<%
			}
			%>
		
</body>
</html>