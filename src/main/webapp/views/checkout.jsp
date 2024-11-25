<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<div class="main">
	<div class="container">
		<!-- BEGIN SIDEBAR & CONTENT -->
		<div class="row margin-bottom-40">
			<!-- BEGIN CONTENT -->
			<div class="col-md-12 col-sm-12">
				<h1>Checkout</h1>
				<!-- BEGIN CHECKOUT PAGE -->
				<div class="panel-group checkout-page accordion scrollable"
					id="checkout-page">

					<div class="panel-body row">
						<div class="col-md-6 col-sm-6">
							<div class="goods-page">
								<div class="goods-data clearfix">
									<div class="table-wrapper-responsive">
										<h3>Your Personal Details</h3>
										<div class="form-group">
											<label for="fullname">Full Name: ${user.fullname}</label> <br>
											<label for="phone">Phone: ${user.phone}</label> <br> <label
												for="email">Email: ${user.email}</label> <br>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="goods-page">
								<div class="goods-data clearfix">
									<div class="table-wrapper-responsive">
										<h3>Your Address</h3>
										<div id="myDiv1">
											<label for="address">${user.address.detail},
												${user.address.ward}, ${user.address.district},
												${user.address.city}</label> <br>
											<button class="btn btn-primary" onclick="modify()"
												style="background: black; border: black; margin-left: 0px;">
												Modify <i class="fa fa-check"></i>
											</button>
										</div>
										<form
											action="${pageContext.request.contextPath}/checkout/updateaddress"
											method="post">
											<div id="myDiv2" style="display: none;">
												<div class="form-group address-edit-form">
													<input type="hidden" name="address_id" id="address_id"
														value="${user.address.address_id}"> <label
														for="city">City</label> <input type="text" id="city"
														name="city" class="form-control"
														value="${user.address.city}"> <label
														for="district">District</label> <input type="text"
														id="district" name="district" class="form-control"
														value="${user.address.district}"> <label
														for="ward">Ward</label> <input type="text" id="ward"
														name="ward" class="form-control"
														value="${user.address.ward}"> <label for="detail">Detail</label>
													<input type="text" id="detail" name="detail"
														class="form-control" value="${user.address.detail}">
													<br>
													<button class="btn btn-primary" type="submit"
														style="background: black; border: 2px solid black; float: right;">
														Save <i class="fa fa-check"></i>
													</button>
													<button class="btn btn-primary" onclick="cancel()"
														style="background: white; border: 2px solid black; color: black; margin-right: 15px; float: right;">
														Cancel <i class="fa fa-check"></i>
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel-body row">
						<div class="goods-page">
							<div class="goods-data clearfix">
								<div class="table-wrapper-responsive">
									<h3>Products</h3>
									<table summary="Shopping cart">
										<c:forEach var="cart" items="${listCart}">
											<tr>
												<th class="goods-page-image">Image</th>
												<th class="goods-page-description">Description</th>
												<th class="goods-page-quantity">Quantity</th>
												<th class="goods-page-price">Unit price</th>
												<th class="goods-page-total">Total</th>
											</tr>
											<tr>
												<td class="goods-page-image"><a href="#"> <c:if
															test="${cart.product.image.substring(0,5) != 'https'}">
															<c:url value="/image?fname=${cart.product.image}"
																var="imgUrl"></c:url>
														</c:if> <c:if
															test="${cart.product.image.substring(0,5) == 'https'}">
															<c:url value="${cart.product.image}" var="imgUrl"></c:url>
														</c:if> <img src="${imgUrl}" alt="${cart.product.name}">
												</a></td>
												<td class="goods-page-description">
													<p>Material: ${cart.product.material}</p>
													<p>Color: ${cart.product.color}</p>
													<p>Size: height: ${cart.product.height} - length:
														${cart.product.length} - width: ${cart.product.width}</p>
												</td>
												<td class="goods-page-price"><p>${cart.quantity}</p></td>
												<td class="goods-page-price"><p>${cart.product.price}</p>
												</td>
												<td class="goods-page-total"><p>${cart.product.price * cart.quantity}</p>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<form action="${pageContext.request.contextPath}/order"
							method="post">
							<input type="hidden" name="user_id" id="user_id"
														value="${sessionScope.account.id}">
							<div class="panel-body row">
								<div class="col-md-6 col-sm-6">
									<div class="goods-page">
										<div class="goods-data clearfix">
											<div class="table-wrapper-responsive">
												<h3>Payment Methods</h3>
												<table summary="Shopping cart">
													<c:forEach var="payment" items="${listPayment}">
														<c:if test="${payment.status == 1 }">
															<tr>
																<td class="goods-page-image"><c:if
																		test="${payment.image.substring(0,5) != 'https'}">
																		<c:url value="/image?fname=${payment.image}"
																			var="imgUrl"></c:url>
																	</c:if> <c:if
																		test="${payment.image.substring(0,5) == 'https'}">
																		<c:url value="${payment.image}" var="imgUrl"></c:url>
																	</c:if> <img src="${imgUrl}" alt="${payment.name}"
																	style="height: 40px; width: 40px; margin-left: 50px;"></td>
																<td>${payment.name}</td>
																<td><input type="radio" name="payment"
																	value="${payment.payment_id}" style="float: right;"></td>
															</tr>
														</c:if>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="goods-page">
										<div class="goods-data clearfix">
											<div class="table-wrapper-responsive">
												<h3>Shipping Option</h3>
												<br>
												<div class="radio-list" style="margin-left: 20px">
													<label> <input type="radio" name="standardExpress"
														value="standardExpress" checked disabled> Standard
														express (free)
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="panel-body row">
								<div class="col-md-6 col-sm-6">
									<div class="goods-page">
										<div class="goods-data clearfix">
											<div class="table-wrapper-responsive">
												<h3>Platform Vouchers</h3>
												<c:if test="${empty listDiscount}">
													<br>
													<p style="margin-left: 20px">No discount is available!</p>
												</c:if>
												<c:if test="${!empty listDiscount}">
													<table summary="Shopping cart">
														<c:forEach var="discount" items="${listDiscount}">
															<tr>
																<td>
																	<p style="font-weight: bold;">${discount.discountName}</p>
																	<p>${discount.description}</p>
																</td>
																<td><input type="radio" name="discount"
																	value="${discount.discountId}"
																	onchange="clickDiscount(${discount})"
																	style="float: right;"></td>
															</tr>
														</c:forEach>
													</table>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="goods-page">
										<div class="goods-data clearfix">
											<div class="table-wrapper-responsive">
												<h3>Order notes</h3>
												<textarea id="note" rows="8"
													class="form-control"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="checkout-total-block">
								<h3>Payment Details</h3>
								<ul>
									<li><em>Sub total</em> <strong class="price"
										name="subTotal" id="subTotal">${total}</strong></li>
									<li><em>Shipping cost</em> <strong class="price">0</strong>
									</li>
									<li><em>Voucher</em> <strong class="price"
										id="priceDiscount" name="priceDiscount">- 0</strong></li>
									<li class="checkout-total-price"><em>Total</em> <strong
										class="price">56.00</strong></li>
								</ul>
							</div>
							<div class="clearfix"></div>
							<button class="btn btn-primary pull-right" type="submit"
								id="button-confirm"
								style="margin-right: 0px; background: black;">Confirm
								Order</button>
							<button type="button" onclick="cancelOrder()"
								class="btn btn-default pull-right margin-right-20">Cancel</button>
						</form>
					</div>
					<!-- END CHECKOUT PAGE -->
				</div>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>

