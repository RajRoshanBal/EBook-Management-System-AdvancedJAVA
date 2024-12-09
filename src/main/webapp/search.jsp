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
		<div class="row p-3">
			<%
			// Check if a user is logged in
			User user = (User) session.getAttribute("userobj");
			String ch=request.getParameter("ch");
			// Get user ID for adding to cart
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BooksDtls> list2 = dao2.getsBookbySearch(ch);

			for (BooksDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/java.jpg"
							style="width: 100px; height: 150px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="add">
							<%
							String ch1 = b.getBookCategory();
							if ("New".equals(ch1) && user != null) {
							%>
							<a href="cart?bid=<%=b.getBookID()%>&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a>
							<%
							} else if ("New".equals(ch1) && user == null){
							%>
							<a href="login.jsp"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookID()%>"
								class="btn btn-success btn-sm">View Details</a> <a href="#"
								class="btn btn-danger btn-sm"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
