<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>Update profile</title>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	if (us == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-success">Update Details</h5>
						<form action="update-user" method="post">
							<div class="mb-3">
								<input type="hidden" name="id" value="<%=us.getId()%>">
								<label for="exampleInputEmail1" class="form-label">Enter
									Full Name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="fname" value="<%=us.getName()%>">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email" value="<%=us.getEmail() %>">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									Number</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno" value="<%=us.getPhno() %>">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password"
									value="<%=us.getPassword()%>">
							</div>

							<button type="submit" class="btn btn-success">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>