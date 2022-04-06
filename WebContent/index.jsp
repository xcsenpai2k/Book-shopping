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
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
<%@include file="includes/head.jsp" %>
<style>
.test{
	width: 253px;
	height:253px;
}
</style>
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
		<div class="card-header my-3">Tất cả sản phẩm</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top test" src="product-images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Giá: <%=p.getPrice() %>đ</h6>
						<h6 class="category">Loại sách: <%=p.getCategory() %></h6>
						<div class="mt-2 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Thêm</a> 
							<br>
							<a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Mua ngay</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("Chưa có sản phẩm nào");
			}
			%>

		</div>
	</div>
<%@include file="includes/footer.jsp" %>


</body>
</html>