<script>
	function modify() {
		var div1 = document.getElementById("myDiv1");
		var div2 = document.getElementById("myDiv2");
		if (div1.style.display === "none") {
			div1.style.display = "block";
			div2.style.display = "none";
		} else {
			div1.style.display = "none";
			div2.style.display = "block";
		}
	}

	function cancel() {
		var div1 = document.getElementById("myDiv1");
		var div2 = document.getElementById("myDiv2");
		if (div2.style.display === "none") {
			div2.style.display = "block";
			div1.style.display = "none";
		} else {
			div2.style.display = "none";
			div1.style.display = "block";
		}
	}
	function clickDiscount(discount) {
		const subTotalElement = document.getElementById('subTotal');
		const subTotalString = subTotalElement.textContent.trim();
		const subTotal = parseFloat(subTotalString); // Loại bỏ ký hiệu '$' và chuyển đổi thành số

		const percentage = parseFloat(discount.percentage); // Chuyển đổi phần trăm từ chuỗi thành số và chia 100
		const discountAmount = subTotal * percentage; // Tính số tiền giảm giá

		updatePrice(discountAmount); // Cập nhật giá trị giảm giá vào giao diện
	}

	function updatePrice(newPrice) {
		const priceDiscountElement = document.getElementById('priceDiscount');
		priceDiscountElement.textContent = `- ${newPrice}`; // Định dạng giá với 2 chữ số thập phân
	}

	function cancelOrder() {
		window.location.href = "${pageContext.request.contextPath}/cart";
	}
</script>