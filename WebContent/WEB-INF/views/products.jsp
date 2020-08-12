<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>

<head>
<title>Web bán bể cá mini</title>
<base href="${pageContext.servletContext.contextPath }/">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/stylekm.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link href='//fonts.googleapis.com/css?family=Monda' rel='stylesheet'
	type='text/css'>
<link href='//fonts.googleapis.com/css?family=Doppio+One'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/bootstrapkm.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- css header -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/stylekm.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<link href='//fonts.googleapis.com/css?family=Monda' rel='stylesheet'
	type='text/css'>
<link href='//fonts.googleapis.com/css?family=Doppio+One'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/bootstrapkm.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- jQuery -->
<script src="js/jquery.minhd.js"></script>

<!-- jQuery Validation -->
<script src="js/jquery.validate.minhd.js"></script>

<!-- jQuery UI -->
<link href="css/jquery-ui.minhd.css" rel="stylesheet" />
<script src="js/jquery-ui.minhd.js"></script>

<!-- Bootstrap -->
<link href="css/bootstrap.minhd.css" rel="stylesheet" />
<script src="js/bootstrap.minhd.js"></script>

<!-- eShop -->
<link href="css/eshop.css" rel="stylesheet" />
<link href="csslogin/discount-tag.css" rel='stylesheet' type='text/css' />
<link href="csslogin/bootstrap.css" rel='stylesheet' type='text/css' />

<link rel="stylesheet" href="csslogin/owl.carousel.css" type="text/css"
	media="all">
<link rel="stylesheet" href="csslogin/owl.theme.css" type="text/css"
	media="all">
<link href="csslogin/style.css" rel='stylesheet' type='text/css' />
<link href="csslogin/all.css" rel="stylesheet">
<!-- css header -->
<!-- cssLogin -->
<style type="text/css">
.pic {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: 2px solid #FF4E00;
	align-items: center;
	justify-content: center;
}

*[id$=errors] {
	color: red;
	font-style: italic;
}

.btn {
	color: #828284;
}

.btn:hover {
	color: #FF4E00;
}
/* mini-cart */
.cart-thumb {
	border: 1px solid #ddd; /* Gray border */
	border-radius: 4px; /* Rounded border */
	margin-right: 20px;
	width: 150px; /* Set a small width */
}

.cart-thumb:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

