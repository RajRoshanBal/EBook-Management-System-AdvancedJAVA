<%@page import="com.entity.BooksDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/boook.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #cffcf3;
}

.add {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}
</style>

</head>
<body style="background-color: #dce6e4">
 
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">EBook Management System</h2>
	</div>
   
	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
		<%
		BookDAOimpl dao2=new BookDAOimpl(DBConnect.getConn());
		List<BooksDtls> list2=dao2.getRecentBooks();
		for(BooksDtls b:list2)
		{%>
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
						if(b.getBookCategory().equals("Old"))
						{%>
						Catagories:<%=b.getBookCategory() %></p>
							<div class="add">
							
							 <a href="view_books.jsp?bid=<%=b.getBookID() %>"
								class="btn btn-success btn-sm ">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
						<%}else{
							%>
							
							Catagories:<%=b.getBookCategory() %></p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a>
								 <a href="view_books.jsp?bid=<%=b.getBookID() %>" class="btn btn-success btn-sm">View Details...</a>
								 <a href=""class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
							<%
						}
						%>
						
					</div>
				</div>
			</div>
		
		<%}
		%>
		
			
 
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All...</a>
		</div>

	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			
			<%
    BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
    List<BooksDtls> list = dao.getNewBook();
    if (list != null && !list.isEmpty()) {
        for (BooksDtls b : list) {
%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/c.jpg" style="width: 150px; height: 200px" class="img-thumbnail">
                        <p><%= b.getBookName() %></p>
                        <p><%= b.getAuthor() %></p>
                        <p>Categories: <%= b.getBookCategory() %></p>
                        <div class="add">
                            <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add To Cart</a>
                            <a href="view_books.jsp?bid=<%=b.getBookID() %>" class="btn btn-success btn-sm">View Details...</a>
                            <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
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
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All...</a>
		</div>

	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->

<div class="container">
    <h3 class="text-center">Old Books</h3>
    <div class="row">
         <%
		BookDAOimpl dao3=new BookDAOimpl(DBConnect.getConn());
		List<BooksDtls> list3=dao3.getOldBooks();
		for(BooksDtls b:list3)
		{%>
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/java.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p><%=b.getBookCategory() %></p>
						 <div class="add">
                            
                            <a href="view_books.jsp?bid=<%=b.getBookID() %>" class="btn btn-success btn-sm">View Details...</a>
                            <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
                        </div>
					</div>
				</div>
			</div>
		
		<%}
		%>
		
    </div>
    
    <div class="text-center mt-3">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All...</a>
    </div>
</div>

	
	<!-- End Old Book -->


	<%@include file="all_component/footer.jsp"%>


</body>
</html>