 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EBook: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>

						<%
						// Fetch the FailedMsg from the session
						String FailedMsg = (String) session.getAttribute("FailedMsg");

						// Check if FailedMsg is not empty
						if (FailedMsg != null) {
						%>
						<h5 class="text-center text-danger"><%=FailedMsg%></h5>
						<%
						// Remove the FailedMsg from the session after displaying it
						session.removeAttribute("FailedMsg");
						}
						%>
						
						<%
						// Fetch the succMsg from the session
						String succMsg = (String) session.getAttribute("succMsg");

						// Check if succMsg is not empty
						if (succMsg != null) {
						%>
						<h5 class="text-center text-danger"><%=succMsg%></h5>
						<%
						// Remove the succMsg from the session after displaying it
						session.removeAttribute("succMsg");
						}
						%>
						
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">


								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" class="form-control"
										id="exampleInputPassword1" required="required" name="password">
								</div>

								<div class="text-center ">
									<button type="submit" class="btn btn-success ">Login</button>
									
								</div>
								<div class="d-flex mt-2"><br> <p>New user ? &nbsp;</p><a href="register.jsp" class="text-decoration-none">Create Account</a></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>


