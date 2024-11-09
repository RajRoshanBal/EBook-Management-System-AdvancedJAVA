<%@page import="com.entity.BooksDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .crd-ho:hover {
            background-color: #cffcf3;
        }
        
        #toast {
            display: none;
            background-color: #4CAF50;
            color: white;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 1;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
        }

        #toast.display {
            display: block;
        }
    </style>
    <meta charset="UTF-8">
    <title>All Recent Book</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>

<%
    String addCartMessage = (String) session.getAttribute("addCart");
    if (addCartMessage != null) { 
%>
    <div id="toast"><%= addCartMessage %></div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#toast').addClass("display");
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        });
    </script>
<%
        session.removeAttribute("addCart");
    }
%>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">
    <div class="row p-3">
        <%
        	User user=(User) session.getAttribute("userobj");
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            List<BooksDtls> list = dao.getAllNewBook();
            if (list != null && !list.isEmpty()) {
                for (BooksDtls b : list) {
        %>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt="" src="book/c.jpg" style="width: 100px; height: 150px" class="img-thumbnail">
                                <p><%= b.getBookName() %></p>
                                <p><%= b.getAuthor() %></p>
                                <p>Categories: <%= b.getBookCategory() %></p>
                                <div class="add">
                                    <a href="./cart?bid=<%=b.getBookID() %>&uid=<%= user.getId() %>" class="btn btn-danger btn-sm">
                                       <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                                    </a>
                                    <a href="view_books.jsp?bid=<%=b.getBookID() %>" class="btn btn-success btn-sm">View Details...</a>
                                    <a href="#" class="btn btn-danger btn-sm">
                                       <i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
        <%
                }
            } else {
        %>
            <p>No new books available at the moment.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
