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
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/java.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Advanced Java</p>
						<p>B Prasanalakshmi</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/angular.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Angular</p>
						<p>Ravi Kiran</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/MySql.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>MySql</p>
						<p>Kevin Liey</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/sw.jpg" style="width: 150px; height: 200px"
							class="img-thumblin">
						<p>Software Engineering</p>
						<p>Amarjeet Singh</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View All...</a>
		</div>

	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/c.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>C Programming</p>
						<p>Dennish Ritchie</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/dsa.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>DSA In Java</p>
						<p>Robert Lafore</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/c++.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>OOP With C++</p>
						<p>Vinod Chandra</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/nodejs.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Node.js</p>
						<p>Adam Freeman</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add To Cart</a> <a href=""
								class="btn btn-success btn-sm">View Details...</a> <a href=""
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View All...</a>
		</div>

	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/pythonn.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Python Programming</p>
						<p>Yash A.Akbari</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-success btn-sm">View Details...</a> <a
								href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>



			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/c++.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>OOP With C++</p>
						<p>Vinod Chandra</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-success btn-sm">View Details...</a> <a
								href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/It.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Information Technology</p>
						<p>Anto Ramya</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-success btn-sm">View Details...</a> <a
								href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/math.jpg"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>Arithmetic for SSC</p>
						<p>Rakesh Yadav</p>
						<p>Catagories:New</p>
						<div class="add">
							<a href="" class="btn btn-success btn-sm">View Details...</a> <a
								href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i> 199</a>
						</div>
					</div>
				</div>
			</div>


		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View All...</a>
		</div>

	</div>
	<!-- End Old Book -->


	<%@include file="all_component/footer.jsp"%>


</body>
</html>