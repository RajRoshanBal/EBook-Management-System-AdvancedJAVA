<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>Sell Old Book</title>
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
	<div class="container mt-2">

		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center p-1 text-success">Sell Old Book</h5>
						<%
						String succMsg = (String) session.getAttribute("succMsg2");
						if (succMsg != null) {
						%>
						<p class="text-center text-success bg-white"><%=succMsg%></p>
						<%
						session.removeAttribute("succMsg2");
						}
						String failedMsg = (String) session.getAttribute("failedMsg2");
						if (failedMsg != null) {
						%>
						<p class="text-center text-success"><%=failedMsg%></p>
						<%
						session.removeAttribute("failedMsg2");
						}
						%>
						<form action="add-old-book" method="post"
							enctype="multipart/form-data">
							<div class="form-group mt-3">
								<input type="hidden" name="email" value=<%=us.getEmail()%>>
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group mt-3">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>


							<div class="form-group  mt-3">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary mt-3">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>