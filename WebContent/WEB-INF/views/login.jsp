<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Trang Login Admin</title>

<!-- Custom fonts for this template-->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
<style>
div {
	/* margin: 5px; */
	padding: 5px;
}

*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 style="color: blue;">Đăng nhập tại đây!</h1>
									</div>
									<p style="color: red">${message}</p>
									<br />
									<form:form method="POST"
										action="${pageContext.request.contextPath}/login.htm"
										modelAttribute="login">
										<div class="form-group">
											<form:errors path="email" />
											<form:input path="email"
												class="form-control form-control-user" type="email"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="Vui lòng nhập Email" required="required" />
										</div>
										<div class="form-group">
											<form:errors path="password" />
											<form:input path="password"
												class="form-control form-control-user" type="password"
												id="exampleInputPassword" placeholder="Password"
												required="required" />
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<div class="btnn">


											<form:button class="btn btn-primary" type="submit"> Đăng nhập
											
											</form:button>
											<a href="signup.htm"
												onclick="return confirm('Chuyển hướng sang trang đăng kí !')"
												style="padding-left: 43px; font-size: 13px; color: #f47721; letter-spacing: 1px; text-transform: uppercase">Đăng
												kí tại đây</a> <br>

										</div>
										<hr>
										<a href="index.html" class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> Login with Google
										</a>
										<a href="index.html"
											class="btn btn-facebook btn-user btn-block"> <i
											class="fab fa-facebook-f fa-fw"></i> Login with Facebook
										</a>
									</form:form>

									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.htm">Forgot
											Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.htm">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="admin/vendor/jquery/jquery.min.js"></script>
	<script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="admin/js/sb-admin-2.min.js"></script>

</body>

</html>
