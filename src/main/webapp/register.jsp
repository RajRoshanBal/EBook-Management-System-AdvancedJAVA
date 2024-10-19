<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<%
						// Fetch the SuccessMsg from the session
						String successMsg = (String) session.getAttribute("successMsg");

						// Check if SuccessMsg is not empty
						if (successMsg != null) {
						%>
						<p class="text-center text-success"><%=successMsg%></p>
						<%
						// Remove the SuccessMsg from the session after displaying it
						session.removeAttribute("successMsg");
						}

						// Fetch the FailedMsg from the session
						String FailedMsg = (String) session.getAttribute("FailedMsg");

						// Check if FailedMsg is not empty
						if (FailedMsg != null) {
						%>
						<p class="text-center text-danger"><%=FailedMsg%></p>
						<%
						// Remove the FailedMsg from the session after displaying it
						session.removeAttribute("FailedMsg");
						}
						%>

						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Full Name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="fname">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									Number</label> <input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & conditions</label>
							</div>
							<button type="submit" class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>