/* mini-cart */
.pro-thumb:hover {
	border-radius: 4px; /* Rounded border */
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

/* CSS used here will be applied after bootstrap.css */
.badge-notify {
	color: white;
	background: red;
	position: relative;
	-moz-transform: translate(-100%, -100%); /* For Firefox */
	-ms-transform: translate(-100%, -100%); /* for IE */
	-webkit-transform: translate(-100%, -100%);
	/* For Safari, Chrome, iOS */
	-o-transform: translate(-100%, -100%);
	position: relative; /* For Opera */
}

.image-icon {
	position: relative;
}

.image-icon .imgage {
	display: block;
}

.image-icon .icon {
	position: absolute;
	top: 0;
	right: 0;
}

.nn-img {
	max-width: 100%;
	height: 150px !important;
}

.nn-name {
	font-variant: small-caps;
	color: red;
	font-size: 12px;
}

.nn-desc {
	height: 50px;
	font-size: 14px;
}
</style>
</head>

<body>
	<link href="css/flexslider.css" rel='stylesheet' type='text/css' />
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(function() {
			SyntaxHighlighter.all();
		});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<script src="jslogin/jquery-2.2.3.min.js"></script>
	<script src="jss/minicart.min.js"></script>
	<div class="wrap">
		<div class="header">
			<!-- 	header -->
			<div class="header" id="home">
				<div class="container"></div>
			</div>
			<!-- header -->
			<div class="header_top">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt="" /></a>
				</div>
				<div class="">

					<div class="search_box">
						<form action="product/list-by-keywords.htm" method="post">
							<input type="text" name="keywords" class="form-control"
								placeholder="Tìm kiếm sản phẩm" value="${param.keywords}">
						</form>
					</div>

				</div>
				<div class="col-md-3 top-info-cart text-right mt-lg-4">
					<ul class="cart-inner-info">

						<c:choose>
							<c:when test="${userLogin == null}">
								<div>
									<a href="login.htm" role="button"><span class="btn"><i
											class="fas fa-sign-in-alt"></i> Đăng nhập</span></a> <a
										href="signup.htm" role="button"><span class="btn"><i
											class="fas fa-user-plus"></i> Đăng ký</span></a>
								</div>
							</c:when>
							<c:otherwise>

								<li class="dropdown"><span class="btn"><img
										class="pic" alt="" src="images/${userLogin.avarta}"> </span>
									<div class="dropdown-menu dropdown-menu-right text-center"
										style="width: 200px;">


										<a href="information/${userLogin.id}.htm" role="button"><span
											class="btn" style="padding: 8px 0px 0px 0px;">Thông
												tin tài khoản <i class="fas fa-user-cog"></i>
										</span></a>
										<%-- </c:otherwise>
									</c:choose> --%>

										<div class="dropdown-divider"></div>
										<a href="order.htm"><span class="btn"
											style="padding: 0px 0px 0px 0px;">Thông tin đơn mua <i
												class="fas fa-file-invoice"></i></span></a>
										<div class="dropdown-divider"></div>
										<a href="signout.htm"><span class="btn"
											style="padding: 0px 0px 8px 0px;">Đăng xuất <i
												class="fas fa-sign-out-alt"></i></span></a>
									</div></li>

								<div id="mini-cart-shop" style="display: inline;">
									<li class="dropdown"><a href="checkout.htm" role="button"
										class="btn"> <i class="fas fa-shopping-cart fa-lg"></i> <span
											class="badge badge-notify">${totalItem}</span>
									</a>
										<ul class="dropdown-menu dropdown-menu-right"
											style="margin: 0; padding: 0; list-style: none;">
											<c:choose>
												<c:when test="${totalItem == 0}">
													<div class="text-center" style="margin: 20px;">
														<span style="font-size: large;">Giỏ hàng trống!</span>
													</div>
												</c:when>
												<c:otherwise>
													<li
														style="padding: 30px 30px 0px 30px; margin: unset; display: block;"><c:forEach
															var="i" items="${listCartItem}">

															<div style="display: inline-flex;">


																<div class="image-icon">
																	<a href="preview-1/${i.product.id}.htm"><img
																		src="images/${i.product.image}"
																		class="cart-thumb image" alt="${i.product.name}" /></a>
																	<c:if
																		test="${i.product.discount > 0 && i.product.discount <= 1}">
																		<span class="fa-stack fa-lg icon"> <i
																			class="fa fa-tag fa-stack-2x"></i> <i
																			class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																					value="${i.product.discount}" type="percent" /></i>
																		</span>
																	</c:if>
																</div>





																<div>
																	<a id="delete-item" href="cart/delete/${i.id}.htm"
																		role="button" class="btn" style="float: right;"><i
																		class="far fa-trash-alt"></i></a>

																	<h6 style="width: 200px;">
																		<a href="preview-1/${i.product.id}.htm">${i.product.name}</a>
																	</h6>

																	<p>
																		${i.quantity} x <span><fmt:formatNumber
																				value=" ${i.unitPrice}" type="number"
																				pattern="###,###" /> đ</span>
																	</p>

																</div>

															</div>
															<hr>

														</c:forEach></li>


													<li
														style="display: block; text-align: center !important; margin: 0px;"><span><strong>Tạm
																tính: </strong> <fmt:formatNumber value="${totalPrice}"
																type="number" pattern="###,###" /> VNĐ</span></li>
													<hr>
													<li
														style="display: block; text-align: center !important; margin: 0px; padding-bottom: 20px;"><a
														href="checkout.htm" class="btn btn-default btn-cart">Thanh
															toán</a></li>
												</c:otherwise>
											</c:choose>


										</ul></li>
								</div>

							</c:otherwise>
						</c:choose>


					</ul>
				</div>

				<div class="clear"></div>

				<div class="clear"></div>
			</div>
			<div class="h_menu">
				<a id="touch-menu" class="mobile-menu" href="#">Menu</a>
				<nav>
					<ul class="menu list-unstyled">
						<li><a href="index/1/1.htm">Trang chủ</a></li>
						<li><a href="category/1/1.htm">Bể cá mini</a>
							<ul class="sub-menu list-unstyled sub-menu2">

							</ul></li>
						<li><a href="category/3/1.htm">Phụ kiện </a>
							<ul class="sub-menu list-unstyled sub-menu2">

							</ul></li>
						<li><a href="category/2/1.htm">Thức ăn </a>
							<ul class="sub-menu list-unstyled sub-menu2">
								<div class="navg-drop-main"></div>
							</ul></li>
						<li><a href="about.htm">Giới thiệu</a></li>
						<li><a href="faq.htm">Chính sách mua hàng</a></li>
						<li><a href="contact.htm">LIÊN HỆ</a></li>
					</ul>
				</nav>
				<script src="js/menu.js" type="text/javascript"></script>
			</div>

		</div>

		<!-- 		bottom -->
		<link href="css/flexslider.css" rel='stylesheet' type='text/css' />
		<script defer src="js/jquery.flexslider.js"></script>
		<script type="text/javascript">
			$(function() {
				SyntaxHighlighter.all();
			});
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<div class="header_bottom">

			<div class="header_bottom_left">
				<div class="section group">
					<c:forEach var="p" items="${products}" begin="0" end="1">
						<div class="listview_1_of_2 images_1_of_2">

							<div class="listimg listimg_2_of_1">

								<a href="preview-1/${p.id}.htm"> <img
									src="images/${p.image}">
								</a>
							</div>
							<div class="text list_2_of_1">

								<h2>${p.name}</h2>
								<p>Mã SP:${p.category.cateId}</p>
								<p style="color: red;">
									Giá:
									<fmt:formatNumber value=" ${p.price } " pattern="###,###"></fmt:formatNumber>
								</p>

								<div style="padding: 24px 38px 10px;">
									<c:choose>
										<c:when test="${userLogin != null}">
											<form:form action="cart/insert.htm" modelAttribute="cartItem">
												<!-- <input type="hidden" name="page" value="index"/> -->
												<form:hidden path="id" />

												<form:input type="hidden" path="quantity" value="1" />
												<form:input type="hidden" path="unitPrice"
													value="${p.price-(p.price*(p.discount/100))}" />
												<form:input type="hidden" path="product.id" value="${p.id}" />
												<form:input type="hidden" path="cart.id" value="${cart.id}" />

												<form:button type="submit" style="color:red"
													class="googles-cart pgoogles-cart">
													<i class="fas fa-cart-plus"></i>
												</form:button>
											</form:form>
										</c:when>
										<c:otherwise>
											<a href="login.htm"
												onclick="return confirm('Đăng nhập để mua hàng?')"><button
													class="googles-cart pgoogles-cart">
													<i class="fas fa-cart-plus"></i>
												</button></a>
										</c:otherwise>
									</c:choose>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>


				<div class="section group">
					<c:forEach var="p" items="${products}" begin="2" end="3">
						<div class="listview_1_of_2 images_1_of_2">

							<div class="listimg listimg_2_of_1">

								<a href="preview-1/${p.id}.htm "> <img
									src="images/${p.image}">
								</a>
							</div>
							<div class="text list_2_of_1">

								<h2>${p.name}</h2>
								<p>Mã SP:${p.category.cateId}</p>
								<p style="color: red;">
									Giá:
									<fmt:formatNumber value=" ${p.price } " pattern="###,###"></fmt:formatNumber>
								</p>


								<div style="padding: 24px 38px 10px;">
									<c:choose>
										<c:when test="${userLogin != null}">
											<form:form action="cart/insert.htm" modelAttribute="cartItem">
												<!-- <input type="hidden" name="page" value="index"/> -->
												<form:hidden path="id" />

												<form:input type="hidden" path="quantity" value="1" />
												<form:input type="hidden" path="unitPrice"
													value="${p.price-(p.price*(p.discount/100))}" />
												<form:input type="hidden" path="product.id" value="${p.id}" />
												<form:input type="hidden" path="cart.id" value="${cart.id}" />

												<form:button type="submit" style="color:red"
													class="googles-cart pgoogles-cart">
													<i class="fas fa-cart-plus"></i>
												</form:button>
											</form:form>
										</c:when>
										<c:otherwise>
											<a href="login.htm"
												onclick="return confirm('Đăng nhập để mua hàng?')"><button
													class="googles-cart pgoogles-cart">
													<i class="fas fa-cart-plus"></i>
												</button></a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


			<div class="header_bottom_right_images">
				<!-- FlexSlider -->
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li><img src="images/1.jpg" alt="" /></li>
							<li><img src="images/2.jpg" alt="" /></li>
							<li><img src="images/3.jpg" alt="" /></li>
							<li><img src="images/4.jpg" alt="" /></li>
						</ul>
					</div>
				</section>
				<!-- FlexSlider -->
			</div>
			<div class="clear"></div>
		</div>
		<!-- 		bottom -->
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Sản phẩm đặc sắc</h3>
					</div>
					<div class="sort">
						<p>
							Sắp xếp: <select>
								<option>Lowest Price</option>
								<option>Highest Price</option>
								<option>Lowest Price</option>
								<option>Lowest Price</option>
								<option>Lowest Price</option>
								<option>In Stock</option>
							</select>
						</p>
					</div>
					<div class="show">
						<p>
							Show: <select>
								<option>4</option>
								<option>8</option>
								<option>12</option>
								<option>16</option>
								<option>20</option>
								<option>In Stock</option>
							</select>
						</p>
					</div>



					<div class="page-no">
						<c:forEach var="i" begin="0" end="${totalPage-1}"
							varStatus="status">


							<a class="btn btn-outline-primary"
								href="category/${cateId}/${i+1}.htm"
								${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
								<span
								${status.index + 1 == currentPage ? 'style="color: white;"':''}>
									${i+1}</span>
							</a>






						</c:forEach>
					</div>
					<div class="clear"></div>
				</div>
				<div class="section group">

					<c:forEach var="p" items="${listProduct}">

						<div class="grid_1_of_4 images_1_of_41"
							style="height: 410px !important;">
							<a href="preview-1/${p.id}.htm"><img src="images/${p.image}"
								style="height: 197px !important; width: 192px !important;"
								alt="" /></a>
							<h2>${p.name }</h2>
							<p>${p.description }</p>
							<p>
								<span class="strike"> <fmt:formatNumber
										value="${p.price} " pattern="###,###"></fmt:formatNumber>
								</span> <span class="price"> <fmt:formatNumber
										value="${p.price-(p.price*(p.discount/100)) }"
										pattern="###,###"></fmt:formatNumber> VNĐ
								</span>
							</p>
							<div class="nn-desc">${fn:substring(p.mota, 0, 50)}...</div>
							<div>
								<c:choose>
									<c:when test="${userLogin != null}">
										<form:form action="cart/insert.htm" modelAttribute="cartItem">
											<!-- <input type="hidden" name="page" value="index"/> -->
											<form:hidden path="id" />

											<form:input type="hidden" path="quantity" value="1" />
											<form:input type="hidden" path="unitPrice"
												value="${p.price-(p.price*(p.discount/100))}" />
											<form:input type="hidden" path="product.id" value="${p.id}" />
											<form:input type="hidden" path="cart.id" value="${cart.id}" />

											<form:button type="submit" style="color:#f75108e8"
												class="googles-cart pgoogles-cart">
												<i class="fas fa-cart-plus"></i>
											</form:button>
										</form:form>
									</c:when>
									<c:otherwise>
										<a href="login.htm"
											onclick="return confirm('Đăng nhập để mua hàng?')"><button
												class="googles-cart pgoogles-cart">
												<i class="fas fa-cart-plus"></i>
											</button></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</c:forEach>

				</div>

				<div class="content_bottom">
					<div class="heading">
						<h3>Sản phẩm mới</h3>
					</div>
					<div class="sort">
						<p>
							Sort by: <select>
								<option>Lowest Price</option>
								<option>Highest Price</option>
								<option>Lowest Price</option>
								<option>Lowest Price</option>
								<option>Lowest Price</option>
								<option>In Stock</option>
							</select>
						</p>
					</div>
					<div class="show">
						<p>
							Show: <select>
								<option>4</option>
								<option>8</option>
								<option>12</option>
								<option>16</option>
								<option>20</option>
								<option>In Stock</option>
							</select>
						</p>
					</div>

					<div class="clear"></div>
				</div>
				<div class="section group">

					<c:forEach var="p" items="${SPMOI}" begin="0" end="3">


						<div class="grid_1_of_4 images_1_of_41"
							style="height: 410px !important;">
							<a href="preview-1/${p.id}.htm"><img src="images/${p.image}"
								style="height: 197px !important; width: 192px !important;"
								alt="" /></a>
							<h2>${p.name }</h2>
							<p>${p.description }</p>
							<p>
								<span class="strike"> <fmt:formatNumber
										value="${p.price} " pattern="###,###"></fmt:formatNumber>
								</span> <span class="price"> <fmt:formatNumber
										value="${p.price-(p.price*(p.discount/100)) }"
										pattern="###,###"></fmt:formatNumber> VNĐ
								</span>
							</p>
							<div class="nn-desc">${fn:substring(p.mota, 0, 50)}...</div>
							<div>
								<c:choose>
									<c:when test="${userLogin != null}">
										<form:form action="cart/insert.htm" modelAttribute="cartItem">
											<!-- <input type="hidden" name="page" value="index"/> -->
											<form:hidden path="id" />

											<form:input type="hidden" path="quantity" value="1" />
											<form:input type="hidden" path="unitPrice"
												value="${p.price-(p.price*(p.discount/100))}" />
											<form:input type="hidden" path="product.id" value="${p.id}" />
											<form:input type="hidden" path="cart.id" value="${cart.id}" />

											<form:button type="submit" style="color:#f75108e8"
												class="googles-cart pgoogles-cart">
												<i class="fas fa-cart-plus"></i>
											</form:button>
										</form:form>
									</c:when>
									<c:otherwise>
										<a href="login.htm"
											onclick="return confirm('Đăng nhập để mua hàng?')"><button
												class="googles-cart pgoogles-cart">
												<i class="fas fa-cart-plus"></i>
											</button></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>

	</div>

	<div class="footer">
		<jsp:include page="footer/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"><span
		id="toTopHover" style="opacity: 1;"></span></a>
	<!-- dropdown nav -->
	<script>
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop().slideDown(100);
		}, function() {
			$('.dropdown-menu', this).stop().slideUp(100);
		});
	</script>

	<script>
		$(document).ready(function() {
			/*
									var defaults = {
										  containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
									 };
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!--// end-smoth-scrolling -->



</body>

</html>