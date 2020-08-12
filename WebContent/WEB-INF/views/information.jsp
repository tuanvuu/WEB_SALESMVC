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

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="container">
						
						
								
									<div class="text-center">
										<h1 style="color: blue;">Thông tin tài khoản!</h1>
									</div>
									<div style="color: red;">${message}</div>
									<form:form action="information/${edituser.id}.htm"
										method="post" enctype="multipart/form-data"
										modelAttribute="edituser" class="com-mail">


										<div>
											<form:hidden path="id" />
											<form:hidden path="password" />
											<c:choose>
												<c:when test="${edituser.roleid == 0}">
													<form:hidden path="roleid" value="0" />
												</c:when>
												<c:otherwise>
													<form:hidden path="roleid" value="1" />
												</c:otherwise>

											</c:choose>

											<div class="form-group">
												<label for="usr">Tài khoản</label>
												<form:input class="form-control" path="email"
													readonly="true" />
											</div>
											<div class="form-group">
												<label>Hình ảnh: </label>
												<div>
													<img alt="${edituser.fullname}"
														src="images/${edituser.avarta}" class="cart-thumb" style="height:100!important; width: 100px!important; ">
												</div>
												<input type="file" name="photo" accept="image/*"
													value="/${edituser.avarta}" />
												<form:hidden path="avarta" />
											</div>
											<div class="form-group">

												<label for="usr">Họ tên</label>
												<form:input class="form-control" path="fullname" />

											</div>
											<div class="form-group">
												<label>Số điện thoại: </label>
												<form:input path="phone" value="${edituser.phone}"
													type="tel" class="form-control" required="required"
													pattern="(03|05|07|08|09)+([0-9]{8})\b"
													title="Số điện thoại phải đúng 10 số !"
													oninput="this.setCustomValidity('')" />
											</div>

											<div class="form-group">

												<label for="usr">Địa chỉ</label>
												<form:input class="form-control" path="adress" />

											</div>




											<div class="btnn">


												<form:button class="btn btn-primary" type="submit"> Sửa
											
											</form:button>
												<a href="index/1/1.htm"
											
													style="padding-left: 43px; font-size: 13px; color: #f47721; letter-spacing: 1px; text-transform: uppercase">Quay lại trang chủ</a> <br>

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
