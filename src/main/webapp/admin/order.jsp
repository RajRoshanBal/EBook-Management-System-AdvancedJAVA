<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center text-warning">Hello Admin</h3>
	<div class="card col-md-10 offset-md-1">
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
			OrderDaoImpl orderDao = new OrderDaoImpl(DBConnect.getConn());
			List<Order> orderlist = orderDao.getAllbooks();

			if (orderlist != null && !orderlist.isEmpty()) {
				for (Order order : orderlist) {
			%>
			<tr>
				<td class="text-danger"><%=order.getOrder_id()%></td>
				<td><%=order.getUsername()%></td>
				<td><%=order.getEmail()%></td>
				<td><%=order.getAddress()%></td>
				<td><%=order.getPhno()%></td>
				<td><%=order.getBook_name()%></td>
				<td><%=order.getAuthor()%></td>
				<td><%=order.getPrice()%></td>
				
				<td class="text-success"><%=order.getPayment_type()%></td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6" class="text-center">No orders found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>