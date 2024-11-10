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
				<form action="${pageContext.request.contextPath}/register"
					method="post" class="form-horizontal" role="form"
					onsubmit="return validateForm()">
					<fieldset>
						<legend>Your email</legend>
						<div class="form-group">
							<label for="email" class="col-lg-4 control-label"> Email
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="email" name="email">
								<span id="emailError" class="error-message" style="color:#E02222; font-size:12px; font-style:italic;"></span>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>Your password</legend>
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">Password
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" id="password" name="password">
								<span id="passwordError" class="password-message" style="color:#E02222; font-size:12px; font-style:italic;"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="confirmPassword" class="col-lg-4 control-label">Confirm
								password <span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" id="confirmPassword"
									name="confirmPassword">
								<span id="confirmPasswordError" class="confirmPassword-message" style="color:#E02222; font-size:12px; font-style:italic;"></span>
							</div>
						</div>
					</fieldset>

					<div class="row">
						<div
							class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
							<button type="submit" class="registerbtn"
								style="background-color: black; height: 40px; width: 180px; color: white; font-size: 15px">CREATE
								AN ACCOUNT</button>
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


<script>
	function validateForm() {
		const email = document.getElementById("email").value;
		const password = document.getElementById("password").value;
		const confirmPassword = document.getElementById("confirmPassword").value;

		let hasError = false;
		
		//Kiểm tra email
		if (email === "") {
			document.getElementById("emailError").textContent = "Vui lòng nhập địa chỉ email";
			hasError = true;
		} else if (!validateEmail(email)) {
		    document.getElementById("emailError").textContent = "Địa chỉ email không hợp lệ";
		    hasError = true;
		} else {
			document.getElementById("emailError").textContent   = "";
		}
		
		//Kiểm tra password
		if (password === "") {
			document.getElementById("passwordError").textContent = "Vui lòng nhập mật khẩu";
			hasError = true;
		} else if (!validatePasswordStrength(password)) {
		    document.getElementById("passwordError").textContent = "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt";
		    hasError = true;
		} else {
			document.getElementById("passwordError").textContent = "";
		}
		
		//Kiểm tra confirmPassword
		if (confirmPassword === "") {
			document.getElementById("confirmPasswordError").textContent = "Vui lòng nhập mật khẩu xác nhận";
			hasError = true;
		} else if (confirmPassword !== password) {
			document.getElementById("confirmPasswordError").textContent = "Mật khẩu xác nhận không khớp";
			hasError = true;
		} else {
			document.getElementById("confirmPasswordError").textContent = "";
		}
		return !hasError;
	}
	
	//function về định dạng của email
	function validateEmail(email) {
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailRegex.test(email);
	}
	
	//function về định dạng của password
	function validatePasswordStrength(password) {
		const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?_&])[A-Za-z\d@$!%*?_&]{8,}$/;
		return passwordRegex.test(password);
	}
</script>
<!-- END CONTENT -->
