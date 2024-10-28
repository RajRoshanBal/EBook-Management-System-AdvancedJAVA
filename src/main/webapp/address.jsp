<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>User:Address</title>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	if (us == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	int id = us.getId();
	%>
	<div class="container ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-4">
					<div class="caed-body">
						<h2 class="text-center text-success mb-4">Add Address</h2><a></a>
						<%
						String succMsg = (String) session.getAttribute("susmsg");
						if (succMsg != null) {
						%>
						<p class="text-center text-success bg-white"><%=succMsg%></p>
						<%
						session.removeAttribute("susmsg");
						}
						String failedMsg = (String) session.getAttribute("failmsg");
						if (failedMsg != null) {
						%>
						<p class="text-center text-danger"><%=failedMsg%></p>
						<%
						session.removeAttribute("failmsg");
						}
						%>
						<form action="add-address" method="post">
							<input type="hidden"  name="id" value=<%=id %>>
							<div class="form-group mt-2">
								<label for="address">Address</label> <input type="text"
									class="form-control" name="address" id="address">
							</div>
							<div class="form-group mt-2">
								<label for="landmark">Landmark</label> <input type="text"
									class="form-control" name="landmark" id="landmark">
							</div>
							<div class="form-group mt-2">
								<label for="city">City</label> <input type="text"
									class="form-control"  name="city" id="city">
							</div>
							<div class="form-group mt-2">
								<label for="state">State</label> <input type="text"
									class="form-control" name="state" id="state">
							</div>
							<div class="form-group mt-2">
								<label for="zip">Pin Code</label> <input type="text"
									class="form-control" name="pin" id="zip">
							</div>
							<button type="submit" class="btn btn-warning btn-block mt-3">Add
								Address</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>