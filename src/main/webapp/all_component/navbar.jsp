<%@page import="com.entity.User"%>
<div class="container-fluid"
	style="height: 10px; background-color: #757575"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-success" type="submit">
					<i class="fa-solid fa-magnifying-glass">&nbsp;<span id="txt"
						style="font-family: sans-serif; font-weight: 400;">Search</span></i>
				</button>
			</form>
		</div>
		<%
		// Check if userObj is not empty
		User us1=(User) session.getAttribute("userobj");
		if (us1!=null) {
		%>
		<div class="col-md-3">
			<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a> <a
				 class="btn btn-success"> 
				 <%=us1.getName() %>
			</a> <a href="./logout" class="btn btn-primary text-white"> <i
				class="fas fa-sign-in-alt"></i> Logout
			</a>
		</div>
		<%
		} else{
		%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-user-plus"></i> Login</a> <a href="register.jsp"
				class="btn btn-success text-white"><i
				class="fa-solid fa-right-to-bracket"></i> Register</a>

		</div>
		<%
		}
		%>




	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
						New Book</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="all_old_book.jsp" aria-disabled="true"><i
						class="fa-solid fa-book-open"></i> Old Book</a></li>
			</ul>
			<div class="set">
				<form role="search">
					<a href="setting.jsp" class="btn btn-light"> <i
						class="fa-solid fa-gear"></i> Settings
					</a>
					<button class="btn btn-light" type="submit">
						<i class="fa-solid fa-phone"></i> Contact Us
					</button>
				</form>
			</div>
		</div>
	</div>
</nav>