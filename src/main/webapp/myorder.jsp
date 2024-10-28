<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/allCss.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #f0f1f2;"> 
<%@include file="all_component/navbar.jsp"%>
    <div class="container">
    <h4 class="text-center text-danger">Your Orders</h4>
        <table class="table table-striped mt-3 text-center ">
            <thead >
              <tr >
                <th scope="col">Order Id </th>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@fat</td>
                <td>@fat</td>
              </tr>
              
            </tbody>
          </table>
    </div>
    <%@include file="all_component/footer.jsp"%>
</body>
</html>