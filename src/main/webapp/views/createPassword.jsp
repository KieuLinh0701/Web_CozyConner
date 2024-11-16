<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${alert !=null}">
	<h3 class="alert alertdanger">${alert}</h3>
</c:if>

<!-- BEGIN CONTENT -->
<div class="col-md-12 col-sm-12">
	<div class="content-form-page">
		<div class="row">
			<div class="col-md-7 col-sm-7">
				<form action="${pageContext.request.contextPath}/createpassword"
					method="post" class="form-horizontal form-without-legend"
					role="form" onsubmit="return validateForm()">
					<div class="form-group">
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">Password
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" id="password"
									name="password"> <span id="passwordError"
									class="error-message"
									style="color: #E02222; font-size: 12px; font-style: italic;"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="confirmPassword" class="col-lg-4 control-label">Confirm
								password <span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" id="confirmPassword"
									name="confirmPassword"> <span id="confirmPasswordError"
									class="error-message"
									style="color: #E02222; font-size: 12px; font-style: italic;"></span>
							</div>
						</div>
						<div class="row">
							<div
								class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
								<button type="submit" class="btn btn-primary"
									style="background-color: black">Create a password</button>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->

<script>
function validateForm() {
	const password = document.getElementById("password").value;
	const confirmPassword = document.getElementById("confirmPassword").value;

	let hasError = false;

	//Kiểm tra password
	if (password === "") {
		document.getElementById("passwordError").textContent = "Please enter your password!";
		hasError = true;
	} else if (!validatePasswordStrength(password)) {
		document.getElementById("passwordError").textContent = "The password must be a minimum of 8 characters with a combination of upper and lower case letters, numbers, and special characters (@$!%*?_&)!";
		hasError = true;
	} else {
		document.getElementById("passwordError").textContent = "";
	}

	//Kiểm tra confirmPassword
	if (confirmPassword === "") {
		document.getElementById("confirmPasswordError").textContent = "Please confirm your password!";
		hasError = true;
	} else if (confirmPassword !== password) {
		document.getElementById("confirmPasswordError").textContent = "Your password and your confirmed password do not match!";
		hasError = true;
	} else {
		document.getElementById("confirmPasswordError").textContent = "";
	}
	return !hasError;
}
</script>
