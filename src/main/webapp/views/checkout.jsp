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
							<h3>Your Personal Details</h3>
							<div class="form-group">
								<label for="fullname">Full Name: ${user.fullname}</label> <br>
								<label for="phone">Phone: ${user.phone}</label> <br> <label
									for="email">Email: ${user.email}</label> <br>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<h3>Your Address</h3>
							<label for="address">${user.address.detail},
								${user.address.ward}, ${user.address.district},
								${user.address.city}</label> <br>
							<button class="btn btn-primary"
								style="background: black; border: black; margin-right: 0px;">
								Modify <i class="fa fa-check"></i>
							</button>
							<div class="form-group address-edit-form">
								<label for="city">City</label> <input type="text" id="city"
									class="form-control" value="${user.address.city}"> <label
									for="district">District</label> <input type="text"
									id="district" class="form-control"
									value="${user.address.district}"> <label for="ward">Ward</label>
								<input type="text" id="ward" class="form-control"
									value="${user.address.ward}"> <label for="detail">Detail</label>
								<input type="text" id="detail" class="form-control"
									value="${user.address.detail}"> <br>
								<button class="btn btn-primary"
									style="background: black; border: 2px solid black; float: right;">
									Save <i class="fa fa-check"></i>
								</button>
								<button class="btn btn-primary"
									style="background: white; border: 2px solid black; color: black; margin-right: 15px; float: right;">
									Cancel <i class="fa fa-check"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="panel-body row">
					<div class="col-md-12">
						<h3>Shipping Option</h3>
						<div class="radio-list" style="margin-left:50px">
							<label> <input type="radio" name="standardExpress"
								value="standardExpress" checked disabled> Standard
								express (free)
							</label>
						</div>
						<div class="form-group">
							<label for="delivery-comments">Add Comments About Your
								Order</label>
							<textarea id="delivery-comments" rows="8" class="form-control"></textarea>
						</div>
						<button class="btn btn-primary  pull-right" type="submit"
							id="button-shipping-method" data-toggle="collapse"
							data-parent="#checkout-page"
							data-target="#payment-method-content">Continue</button>
					</div>
				</div>

				<div class="panel-body row">
					<div class="col-md-6 col-sm-6">
						<h3>Payment Methods</h3>
						<table summary="Shopping cart">
							<c:forEach var="payment" items="${listPayment}">
								<c:if test="${payment.status == 1 }">
									<tr>
										<td class="goods-page-image"><c:if
												test="${payment.image.substring(0,5) != 'https'}">
												<c:url value="/image?fname=${payment.image}" var="imgUrl"></c:url>
											</c:if> <c:if test="${payment.image.substring(0,5) == 'https'}">
												<c:url value="${payment.image}" var="imgUrl"></c:url>
											</c:if> <img src="${imgUrl}" alt="${payment.name}" style="height: 40px; width: 40px; margin-left: 50px;"></td>
										<td>${payment.name}</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>

				<!-- BEGIN CONFIRM -->
				<div id="confirm" class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#checkout-page"
								href="#confirm-content" class="accordion-toggle"> Step 6:
								Confirm Order </a>
						</h2>
					</div>
					<div id="confirm-content" class="panel-collapse collapse">
						<div class="panel-body row">
							<div class="col-md-12 clearfix">
								<div class="table-wrapper-responsive">
									<table>
										<tr>
											<th class="checkout-image">Image</th>
											<th class="checkout-description">Description</th>
											<th class="checkout-model">Model</th>
											<th class="checkout-quantity">Quantity</th>
											<th class="checkout-price">Price</th>
											<th class="checkout-total">Total</th>
										</tr>
										<tr>
											<td class="checkout-image"><a href="#"><img
													src="../../assets/frontend/pages/img/products/model3.jpg"
													alt="Berry Lace Dress"></a></td>
											<td class="checkout-description">
												<h3>
													<a href="#">Cool green dress with red bell</a>
												</h3>
												<p>
													<strong>Item 1</strong> - Color: Green; Size: S
												</p> <em>More info is here</em>
											</td>
											<td class="checkout-model">RES.193</td>
											<td class="checkout-quantity">1</td>
											<td class="checkout-price"><strong><span>$</span>47.00</strong></td>
											<td class="checkout-total"><strong><span>$</span>47.00</strong></td>
										</tr>
										<tr>
											<td class="checkout-image"><a href="#"><img
													src="../../assets/frontend/pages/img/products/model4.jpg"
													alt="Berry Lace Dress"></a></td>
											<td class="checkout-description">
												<h3>
													<a href="#">Cool green dress with red bell</a>
												</h3>
												<p>
													<strong>Item 1</strong> - Color: Green; Size: S
												</p> <em>More info is here</em>
											</td>
											<td class="checkout-model">RES.193</td>
											<td class="checkout-quantity">1</td>
											<td class="checkout-price"><strong><span>$</span>47.00</strong></td>
											<td class="checkout-total"><strong><span>$</span>47.00</strong></td>
										</tr>
									</table>
								</div>
								<div class="checkout-total-block">
									<ul>
										<li><em>Sub total</em> <strong class="price"><span>$</span>47.00</strong>
										</li>
										<li><em>Shipping cost</em> <strong class="price"><span>$</span>3.00</strong>
										</li>
										<li><em>Eco Tax (-2.00)</em> <strong class="price"><span>$</span>3.00</strong>
										</li>
										<li><em>VAT (17.5%)</em> <strong class="price"><span>$</span>3.00</strong>
										</li>
										<li class="checkout-total-price"><em>Total</em> <strong
											class="price"><span>$</span>56.00</strong></li>
									</ul>
								</div>
								<div class="clearfix"></div>
								<button class="btn btn-primary pull-right" type="submit"
									id="button-confirm">Confirm Order</button>
								<button type="button"
									class="btn btn-default pull-right margin-right-20">Cancel</button>
							</div>
						</div>
					</div>
				</div>
				<!-- END CONFIRM -->
			</div>
			<!-- END CHECKOUT PAGE -->
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END SIDEBAR & CONTENT -->
</div>
</div>