<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>Thêm tài khoản</title>

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

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<jsp:include page="../adheader/header.jsp"></jsp:include>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="../adinfor/adinfo.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="container">
						<div class="container_input">
							<h2>Thông Tin User</h2>
							<div style="color: red;">${msg}</div>
							<div style="color: blue;">${message}</div>
							<c:choose>
								<c:when test="${userAdmin != null}">
									<form:form action="admins/user/insert.htm"
										modelAttribute="user" method="post"
										enctype="multipart/form-data">
										<div class="form-group">

											<label>Phân quyền: </label>
											<form:select path="roleid" class="form-control">
												<option value="1" label="admin"
													${user.roleid == 1 ? 'selected' : ''} />
												<option value="0" label="user"
													${user.roleid == 0 ? 'selected' : ''} />
											</form:select>
										</div>
										<form:hidden path="id" />
										<form:hidden path="lock" value="false" />
										<div class="form-group">
											<label>Hình ảnh: </label>
											<div>
												<img alt="${user.fullname}" src="images/${user.avarta}"
													class="cart-thumb">
											</div>
											<input type="file" name="photo" accept="image/*"
												value="/${user.avarta}" />
											<form:hidden path="avarta" value="default.jpg" />
										</div>

										<div class="form-group">
											<label for="email">Tên email</label>

											<form:input type="text" path="email" class="form-control"
												required="required"
												pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
												title="Email sai định dạng!"
												oninput="this.setCustomValidity('')" />
											<form:errors path="email"></form:errors>
										</div>




										<div class="form-group">
											<label>Mật khẩu: </label>
											<form:input type="text" path="password" class="form-control"
												required="required"
												title="Mật khẩu bao gồm 8 ký tự chữ, số!"
												oninput="this.setCustomValidity('')" />
										</div>
										<div class="form-group">
											<label>Số điện thoại: </label>
											<form:input path="phone" type="tel" class="form-control"
												required="required" pattern="(03|05|07|08|09)+([0-9]{8})\b"
												title="Số điện thoại phải đúng 10 số !"
												oninput="this.setCustomValidity('')" />
										</div>
										<div class="form-group">
											<label>Địa chỉ: </label>
											<form:input path="adress" type="text" class="form-control"
												required="required" />
										</div>


										<div>
											<form:button class="btn btn-primary" type="submit"
												onclick="return confirm('Bạn có chắc thêm người dùng này ?')"> Thêm tài khoản
											
											</form:button>
										</div>



									</form:form>
								</c:when>
								<c:otherwise>
									<a href="admins/login.htm"
										onclick="return confirm('Bạn cần đăng nhập mới có quyền sử dụng Admin?')"><button
											class="googles-cart pgoogles-cart">
											<i class="fas fa-plus"></i> Quyền Admin
										</button> </a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Rời khỏi trang
						này ?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Bạn có chắc chắn đăng xuất</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<a class="btn btn-primary" href="admins/signout.htm">Đăng xuất</a>
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
	<script type="text/javascript">
		function showMessage() {
			if (confirm('Bạn cần đăng nhập mới được phép sử dụng?')) {
				$("<a href='signin.html'></a>").click();
				//window.location.href = "signin.html";
			}
		}
	</script>

</body>

</html>
