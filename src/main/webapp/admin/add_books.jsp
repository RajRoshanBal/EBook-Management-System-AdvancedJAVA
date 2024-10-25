<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background_color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="caontainer">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>

						<%
						// Fetch the succMsg from the session
						String succMsg = (String) session.getAttribute("succMsg");

						// Check if succMsg is not empty
						if (succMsg != null) {
						%>
						<p class="text-center text-success"><%=succMsg%></p>
						<%
						// Remove the succMsg from the session after displaying it
						session.removeAttribute("succMsg");
						}

						// Fetch the failedMsg from the session
						String failedMsg = (String) session.getAttribute("failedMsg");

						// Check if failedMsg is not empty
						if (failedMsg != null) {
						%>
						<p class="text-center text-danger"><%=failedMsg%></p>
						<%
						// Remove the failedMsg from the session after displaying it
						session.removeAttribute("failedMsg");
						}
						%>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="form-group">

								<label for="inputState">Book Categories</label> <select
									id="inputState" name="btype" class="form-control">

									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>