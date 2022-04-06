<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OrderDao"%>
<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Đăng nhập</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Book Shop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Giỏ hàng<span class="badge badge-danger">${cart_list.size()}</span></a>
        </li>
       	 <%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Đặt hàng</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Đăng xuất</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Đăng nhập</a></li>
				<%
				}
				%>
        </ul>
    </div>
  </div>
</nav>
	<div class="container">
		<div id="logreg-forms" class="card w-50 mx-auto my-5">
			<div class="fs-3 card-header text-center">Đăng nhập</div>
			<div class="card-body">
			
			  <p class="text-danger">${mess}</p>
				<form class="form-signin" action="user-login" method="post">
					<div class="form-group">
						<label>Email</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Nhập email" required>
					</div>
					<div class="form-group">
						<label>Mật khẩu</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Đăng nhập</button>
					</div>
					<hr>
                	<!-- <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button> -->
				</form>
				
				<form action="signup" method="post" class="form-signup">
					<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng ký</h1>
					<div class="form-group">
					<label>Tên</label>
					<input name="name" type="text" id="user-name" class="form-control" placeholder="Nhập tên: " required>
					</div>
					<div class="form-group">
					<label>Email</label>
					<input name="email" type="text" id="user-email" class="form-control" placeholder="Nhập email: " required>
					</div>
					<div class="form-group">
					<label>Số điện thoại</label>
					<input name="sdt" type="text" id="user-sdt" class="form-control" placeholder="Nhập sdt: " required>
					</div>
					<div class="form-group">
					<label>Địa chỉ</label>
					<input name="address" type="text" id="user-address" class="form-control" placeholder="Nhập địa chỉ: " required>
					</div>
					<div class="form-group">
					<label>Mật khẩu</label>
					<input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password: " required>
					</div>
					<div class="form-group">
					<label>Nhập lại mật khẩu</label>
					<input name="repass" type="password" id="user-repass" class="form-control" placeholder="Nhap lai password: " required>
					</div>
							
					<button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i>Đăng ký</button>
					
					<a href="index.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
				</form>
				<br>
			</div>
		</div>
	</div>
	<%@include file="/includes/transform.js"%>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>