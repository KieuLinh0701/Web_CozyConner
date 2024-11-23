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
				<c:if test="${alert != null}">
					<h3 class="alert alertdanger">${alert}</h3>
				</c:if>
				<c:if test="${alert == null}">
					<h1>Shopping cart</h1>
					<div class="goods-page">
						<div class="goods-data clearfix">
							<div class="table-wrapper-responsive">
								<table summary="Shopping cart">
									<c:forEach var="cart" items="${listCart}">
										<tr>
											<th class="goods-page-image">Image</th>
											<th class="goods-page-description">Description</th>
											<th class="goods-page-quantity">Quantity</th>
											<th class="goods-page-price">Unit price</th>
											<th class="goods-page-total" colspan="2">Total</th>
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
												<p>Material: ${cart.product.material} Color:
													${cart.product.color} Height: ${cart.product.height} -
													Length: ${cart.product.length} - Width:
													${cart.product.width}</p>
											</td>
											<td class="goods-page-quantity">
												<div class="product-quantity">
													<input id="product-quantity" type="text"
														value="${cart.quantity}" readonly
														class="form-control input-sm">
												</div>
											</td>
											<td class="goods-page-price"><strong><span>$</span>${cart.product.price}</strong>
											</td>
											<td class="goods-page-total"><strong><span>$</span>${cart.product.price}*${cart.quantity}</strong>
											</td>
											<td class="del-goods-col"><a class="del-goods" href="#">&nbsp;</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

							<div class="shopping-total">
								<ul>
									<li><em>Sub total</em> <strong class="price"><span>$</span>47.00</strong>
									</li>
									<li><em>Shipping cost</em> <strong class="price"><span>$</span>3.00</strong>
									</li>
									<li class="shopping-total-price"><em>Total</em> <strong
										class="price"><span>$</span>50.00</strong></li>
								</ul>
							</div>
						</div>
						<button class="btn btn-default" type="submit">
							Continue shopping <i class="fa fa-shopping-cart"></i>
						</button>
						<button class="btn btn-primary" type="submit">
							Checkout <i class="fa fa-check"></i>
						</button>
					</div>
				</c:if>
			</div>
			<!-- END CONTENT -->
		</div>
		<!-- END SIDEBAR & CONTENT -->
	</div>
</div>