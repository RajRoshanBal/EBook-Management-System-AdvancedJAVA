<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Order"%>
<%@ page import="com.DAO.OrderDaoImpl"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>Your Orders</title>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	User us = (User) session.getAttribute("userobj");
	
	if (us == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	String uname = us.getName();
	%>
	<div class="container">
		<h4 class="text-center text-danger"><%=uname %>'s Order</h4>
		<table class="table table-striped mt-3 text-center">
			<thead>
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Address</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				int uid = us.getId();

				OrderDaoImpl orderDao = new OrderDaoImpl(DBConnect.getConn());
				List<Order> orderlist = orderDao.getOrdersByUserId(uid);

				if (orderlist != null && !orderlist.isEmpty()) {
					for (Order order : orderlist) {
				%>
				<tr>
					<td class="text-danger"><%=order.getOrder_id()%></td>
					<td><%=order.getUsername()%></td>
					<td><%=order.getBook_name()%></td>
					<td><%=order.getAuthor()%></td>
					<td><%=order.getPrice()%></td>
					<td><%=order.getAddress()%></td>
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
