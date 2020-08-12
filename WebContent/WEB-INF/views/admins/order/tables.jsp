<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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

<title>Thông tin đơn hàng</title>
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

<!-- Metis Menu -->
<script src="admi/js/metisMenu.min.js"></script>
<script src="admin/js/custom.js"></script>
<link href="admin/css/custom.css" rel="stylesheet">
<!--//Metis Menu -->

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
									<a href="admins/order/tables.htm" class="btn btn-primary"><i
										class="fas fa-plus"></i>Quản lí đơn đặt hàng</a>

								</div>


								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspaung="0">
											<thead>
												<tr>
													<th>ID</th>
													<th>Tên khách hàng</th>
													<th>Ngày đặt hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Email</th>
													<th>Ghi chú</th>
													<th>Hình thức thanh toán</th>
													<th>Trạng thái</th>
													<th>Xem đơn hang</th>
													<th>Xóa đơn hàng</th>

												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>ID</th>
													<th>Tên khách hàng</th>
													<th>Ngày đặt hàng</th>
													<th>Số điện thoại</th>
													<th>Địa chỉ</th>
													<th>Email</th>
													<th>Ghi chú</th>
													<th>Hình thức thanh toán</th>
													<th>Trạng thái</th>
													<th>Xem đơn hàng</th>
													<th>Xóa đơn hàng</th>

												</tr>
											</tfoot>
											<tbody>

												<c:forEach var="e" items="${listCart}">
													<tr>


														<td>${e.id}</td>
														<td>${e.name}</td>
														<td>${e.buyDate}</td>
														<td>${e.phone}</td>
														<td>${e.address}</td>
														<td>${e.email}</td>
														<td>${e.note}</td>
														<td>${e.payment}</td>
														<td><c:if test="${e.status == 0}">
																<p style="color: blue;">Đang chờ xác nhận</p>
															</c:if> <c:if test="${e.status == 1}">
																<p>Đang giao...</p>
															</c:if> <c:if test="${e.status == 2}">
																<p style="color: green;">Đã giao hàng</p>
															</c:if> <c:if test="${e.status == 3}">
																<p style="color: red;">Đã huỷ</p>
															</c:if></td>

														<td><a title="Chi tiết đơn hàng" data-toggle="modal"
															href="#orderDetail${e.id}"> <i class="fa fa-eye"></i>
														</a></td>
														<%-- <td><a href="admins/product/delete/${e.id}.htm"><i
																class="fa fa-trash"></i></a></td> --%>
														<td><a
															class="btn btn-primary ${e.status == 3 ? '':'disabled'}"
															href="admins/order/delete/${e.id}.htm"
															title="Xoá sản phẩm"
															onclick="return confirm('Bạn có chắc muốn xoá đơn hàng này?')">
																<i class="fa fa-trash"></i>
														</a></td>

													</tr>

													<!-- Modal -->
													<div class="modal fade" id="orderDetail${e.id}"
														tabindex="-1" role="dialog"
														aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div
															class="modal-dialog modal-dialog-centered modal-lg mw-100 w-75"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">Chi
																		tiết đơn hàng</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<div class="col-md-6">
																			<label>Mã đơn hàng: ${e.id}</label>
																		</div>
																		<div class="col-md-6 text-right">
																			<c:if test="${e.status == 0}">
																				<label style="color: blue;">Chờ xác nhận</label>
																			</c:if>
																			<c:if test="${e.status == 1}">
																				<label>Đang giao...</label>
																			</c:if>
																			<c:if test="${e.status == 2}">
																				<label style="color: green;">Đã giao</label>
																			</c:if>
																			<c:if test="${e.status == 3}">
																				<label style="color: red;">Đã huỷ</label>
																			</c:if>
																		</div>
																	</div>
																	<hr>
																	<!-- <div> -->
																	<c:set var="total" value="${0}"></c:set>
																	<c:forEach var="u" items="${e.cartItems}">
																		<c:set var="total"
																			value="${total + u.unitPrice * u.quantity}"></c:set>

																		<span> <a href="preview-1/${u.product.id}.htm"><img
																				style="height: 100px !important; width: 100px !important;"
																				src="images/${u.product.image}"
																				class="cart-thumb image" alt="${u.product.name}" /></a>
																			<a href="preview-1/${u.product.id}.htm">${u.product.name}</a>
																		</span>
																		<span style="float: right;"> ${u.quantity} <i>
																				x </i> <fmt:formatNumber value=" ${u.unitPrice}"
																				type="number" pattern="###,###" /> đ
																		</span>

																		<hr>
																	</c:forEach>
																	<!-- </div> -->

																	<div class="checkout-left row">
																		<div class="col-md-6 checkout-left-basket">
																			<h4>Thông tin đơn hàng</h4>

																			<ul style="list-style: none;">
																				<li>Ngày đặt: <span>${e.buyDate}</span></li>
																				<li>Tên người nhận: <span>${e.name}</span></li>
																				<li>Số điện thoại: <span>${e.phone}</span></li>
																				<li>Email: <span>${e.email}</span></li>
																				<li>Địa chỉ: <span>${e.address}</span></li>
																				<li>Ghi chú: <span>${e.note}</span></li>
																			</ul>
																		</div>

																		<div class="col-md-6 checkout-left-basket">
																			<h4>Thông tin thanh toán</h4>

																			<ul style="list-style: none;">
																				<li>Tổng tiền hàng: <span><fmt:formatNumber
																							value="${total}" type="number" pattern="###,###" />
																						đ</span></li>
																				<li>Phí vận chuyển : (GHN) 10% <span><fmt:formatNumber
																							value="${total * 0.1}" type="number"
																							pattern="###,###" /> đ</span></li>
																				<li>Phương thức thanh toán: <span>${e.payment}</span></li>
																				<li>Tổng tiền phải trả: <span
																					style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																							value="${total + total*0.1}" type="number"
																							pattern="###,###" /> đ</span></li>


																			</ul>
																		</div>
																	</div>


																</div>

																<div class="my-3 border-top">

																	<c:if test="${e.status == 0}">
																		<div class="row">
																			<div class="col-md-6">
																				<a class="btn btn-danger"
																					href="admins/order/delete/${e.id}.htm">Huỷ đơn
																					hàng</a>
																			</div>
																			<div class="col-md-6 text-right">
																				<a class="btn btn-primary"
																					href="admins/order/xacnhan/${e.id}.htm">Xác
																					nhận đơn hàng</a>
																			</div>
																		</div>


																	</c:if>
																	<c:if test="${e.status == 1}">
																		<a class="btn btn-success"
																			href="admins/order/finish/${e.id}.htm">Đã giao
																			hàng</a>
																	</c:if>

																</div>
															</div>
														</div>
													</div>
												</c:forEach>


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
