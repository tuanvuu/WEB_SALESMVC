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

*[id$=errors], .error {
	color: red;
	font-style: italic;
	font-size: 15px;
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

									<br />

									<form:form action="editPassword/${editPass.id}.htm"
										modelAttribute="editPass" method="post">
										<form:hidden path="id" />
										<form:hidden path="username" />
										<form:hidden path="avarta" />
										<form:hidden path="adress" />
										<form:hidden path="fullname" />
										<form:hidden path="phone" />
										<form:hidden path="password" />

										<c:choose>
											<c:when test="${editPass.roleid == 0}">
												<form:hidden path="roleid" value="0" />
											</c:when>
											<c:otherwise>
												<form:hidden path="roleid" value="1" />
											</c:otherwise>

										</c:choose>

										<div class="">
											<div class="icon-head-wthree">
												<h2 style="color: blue;">Đổi mật khẩu</h2>
											</div>

											<p style="color: red;">${message}</p>

											<div class="form-group">
												<label for="usr">Email</label>
												<form:input class="form-control" path="email"
													readonly="true" />
											</div>

											<div class="form-group">


												<form:errors path="password" />

												<input type="password" name="pass"
													placeholder=" Nhập mật khẩu cũ"
													oninput="this.setCustomValidity('')" class="form-control"
													oninput="this.setCustomValidity('')" /><span class="error">${msg1}</span>

											</div>
											<div class="form-group">
												<input type="password" name="newPass"
													placeholder="Nhập mật khẩu mới"
													oninput="this.setCustomValidity('')" class="form-control"
													oninput="this.setCustomValidity('')" /><span class="error">${msg2}</span>

											</div>
											<div class="form-group">
												<input type="password" name="confirmPass"
													placeholder="Xác nhận lại mật khẩu"
													oninput="this.setCustomValidity('')" class="form-control"
													oninput="this.setCustomValidity('')" /><span class="error">${msg3}</span>

											</div>
											<div class="btnn">


												<form:button class="btn btn-primary" type="submit"
													onclick="return confirm('Bạn có chắc chắn muốn đổi mật khẩu !')"> Đổi mật khẩu
											
											</form:button>
												<a href="index/1/1.htm"
													style="padding-left: 43px; font-size: 13px; color: #f47721; letter-spacing: 1px; text-transform: uppercase">Quay lại </a> <br>
											</div>


										</div>
									</form:form>



									<hr>

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
