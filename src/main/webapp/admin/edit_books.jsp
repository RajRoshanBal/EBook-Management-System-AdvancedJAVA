<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BooksDtls"%>
<%@page import="java.awt.print.Book"%>
<%@page import="com.DAO.BookDAOimpl"%>
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
						<h4 class="text-center">Edit Books</h4>

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
						
						<% 
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
						BooksDtls b=dao.getBookById(id);
						 
						%>
						
						<form action="../editbooks" method="post"
						
							enctype="multipart/form-data">
							<input tupe="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getBookName() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getAuthor() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice() %>">
							</div>
                                 
                                 
                                 
                                 
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus" class="form-control">
									<% if("Active".equals(b.getStatus()))
										{
										%>
										<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
											<% 
										} else {
											
											%>
											<option value="Inactive">Inactive</option>
											<option value="Active">Active</option>
											<% 
											
											}
											%>
										
										
									
									
								
								
	</select>
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>