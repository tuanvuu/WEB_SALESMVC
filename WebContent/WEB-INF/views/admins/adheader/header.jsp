<%@ page pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.htm">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			<sup>2</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link"
		href="index/1/1.htm"> <i class="fas fa-fw fa-tachometer-alt"></i>
			<span>Trang chủ bán hàng </span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Interface</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>Quản
				lí WEB</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<c:choose>
					<c:when test="${userAdmin == null}">
						<a class="collapse-item" href="admins/login.htm">Đăng nhập</a>
						<a class="collapse-item" href="admins/register.htm">Register</a>
						<a class="collapse-item" href="admins/forgot-password.htm">Quên
							mật khẩu</a>
					</c:when>
					<c:otherwise>
						<h6 class="collapse-header">Thông tin</h6>
						<a class="collapse-item" href="admins/user/tables.htm">Người dùng</a>
						<a class="collapse-item" href="admins/product/tables.htm">Sản phẩm</a>
						<a class="collapse-item" href="admins/category/tables.htm">Loại sản
							phẩm</a>
						<a class="collapse-item" href="admins/order/tables.htm">Đơn hàng</a>
					</c:otherwise>
				</c:choose>
				<
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	
	<!-- Nav Item - Pages Collapse Menu -->
	

	<!-- Nav Item - Charts -->

	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>


</body>
</html>