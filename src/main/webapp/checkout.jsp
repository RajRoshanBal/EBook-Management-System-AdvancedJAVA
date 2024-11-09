<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp"%>
<%
    User user = (User) session.getAttribute("userobj");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Checking for success and failure messages from the session
    String succMsg = (String) session.getAttribute("sucMsg");
    String failedMsg = (String) session.getAttribute("failedMsg");
    if (succMsg != null) {
%>
    <div class="alert alert-success" role="alert"><%= succMsg %></div>
<%
        session.removeAttribute("succMsg");
    }
    if (failedMsg != null) {
%>
    <div class="alert alert-danger" role="alert"><%= failedMsg %></div>
<%
        session.removeAttribute("failedMsg");
    }
%>
<input type="hidden" value="<%=user.getId() %>" id="uid"></input>
<div class="container">
    <div class="row p-2">
        <div class="col-md-6">
            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Item</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Book Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                CartDaoimpl dao = new CartDaoimpl(DBConnect.getConn());
                                List<Cart> cartList = dao.getBooKByUser(user.getId());
                                Double totalPrice = 0.00;

                                for (Cart item : cartList) {
                                    totalPrice += item.getPrice();
                            %>
                            <tr>
                                <th scope="row"><%= item.getBookName() %></th>
                                <td><%= item.getAuthor() %></td>
                                <td><%= item.getPrice() %></td>
                                <!-- Updated URL to pass both bid and uid -->
                                <td><a href="Remove_book?bid=<%= item.getBid() %>&uid=<%= user.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                            </tr>
                            <% } %>
                            <tr>
                                <td>Total Price</td>
                                <td></td>
                                <td></td>
                                <td><%= totalPrice %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Details for Order</h3>
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName" value="<%= user.getName() %>" readonly="readonly">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" id="inputEmail" value="<%= user.getEmail() %>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputPhone">Phone Number</label>
                                <input type="number" class="form-control" id="inputPhone" value="<%= user.getPhno() %>">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control" id="inputAddress">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputLandmark">Landmark</label>
                                <input type="text" class="form-control" id="inputLandmark">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputCity">City</label>
                                <input type="text" class="form-control" id="inputCity">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputState">State</label>
                                <input type="text" class="form-control" id="inputState">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPin">Pin Code</label>
                                <input type="text" class="form-control" id="inputPin">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Payment Mode</label>
                            <select class="form-control">
                                <option> --Select-- </option>
                                <option>Cash on Delivery</option>
                            </select>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-warning">Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
