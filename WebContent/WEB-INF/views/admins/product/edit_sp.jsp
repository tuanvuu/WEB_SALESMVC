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

<title>Chỉnh sửa sản phẩm</title>

<!-- Custom fonts for this template-->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

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
							<h2 style="color: blue;">Chỉnh sửa Sản phẩm</h2>
							<h2 style="color: red;">${message}</h2>
							<c:choose>
								<c:when test="${userAdmin != null}">
									<form:form action="admins/edit/${id}.htm"
										modelAttribute="editProduct" enctype="multipart/form-data"
										method="post">
										<div class="form-group">
											<%-- <label for="pwd">Loại:</label>
											<form:select path="category.cateId" itemValue="cateId"
												itemLabel="cateName" items="${loaiSP}"
												cssClass="form-control">

											</form:select> --%>
											<label>Loại sản phẩm: </label>
											<form:select path="category.cateId" class="form-control">
												<c:forEach var="s" items="${category}">
													<option value="${s.cateId}">${s.cateName}</option>
												</c:forEach>
											</form:select>
										</div>
										<form:hidden path="id" />
										<div class="form-group">
											<label for="usr">ID</label>
											<form:input cssClass="form-control" path="id" readonly="true" />
										</div>
										<div class="form-group">
											<label for="email">Tên sản phẩm</label>
											<form:input path="name" cssClass="form-control" />
										</div>
										<div class="form-group">
											<label>Hình sản phẩm: </label>
											<div>
												<img alt="${editProduct.name}"
													src="images/${editProduct.image}" class="cart-thumb">
											</div>
											<input type="file" name="photo" accept="image/*"
												value="/${editProduct.image}" />
											<form:hidden path="image" />
										</div>
										<div class="form-group">
											<label for="pwd">giá:</label>
											<form:input path="price" cssClass="form-control" />
										</div>

										<div class="form-group">
											<label for="pwd">giảm giá: %</label>
											<form:input path="discount" cssClass="form-control" />
										</div>

										<div class="form-group">
											<label for="pwd">Mô tả:</label>
											<form:textarea cssClass="form-control" rows="5" path="mota"></form:textarea>
										</div>

										<div class="form-group">
											<label for="pwd">Chi tiết:</label>
											<form:textarea cssClass="form-control" rows="5"
												path="chitiet"></form:textarea>
										</div>


										<div>
											<form:button class="btn btn-primary" type="submit" 
												onclick="return confirm('Bạn có chắc sửa thông tin này ?')"> Chỉnh Sửa
											
											</form:button>
										</div>
									</form:form>
								</c:when>
								<c:otherwise>
									<a href="admins/login.htm"
										onclick="return confirm('Bạn cần đăng nhập mới có quyền sử dụng Admin?')">
										<button class="btn btn-primary" type="submit">Chỉnh
											sửa sản phẩm</button>
									</a>
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
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
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

</body>

</html>
