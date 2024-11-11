<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="all_component/allCss.jsp"%>
<html>
<head>
<style>
.thank-you {
	text-align: center;
	margin-top: 100px;
}

.thank-you .fa-check-circle {
	color: #28a745;
	font-size: 100px;
	margin-bottom: 20px;
}

.thank-you h1 {
	font-weight: bold;
	font-size: 2.5em;
}

.thank-you p {
	font-size: 1.2em;
	margin: 15px 0;
}

.thank-you .btn-home {
	background-color: #007bff;
	color: #fff;
}

.thank-you .btn-view-order {
	background-color: #dc3545;
	color: #fff;
}
</style>
<meta charset="UTF-8">
<title>Order:Conform</title>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="thank-you">
			<i class="fas fa-check-circle"></i>
			<h1>Thank You</h1>
			<p>Your Order Successfully Placed</p>
			<p>Within 7 Days, Your Product will be Delivered to Your Address</p>
			<div>
				<a href="index.jsp" class="btn btn-primary">Home</a> <a
					href="myorder.jsp" class="btn btn-danger">View
					Order</a>
			</div>
		</div>
	</div>
</body>
</html>