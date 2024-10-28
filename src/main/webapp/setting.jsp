<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="all_component/allCss.jsp"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Setting</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	String userName = user.getName();
	%>
	<div class="container">
		<h3 class="text-center text-success">
			Hello,
			<%=userName%>!
		</h3>
		<div class="row p-5">
			<div class="col-md-4 mt-3">
				<a href="sell-old-book.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="user-books.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h4>Listed Books</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="edit-profile.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-circle-user fa-3x"></i>
							</div>
							<h4>Login & Security</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="">
					<div class="card p-3 ">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h4>Your Address</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3">
				<a href="myorder.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Orders</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-3 ">
				<a href="help.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-phone fa-3x"></i>
							</div>
							<h4>Contact Us</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
