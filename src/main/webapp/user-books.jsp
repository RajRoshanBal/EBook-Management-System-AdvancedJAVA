<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BooksDtls"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	if (us == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	
	%>
	<h3 class="text-center text-success">Hello <%=us.getName() %></h3>
	<div class="container mt-3">
		<%
		String succMsg = (String) session.getAttribute("succMsg");
		if (succMsg != null) {
		%>
		<p class="text-center text-success bg-white"><%=succMsg%></p>
		<%
		session.removeAttribute("succMsg");
		}
		String failedMsg = (String) session.getAttribute("failedMsg");
		if (failedMsg != null) {
		%>
		<p class="text-center text-success"><%=failedMsg%></p>
		<%
		session.removeAttribute("failedMsg");
		}
		%>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					
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
				
				String email=us.getEmail();
				BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
				List<BooksDtls> list = dao.getBookbyOld(us.getEmail(), "Old");
				for (BooksDtls b : list) {
				%>
				<tr>

					
					<td><img src="book/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50Px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b.getBookID() %>"
						class="btn btn-sm btn-danger">Delete</a></td>

				</tr>

				<%
				}
				%>
			</tbody>
		</table>

	</div>
	
</body>
</html>