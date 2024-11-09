<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- DangNhap, DangKy -->
<!-- BEGIN TOP BAR -->
<div class="pre-header">
	<div class="container">
			<!-- BEGIN TOP BAR MENU -->
			<div class="col-md-12 col-sm-12 additional-nav">
				<ul class="list-unstyled list-inline pull-right">
					<li><c:choose>
							<c:when test="${sessionScope.account == null}">
								<a href="${pageContext.request.contextPath}/login">Login</a>
								| <a href="${pageContext.request.contextPath}/register">Register</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/myaccount">${sessionScope.account.fullname}</a>
								| <a href="${pageContext.request.contextPath}/logout">Logout</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
			<!-- END TOP BAR MENU -->
		</div>
	</div>
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div class="header">
	<div class="container">
		<a class="site-logo" href="shop-index.html"><img
			src="${URL}assets/frontend/layout/img/logos/logo.png"
			alt="Furniture Shop UI"></a> <a href="javascript:void(0);"
			class="mobi-toggler"><i class="fa fa-bars"></i></a>

		<!-- BEGIN CART -->
		<div class="top-cart-block">
			<div class="top-cart-info">
				<a href="javascript:void(0);" class="top-cart-info-count">n items</a>
			</div>
			<i class="fa fa-shopping-cart" style="background-color:black"></i>

			<div class="top-cart-content-wrapper">
				<div class="top-cart-content" style="border:black">
					<ul class="scroller" style="height: 250px;">
						<li><a href="shop-item.html">
							<img src="${URL}assets/frontend/pages/img/cart-img.jpg" alt="Rolex Classic Watch" width="37" height="34"></a> 
							<span class="cart-content-count">x 1</span> 
							<strong>
							<a href="shop-item.html">Rolex Classic Watch</a>
							</strong> 
							<em>$1230</em> 
							<a href="javascript:void(0);" class="del-goods">&nbsp;
							</a>
						</li>
					</ul>
					<div class="text-right">
						<a href="shop-shopping-cart.html" class="btn btn-default" style="background-color:black">View Cart</a> 
						<a href="shop-checkout.html" class="btn btn-primary" style="background-color:black">Checkout</a>
					</div>
				</div>
			</div>
		</div>
		<!--END CART -->

		<!-- BEGIN NAVIGATION -->
		<div class="header-navigation" style="text-align: center;">
			<ul>
				<li> <a href="#"> Blogs </a></li>
				<li> <a href="#"> Design ideas </a></li>
				<li> <a href="#"> Admin theme </a></li>

				<!-- BEGIN TOP SEARCH -->
				<li class="menu-search"><span class="sep"></span> 
				<i class="fa fa-search search-btn"></i>
					<div class="search-box">
						<form action="#">
							<div class="input-group">
								<input type="text" placeholder="Search " class="form-control">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit">Search</button>
								</span>
							</div>
						</form>
					</div></li>
				<!-- END TOP SEARCH -->
				
			</ul>
		</div>
		<!-- END NAVIGATION -->
	</div>
</div>
<!-- Header END -->
						