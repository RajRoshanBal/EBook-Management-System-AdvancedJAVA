<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@include file="all_component/allCss.jsp" %>
			<style>
				.container {
					display: flex;
					justify-content: center;
				}

				.main {
					display: flex;
					justify-content: center;
					

				}

				.main div {
					display: flex;
					justify-content: center;
					align-items: center;
					margin: 0px 20px;
					width: 81vh;
					height: 20vh;
					background-color: rgba(250, 255, 255, 0.729);
					border-radius: 2%;
					flex-direction: column;
					font-size: 30px;
					font-family: 'Times xNew Roman', Times, serif;
					color: black;
				}

				.main div a {
					text-decoration: none;
					color: black;
				}

				.main div:hover{
					h2 i{
						color: green;
					}
					a{
						color: green;
					}
				}
				
				
				.second{
					display: flex;
					justify-content: center;
				}
				.second div{
					margin: 0px 20px;
					margin-top: 20px;
					display: flex;
					width: 52vh;
					height: 30vh;
					justify-content: center;
					align-items: center;
					background-color: rgba(250, 255, 255, 0.729);;
					border-radius: 2%;
					flex-direction: column;
				}
				
				.second a{
					font-size: 30px;
					font-family: 'Times xNew Roman', Times, serif;
					color: black;
					text-decoration: none;
				}

				.second div:hover{
					h2 i{
						color: green;
					}
					a{
						color: green;
					}
				}

				

			</style>

	</head>

	<body style="background-color:  #dce6e4;">
		<%@include file="all_component/navbar.jsp" %>
			<div class="container">
				<div class="user">
					<h1>Hello User</h1><br>
				</div>
			</div>
			<div class="main">
				<div class="sellbook">
					<h2><i class="fa-solid fa-book-open"></i></h2>
					<a href="selloldbook.jsp">Sellold Book</a>
				</div>
				<div class="updateprofile" >
					<h2><i class="fa-solid fa-user"></i></h2>
					<a href="updateprofile.jsp">Update Profile</a>
				</div>
			</div>
			<div class="second">
				<div class="address">
					<h2><i class="fa-solid fa-location-dot"></i></h2>
					<a href="address.jsp">Address</a>
				</div>
				<div class="orders">
					<h2><i class="fa-solid fa-suitcase-rolling"></i></h2>
					<a href="myorders.jsp">My Orders</a>
				</div>
				<div class="help">
					<h2><i class="fa-solid fa-phone-flip"></i></h2>
					<a href="help.jsp">Help Center</a>
				</div>
			</div>
			<!-- <%@include file="all_component/footer.jsp" %> -->
	</body>

	</html>