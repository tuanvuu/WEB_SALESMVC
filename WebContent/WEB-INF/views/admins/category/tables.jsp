<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<title>Thông tin Sản phẩm</title>
<!--Icon W3school-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom fonts for this template -->
<link href="admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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

					<!-- Page Heading -->



					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<c:choose>
							<c:when test="${userAdmin != null}">
								<div class="card-header py-3">
									<a href="admins/category/insert.htm" class="btn btn-primary"><i
										class="fas fa-plus"></i> Thêm loại sản phẩm</a>

								</div>


								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>ID</th>
													<th>Tên loại sản phẩm</th>
													<th>Sửa</th>
													<th>Xóa</th>

												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>ID</th>
													<th>Tên loại sản phẩm</th>
													<th>Sửa</th>
													<th>Xóa</th>
												</tr>
											</tfoot>
											<tbody>
												<c:choose>
													<c:when test="${userAdmin != null}">
														<c:forEach var="e" items="${category}">
															<tr>


																<td>${e.cateId}</td>

																<td>${e.cateName}</td>

																<td><a href="admins/category/edit/${e.cateId}.htm"
																	title="Sửa loại sản phẩm"><i class="fa fa-edit"></i></a></td>


																<%-- 	<td><a
																	href="admins/category/delete/${e.cateId}.htm"
																	title="Xoá sản phẩm"
																	onclick="return confirm('Bạn có chắc chắn xoá sản phẩm này?')">
																		<i class="fa fa-trash"></i>
																</a></td> --%>
																<td><a
																	class="btn btn-primary ${e.products.size() == 0 ? '':'disabled'}"
																	href="admins/category/delete/${e.cateId}.htm"
																	title="Xoá loại sản phẩm"
																	onclick="return confirm('Bạn có chắc chắn xoá loại sản phẩm này?')">
																		<i class="fa fa-trash"></i>
																</a></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<a href="admins/login.htm"
															onclick="return confirm('Bạn cần đăng nhập mới có quyền sử dụng Admin?')"><button
																class="googles-cart pgoogles-cart">
																<i class="fas fa-plus"></i> Quyền Admin
															</button> </a>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<a href="admins/login.htm"
									onclick="return confirm('Bạn cần đăng nhập mới có quyền sử dụng Admin?')">
									<button class="btn btn-primary" type="submit">Quyền
										Admin</button>
								</a>
							</c:otherwise>
						</c:choose>
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

	<!-- Page level plugins -->
	<script src="admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="admin/js/demo/datatables-demo.js"></script>

</body>

</html>
