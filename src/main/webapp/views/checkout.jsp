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
										<label for="phone">Phone: ${user.phone}</label> <br>
										<label for="email">Email: ${user.email}</label> <br>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<h3>Your Address</h3>
									<div class="form-group">
										<label for="company">Company</label> <input type="text"
											id="company" class="form-control">
									</div>
								</div>
							</div>
						</div>

					<!-- BEGIN PAYMENT ADDRESS -->
					<div id="payment-address" class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#checkout-page"
									href="#payment-address-content" class="accordion-toggle">
									Step 2: Account &amp; Billing Details </a>
							</h2>
						</div>

					<!-- BEGIN SHIPPING ADDRESS -->
					<div id="shipping-address" class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#checkout-page"
									href="#shipping-address-content" class="accordion-toggle">
									Step 3: Delivery Details </a>
							</h2>
						</div>
						<div id="shipping-address-content" class="panel-collapse collapse">
							<div class="panel-body row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<label for="firstname-dd">First Name <span
											class="require">*</span></label> <input type="text" id="firstname-dd"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="lastname-dd">Last Name <span
											class="require">*</span></label> <input type="text" id="lastname-dd"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="email-dd">E-Mail <span class="require">*</span></label>
										<input type="text" id="email-dd" class="form-control">
									</div>
									<div class="form-group">
										<label for="telephone-dd">Telephone <span
											class="require">*</span></label> <input type="text" id="telephone-dd"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="fax-dd">Fax</label> <input type="text" id="fax-dd"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="company-dd">Company</label> <input type="text"
											id="company-dd" class="form-control">
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<label for="address1-dd">Address 1</label> <input type="text"
											id="address1-dd" class="form-control">
									</div>
									<div class="form-group">
										<label for="address2-dd">Address 2</label> <input type="text"
											id="address2-dd" class="form-control">
									</div>
									<div class="form-group">
										<label for="city-dd">City <span class="require">*</span></label>
										<input type="text" id="city-dd" class="form-control">
									</div>
									<div class="form-group">
										<label for="post-code-dd">Post Code <span
											class="require">*</span></label> <input type="text" id="post-code-dd"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="country-dd">Country <span class="require">*</span></label>
										<select class="form-control input-sm" id="country-dd">
											<option value="">--- Please Select ---</option>
											<option value="244">Aaland Islands</option>
											<option value="1">Afghanistan</option>
											<option value="2">Albania</option>
										</select>
									</div>
									<div class="form-group">
										<label for="region-state-dd">Region/State <span
											class="require">*</span></label> <select
											class="form-control input-sm" id="region-state-dd">
											<option value="">--- Please Select ---</option>
											<option value="3513">Aberdeen</option>
											<option value="3514">Aberdeenshire</option>
											<option value="3515">Anglesey</option>
											<option value="3516">Angus</option>
										</select>
									</div>
								</div>
								<div class="col-md-12">
									<button class="btn btn-primary  pull-right" type="submit"
										id="button-shipping-address" data-toggle="collapse"
										data-parent="#checkout-page"
										data-target="#shipping-method-content">Continue</button>
								</div>
							</div>
						</div>
					</div>
					<!-- END SHIPPING ADDRESS -->

					<!-- BEGIN SHIPPING METHOD -->
					<div id="shipping-method" class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#checkout-page"
									href="#shipping-method-content" class="accordion-toggle">
									Step 4: Delivery Method </a>
							</h2>
						</div>
						<div id="shipping-method-content" class="panel-collapse collapse">
							<div class="panel-body row">
								<div class="col-md-12">
									<p>Please select the preferred shipping method to use on
										this order.</p>
									<h4>Flat Rate</h4>
									<div class="radio-list">
										<label> <input type="radio" name="FlatShippingRate"
											value="FlatShippingRate"> Flat Shipping Rate
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
						</div>
					</div>
					<!-- END SHIPPING METHOD -->

					<!-- BEGIN PAYMENT METHOD -->
					<div id="payment-method" class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#checkout-page"
									href="#payment-method-content" class="accordion-toggle">
									Step 5: Payment Method </a>
							</h2>
						</div>
						<div id="payment-method-content" class="panel-collapse collapse">
							<div class="panel-body row">
								<div class="col-md-12">
									<p>Please select the preferred payment method to use on
										this order.</p>
									<div class="radio-list">
										<label> <input type="radio" name="CashOnDelivery"
											value="CashOnDelivery"> Cash On Delivery
										</label>
									</div>
									<div class="form-group">
										<label for="delivery-payment-method">Add Comments
											About Your Order</label>
										<textarea id="delivery-payment-method" rows="8"
											class="form-control"></textarea>
									</div>
									<button class="btn btn-primary  pull-right" type="submit"
										id="button-payment-method" data-toggle="collapse"
										data-parent="#checkout-page" data-target="#confirm-content">Continue</button>
									<div class="checkbox pull-right">
										<label> <input type="checkbox"> I have read
											and agree to the <a title="Terms & Conditions" href="#">Terms
												& Conditions </a> &nbsp;&nbsp;&nbsp;
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END PAYMENT METHOD -->

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