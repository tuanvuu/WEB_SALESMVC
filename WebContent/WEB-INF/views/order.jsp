<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Đơn hàng</title>
<!-- for-mobile-apps -->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 






















</script>
<!-- //for-mobile-apps -->
<link href="cssc/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />

<link href="cssc/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="cssc/font-awesome.css" rel="stylesheet">

<!-- //font-awesome icons -->

<!-- js -->
<script src="jsc/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- css thanh toán -->
<link href="csslogin/discount-tag.css" rel='stylesheet' type='text/css' />
<link href="csslogin/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="csslogin/login_overlay.css" rel='stylesheet' type='text/css' />
<link href="csslogin/style6.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="csslogin/shop.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="csslogin/checkout.css">
<link href="csslogin/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<!-- css thanh toán -->
<link
	href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="jsc/move-top.js"></script>
<script type="text/javascript" src="jsc/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->



</head>

<body>
	<!-- header -->


	<div class="logo_products">
		<div class="container">
			<jsp:include page="header/header.jsp"></jsp:include>

			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header -->
	<!-- navigation -->

	<!-- //navigation -->
	<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="index/1/1.htm"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>Trang
						chủ</a></li>
				<li class="active">Đơn hàng</li>
			</ol>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!--// header_top -->
	<!--checkout-->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="responsive_tabs" style="margin: 30px;">
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<!-- <li>Tất cả</li> -->
					<li>Chờ xác nhận</li>
					<li>Đang giao</li>
					<li>Đã giao</li>
					<li>Đã huỷ</li>
				</ul>
				<div class="resp-tabs-container">
					<!--/tab_one-->
			
					<!--//tab_one-->
					<div class="tab2">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 0}">
									<div class="wrapper_top_shop" style="width: 107%">

										<h4 style="color: aqua;">Chờ xác nhận</h4>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="preview-1/${ci.product.id}.htm"><img
													src="images/${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="preview-1/${ci.product.id}.htm">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>

													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value=" ${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Phí vận chuyển : (GHN) 10% <span><fmt:formatNumber
																value=" ${total * 0.1}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value=" ${total + total*0.1}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">
											<%-- <a href="order/huy/${o.id}.htm"
												class="btn btn-sm animated-button victoria-three">Huỷ
												đơn hàng</a> --%>
											<a class="btn btn-sm animated-button victoria-three"
												href="order/huy/${o.id}.htm"
												onclick="return confirm('Bạn có chắc chắn là hủy đơn hàng này?')">Hủy
												đơn hàng </a>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>

					<!-- tab dang giao -->
					<div class="tab3">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 1}">
									<div class="wrapper_top_shop" style="width: 107%">

										<h4>Đang giao...</h4>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="preview-1/${ci.product.id}.htm1"><img
													src="images/${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="preview-1/${ci.product.id}.htm">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value=" ${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Phí vận chuyển : (GHN) 10% <span><fmt:formatNumber
																value=" ${total * 0.1}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value=" ${total + total*0.1}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">
											<%-- <a href="order/nhan/${o.id}.htm" data-toggle="modal"
												class="btn btn-sm animated-button victoria-three">Đã
												nhận hàng</a> --%>
											<a class="btn btn-sm animated-button victoria-three"
												href="order/nhan/${o.id}.htm"
												onclick="return confirm('Xác nhận nhận đơn hàng thành công !')">Đã nhận hàng </a>


										</div>




									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>

					<!-- tab da giao hang -->
					<div class="tab4">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 2}">
									<div class="wrapper_top_shop" style="width: 107%">

										<h4 style="color: #FF4E00;">Đã giao</h4>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="preview-1/${ci.product.id}.htm"><img
													src="images/${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="preview-1/${ci.product.id}.htm">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value=" ${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Phí vận chuyển : (GHN) 10% <span><fmt:formatNumber
																value=" ${total * 0.1}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value=" ${total + total*0.1}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- tab da huy don hang -->
					<div class="tab5">
						<div class="container" style="margin: unset; padding: unset;">
							<c:forEach var="o" items="${orders}">
								<c:if test="${o.status == 3}">
									<div class="wrapper_top_shop" style="width: 107%">

										<h4 style="color: red;">Đã huỷ</h4>

										<!-- <div> -->
										<c:set var="total" value="${0}"></c:set>
										<c:forEach var="ci" items="${o.cartItems}">
											<c:set var="total"
												value="${total + ci.unitPrice * ci.quantity}"></c:set>

											<span> <a href="preview-1/${ci.product.id}.htm"><img
													src="images/${ci.product.image}" class="cart-thumb image"
													alt="${ci.product.name}" /></a> <a
												href="preview-1/${ci.product.id}.htm">${ci.product.name}</a>
											</span>
											<span style="float: right;"> ${ci.quantity} <i> x
											</i> <fmt:formatNumber value=" ${ci.unitPrice}" type="number"
													pattern="###,###" /> đ
											</span>

											<hr>
										</c:forEach>
										<!-- </div> -->

										<div class="checkout-left row">
											<div class="col-md-7 checkout-left-basket">
												<h4>Thông tin đơn hàng</h4>

												<ul>
													<li>Ngày đặt: <span>${o.buyDate}</span></li>
													<li>Tên người nhận: <span>${o.name}</span></li>
													<li>Số điện thoại: <span>${o.phone}</span></li>
													<%-- <li>Email: <span>${o.email}</span></li> --%>
													<li>Địa chỉ: <span>${o.address}</span></li>
												</ul>
											</div>

											<div class="col-md-5 checkout-left-basket">
												<h4>Thông tin thanh toán</h4>

												<ul>
													<li>Tổng tiền hàng: <span><fmt:formatNumber
																value=" ${total}" type="number" pattern="###,###" /> đ</span></li>
													<li>Phí vận chuyển : (GHN) 10% <span><fmt:formatNumber
																value=" ${total * 0.1}" type="number" pattern="###,###" />
															đ</span></li>
													<li>Tổng tiền phải trả: <span
														style="font-size: large; color: #FF4E00;"><fmt:formatNumber
																value=" ${total + total*0.1}" type="number"
																pattern="###,###" /> đ</span></li>
													<li>Phương thức thanh toán: <span>${o.payment}</span></li>

												</ul>
											</div>
										</div>

										<div class="text-right">


											<a class="btn btn-sm animated-button victoria-three"
												href="order/xacnhan/${o.id}.htm"
												onclick="return confirm('Bạn có chắc chắn mua lại đơn hàng này?')">Mua
												lại </a>
										</div>

									</div>
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>
	<!-- //checkout -->
	<!-- //footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Contact</h3>

					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker"
							aria-hidden="true"></i>1234k Avenue, 4th block, <span>New
								York City.</span></li>
						<li><i class="glyphicon glyphicon-envelope"
							aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone"
							aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Information</h3>
					<ul class="info">
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="about.html">About Us</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="contact.html">Contact Us</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="short-codes.html">Short Codes</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="faq.html">FAQ's</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="products.html">Special Products</a></li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Category</h3>
					<ul class="info">
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="groceries.html">Groceries</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="household.html">Household</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="personalcare.html">Personal Care</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="packagedfoods.html">Packaged Foods</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="beverages.html">Beverages</a></li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Profile</h3>
					<ul class="info">
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="products.html">Store</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="checkout.html">My Cart</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="login.html">Login</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a
							href="registered.html">Create Account</a></li>
					</ul>


				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<div class="footer-copy">

			<div class="container">
				<p>
					Â© 2017 Super Market. All rights reserved | Design by <a
						href="http://w3layouts.com/">W3layouts</a>
				</p>
			</div>
		</div>

	</div>
	<div class="footer-botm">
		<div class="container">
			<div class="w3layouts-foot">
				<ul>
					<li><a href="#" class="w3_agile_facebook"><i
							class="fa fa-facebook" aria-hidden="true"></i></a></li>
					<li><a href="#" class="agile_twitter"><i
							class="fa fa-twitter" aria-hidden="true"></i></a></li>
					<li><a href="#" class="w3_agile_dribble"><i
							class="fa fa-dribbble" aria-hidden="true"></i></a></li>
					<li><a href="#" class="w3_agile_vimeo"><i
							class="fa fa-vimeo" aria-hidden="true"></i></a></li>
				</ul>
			</div>
			<div class="payment-w3ls">
				<img src="images/card.png" alt=" " class="img-responsive">
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //footer -->
	<!-- Bootstrap Core JavaScript -->
	<!--jQuery-->
	<script src="jslogin/jquery-2.2.3.min.js"></script>
	<!-- newsletter modal -->
	<!--search jQuery-->
	<script src="jslogin/modernizr-2.6.2.min.js"></script>
	<script src="jslogin/classie-search.js"></script>
	<script src="jslogin/demo1-search.js"></script>
	<!--//search jQuery-->
	<!-- cart-js -->
	<script src="jslogin/minicart.js"></script>
	<script>
		googles.render();

		googles.cart.on('googles_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
				}
			}
		});
	</script>
	<!-- //cart-js -->
	<script>
		$(document).ready(function() {
			$(".button-log a").click(function() {
				$(".overlay-login").fadeToggle(200);
				$(this).toggleClass('btn-open').toggleClass('btn-close');
			});
		});
		$('.overlay-close1').on(
				'click',
				function() {
					$(".overlay-login").fadeToggle(200);
					$(".button-log a").toggleClass('btn-open').toggleClass(
							'btn-close');
					open = false;
				});
	</script>
	<!-- carousel -->
	<!-- easy-responsive-tabs -->
	<script src="jslogin/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>

	<!-- credit-card -->
	<script type="text/javascript" src="jslogin/creditly.js"></script>
	<link rel="stylesheet" href="csslogin/creditly.css" type="text/css"
		media="all" />

	<script type="text/javascript">
		$(function() {
			var creditly = Creditly.initialize(
					'.creditly-wrapper .expiration-month-and-year',
					'.creditly-wrapper .credit-card-number',
					'.creditly-wrapper .security-code',
					'.creditly-wrapper .card-type');

			$(".creditly-card-form .submit").click(function(e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
					// Your validated credit card output
					console.log(output);
				}
			});
		});
	</script>
	<!-- //credit-card -->
	<!-- dropdown nav -->
	<script>
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop().slideDown(100);
		}, function() {
			$('.dropdown-menu', this).stop().slideUp(100);
		});
	</script>
	<!-- //dropdown nav -->
	<script src="jslogin/move-top.js"></script>
	<script src="jslogin/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
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

</body>
</html>