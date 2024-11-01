 <%@page import="com.entity.User"%>

<%@include file="allCss.jsp"%>
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
				<button class="btn btn-success" type="submit"><i class="fa-solid fa-magnifying-glass">&nbsp;<span id="txt" style="font-family: sans-serif; font-weight: 400;">Search</span></i></button>
			</form>
		</div>

		<div class="col-md-3">
		 <%
    // Check if userObj exists in the session
    Object userobj = session.getAttribute("userobj");
    if (userobj != null) {
%>
        <!-- Display when user is logged in -->
        <a href="login.jsp" class="btn btn-success">
            <i class="fa-solid fa-user-plus"></i> <%= ((User) userobj).getName() %>
        </a>
        <a data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-success text-white">
    <i class="fa-solid fa-right-to-bracket"></i> Logout
</a>

<%
    } else {
%>
        <!-- Display when user is not logged in -->
        <a href="../login.jsp" class="btn btn-success">
            <i class="fa-solid fa-user-plus"></i> Login
        </a>
        <a href="../register.jsp" class="btn btn-success text-white">
            <i class="fa-solid fa-right-to-bracket"></i> Register
        </a>
<%
    }
%>
			
       </div>
	</div>
</div>
<!-- Logout modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div clas="text-center">
       <h4>Do u want logout</h4>
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
       </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- end logout modal -->

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
					aria-current="page" href="home.jsp">Home</a></li>
				
				</form>
			</div>
		</div>
	</div>
</nav>