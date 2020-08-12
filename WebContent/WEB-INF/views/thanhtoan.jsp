<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng /Thanh toán</title>
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
						class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
						<li><a href="checkout.htm"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>Giỏ hàng</a></li>
				<li class="active">Thanh toán</li>
			
			</ol>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- checkout -->

	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container">
			<div class="col-md-6 checkout-left-basket">
				<h4>Thông tin người nhận</h4>
				<ul>
					<li>${cart.name}</li>
					<li>${cart.phone}</li>
					<li>${cart.email}</li>
					<li>${cart.address}</li>
				</ul>
			</div>
			<div class="col-md-6 checkout-left-basket">
				<h4>Chi tiết giỏ hàng</h4>
				<ul>

					<c:forEach var="i" varStatus="status" items="${listCartItem}">
						<li>${i.product.name}<i></i> <span><fmt:formatNumber
									value=" ${i.unitPrice * i.quantity}" type="number"
									pattern="###,###" /> đ</span>
						</li>
					</c:forEach>
					<li>Phí vận chuyển (GHN):<i></i> <span><fmt:formatNumber
								value=" ${totalPrice * 0.1}" type="number" pattern="###,###" />
							đ</span>
					</li>
					<li>Tổng tiền :<i></i> <span><fmt:formatNumber
								value="${totalPrice + totalPrice*0.1}" type="number"
								pattern="###,###" /> VNĐ</span>
					</li>
				</ul>
			</div>
		</div>

		<div class="inner-sec-shop px-lg-5 px-3">

			<!--/tabs-->
			<h3 class="tittle-w3layouts my-lg-5 mt-3" style="text-align: center;color:blue;">Phương
				thức thanh toán</h3>

			<div class="responsive_tabs">
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li>Nhận hàng trả tiền (COD)</li>
						<li>(VISA/ MASTER CARD)</li>
						<li>(Internet Banking)</li>
						<li>Paypal</li>
					</ul>
					<div class="resp-tabs-container">
						<!--/tab_one-->
						<div class="tab1">
							<div class="pay_info">
								<form:form action="thanhtoan.htm" method="post"
									modelAttribute="cart">
									<form:hidden path="id" />
									<form:hidden path="user.id" />
									<form:hidden path="buyDate" />
									<form:hidden path="name" />
									<form:hidden path="phone" />
									<form:hidden path="email" />
									<form:hidden path="address" />
									<form:hidden path="note" />
									<form:hidden path="payment" value="COD" />
									<form:hidden path="status" value="0" />
									<div class="vertical_post check_box_agile">
										<h5 style="color: blue; text-align: center;">Thanh toán sau khi nhận và kiểm tra hàng.</h5>
										<!-- <div class="checkbox">
												<div class="check_box_one cashon_delivery">
													<label class="anim"> <input type="checkbox"
														class="checkbox"> <span> We also accept
															Credit/Debit card on delivery. Please Check with the
															agent.</span>
													</label>
												</div>

											</div> -->
									</div>
									<div class="text-center" >
										<form:button type="submit" class="btn btn-lg">
										THANH TOÁN
								</form:button>
									</div>
								</form:form>
							</div>

						</div>
						<!--//tab_one-->
						<div class="tab2">
							<div class="pay_info">
								<form:form action="thanhtoan.htm" method="post"
									modelAttribute="cart">
									<form:hidden path="id" />
									<form:hidden path="user.id" />
									<form:hidden path="buyDate" />
									<form:hidden path="name" />
									<form:hidden path="phone" />
									<form:hidden path="email" />
									<form:hidden path="address" />
									<form:hidden path="note" />
									<form:hidden path="payment" value="VISA" />
									<form:hidden path="status" value="0" />
									<section class="creditly-wrapper wthree, w3_agileits_wrapper">
										<div class="credit-card-wrapper">
											<div class="first-row form-group">
												<div class="controls">
													<label class="control-label">Tên trên thẻ</label> <input
														class="billing-address-name form-control" type="text"
														name="name" placeholder="John Smith">
												</div>
												<div class="w3_agileits_card_number_grids">
													<div class="w3_agileits_card_number_grid_left">
														<div class="controls">
															<label class="control-label">Số thẻ</label> <input
																class="number credit-card-number form-control"
																type="text" name="number" inputmode="numeric"
																autocomplete="cc-number" autocompletetype="cc-number"
																x-autocompletetype="cc-number"
																placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
														</div>
													</div>
													<div class="w3_agileits_card_number_grid_right">
														<div class="controls">
															<label class="control-label">Mã CVV</label> <input
																class="security-code form-control" ÃÂ·
																inputmode="numeric" type="text" name="security-code"
																placeholder="&#149;&#149;&#149;">
														</div>
													</div>
													<div class="clear"></div>
												</div>
												<div class="controls">
													<label class="control-label">Ngày hết hạn</label> <input
														class="expiration-month-and-year form-control" type="text"
														name="expiration-month-and-year" placeholder="MM / YY">
												</div>
											</div>
										</div>
									</section>
									<div class="text-center">
										<form:button type="submit" class="btn btn-lg">
										Thanh toán ngay
								</form:button>
									</div>
								</form:form>

							</div>
						</div>
						<div class="tab3">

							<div class="pay_info">
								<div class="vertical_post">
									<form:form action="thanhtoan.htm" method="post"
										modelAttribute="cart">
										<form:hidden path="id" />
										<form:hidden path="user.id" />
										<form:hidden path="buyDate" />
										<form:hidden path="name" />
										<form:hidden path="phone" />
										<form:hidden path="email" />
										<form:hidden path="address" />
										<form:hidden path="note" />
										<form:hidden path="payment" value="ATM" />
										<form:hidden path="status" value="0" />
										<h5>Chọn ngân hàng:</h5>
										<div class="swit-radio">
											<div class="check_box_one">
												<div class="radio_one">
													<label> <input type="radio" name="radio" checked="">
														<i></i>Techcombank - Ngân hàng TMCP Kỹ Thương Việt Nam
													</label>
												</div>
											</div>
											<div class="check_box_one">
												<div class="radio_one">
													<label> <input type="radio" name="radio"> <i></i>MB
														- Ngân hàng TMCP Quân Đội
													</label>
												</div>
											</div>
											<div class="check_box_one">
												<div class="radio_one">
													<label> <input type="radio" name="radio"> <i></i>Vietinbank
														– Ngân Hàng TMCP Công Thương Việt Nam
													</label>
												</div>
											</div>
											<div class="check_box_one">
												<div class="radio_one">
													<label> <input type="radio" name="radio"> <i></i>Vietcombank
														– Ngân Hàng TMCP Ngoại Thương Việt Nam
													</label>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									
										<!-- <input type="submit" value="PAY NOW"> -->
										<div class="text-center">
											<form:button type="submit" class="btn btn-lg">
										Thanh toán ngay
								</form:button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
						<div class="tab4">
							<div class="pay_info row">
								<div class="col-md-6 tab-grid">
									<img class="pp-img" src="images/paypal.png"
										alt="Image Alternative text" title="Image Title">
									<p>Important: You will be redirected to PayPal's website to
										securely complete your payment.</p>
									<a class="btn btn-primary">Thanh toán với Paypal</a>
								</div>
								<div class="col-md-6">
									<form:form action="thanhtoan.htm" method="post"
										modelAttribute="cart">
										<form:hidden path="id" />
										<form:hidden path="user.id" />
										<form:hidden path="buyDate" />
										<form:hidden path="name" />
										<form:hidden path="phone" />
										<form:hidden path="email" />
										<form:hidden path="address" />
										<form:hidden path="note" />
										<form:hidden path="payment" value="PAYPAL" />
										<form:hidden path="status" value="0" />
										<div class="clearfix">
											<div class="form-group form-group-cc-number">
												<label>Số thẻ</label> <input class="form-control"
													placeholder="xxxx xxxx xxxx xxxx" type="text"> <span
													class="cc-card-icon"></span>
											</div>
											<div class="form-group form-group-cc-cvc">
												<label>Mã CVV</label> <input class="form-control"
													placeholder="xxxx" type="text">
											</div>
										</div>
										<div class="clearfix">
											<div class="form-group form-group-cc-name">
												<label>Tên trên thẻ</label> <input class="form-control"
													type="text">
											</div>
											<div class="form-group form-group-cc-date">
												<label>Ngày hết hạn</label> <input class="form-control"
													placeholder="mm/yy" type="text">
											</div>
										</div>
										<!-- <div class="checkbox checkbox-small mt-4">
												<label> <input class="i-check" type="checkbox"
													checked="">Add to My Cards
												</label>
											</div> -->
										<!-- <input class="btn btn-primary submit mt-4" type="submit"
													value="Proceed Payment"> -->
										<div class="text-center">
											<form:button type="submit" class="btn btn-lg">
										Thanh toán ngay
								</form:button>
										</div>

									</form:form>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!--//tabs-->
		</div>


		<!-- //payment -->
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