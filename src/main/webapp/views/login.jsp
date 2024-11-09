<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!-- BEGIN CONTENT -->
<div class="col-md-12 col-sm-12">
	<div class="content-form-page">
		<div class="row">
			<div class="col-md-7 col-sm-7">
				<c:if test="${alert !=null}">
					<h3 class="alert alertdanger">${alert}</h3>
				</c:if>
				<form action="${pageContext.request.contextPath}/login" method="post" class="form-horizontal form-without-legend" role="form">
					<div class="form-group">
						<label for="email" class="col-lg-4 control-label">Email <span
							class="require">*</span></label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="email" name="email" require>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-lg-4 control-label">Password
							<span class="require">*</span>
						</label>
						<div class="col-lg-8">
							<input type="password" class="form-control" id="password" name="password">
							<input type="checkbox" checked="checked" name="remember"> Remember me
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8 col-md-offset-4 padding-left-0">
							<a href="${pageContext.request.contextPath}/forgotpassword">Forget Password?</a>
						</div>
					</div>
					<div class="row">
						<div
							class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
							<button type="submit" class="btn btn-primary" style="background-color:black">Login</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-5 col-sm-5 pull-right">
				<div class="form-info">
					<h2>
						<em>Important</em> Information
					</h2>
					<p>All fields marked with an asterisk (*) are required.</p>
					<p>Please ensure that all information is accurate and complete.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->


