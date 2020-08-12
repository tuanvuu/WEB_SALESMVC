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
				<li><a href="index.htm"><span
						class="glyphicon glyphicon-home"></span>Home</a></li>
				<li class="active">giỏ hàng</li>
			</ol>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- checkout -->
	<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
		<div class="container">
			<c:choose>
				<c:when test="${totalItem == 0 }">
					<div class="text-center">
						<h3 class="tittle-w3layouts my-lg-4 mt-3 text-center">Giỏ
							hàng trống!</h3>
						<br> <a href="index/1/1.htm"
							class="btn btn-sm animated-button victoria-three">Quay lại
							cửa hàng</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="inner-sec-shop px-lg-4 px-3">
						<h3 class="tittle-w3layouts my-lg-4 mt-3">Giỏ hàng</h3>
						<div class="checkout-right">

							<table class="timetable_sub">
								<thead>
									<tr>
										<th>STT</th>
										<th>Hình ảnh</th>
										<th>Số lượng</th>
										<th>Tên sản phẩm</th>
										<th>Đơn giá</th>
										<th>Xoá</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="i" varStatus="status" items="${listCartItem}">
										<tr class="rem1">
											<td class="invert">${status.index + 1}</td>
											<td class="invert-image">

												<div class="image-icon">
													<a href="preview-1/${i.product.id}.htm"> <img
														src="images/${i.product.image}" alt="${i.product.name}"
														class="pro-thumb image"></a>
													<c:if
														test="${i.product.discount > 0 && i.product.discount <= 1}">
														<span class="fa-stack fa-lg icon"> <i
															class="fa fa-tag fa-stack-2x"></i> <i
															class="fa fa-stack-1x fa-inverse">&nbsp;-<fmt:formatNumber
																	value="${i.product.discount}" type="percent" /></i>
														</span>
													</c:if>

												</div>
											</td>
											<td class="invert"><span> <a class="btn"
													href="checkout/giam/${i.product.id}.htm"><i
														class="fas fa-minus"></i></a> <span style="margin: 10px;">${i.quantity}</span>
													<a class="btn" href="checkout/cong/${i.product.id}.htm"><i
														class="fas fa-plus"></i></a>
											</span></td>
											<td class="invert">${i.product.name}</td>

											<td class="invert"><c:choose>

													<c:when
														test="${i.product.discount > 0 && i.product.discount <= 1}">

														<p style="text-decoration: line-through">
															<fmt:formatNumber value="${i.product.price}"
																type="number" pattern="###,###" />
															đ
														</p>
														<span class="money "><fmt:formatNumber
																value=" ${i.unitPrice}" type="number" pattern="###,###" />
															đ</span>

													</c:when>
													<c:otherwise>
														<span class="money "><fmt:formatNumber
																value=" ${i.unitPrice}" type="number" pattern="###,###" />
															đ</span>
													</c:otherwise>
												</c:choose></td>
											<td class="invert"><a id="delete-item"
												href="cart/delete/${i.id}.htm" role="button" class="btn"><i
													class="fas fa-trash-alt"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="checkout-left row">
							<div class="col-md-6 checkout-left-basket">
								<h4>Chi tiết giỏ hàng</h4>

								<ul>
									<c:forEach var="i" varStatus="status" items="${listCartItem}">
										<li>${i.quantity}<i> x </i> ${i.product.name} <span><fmt:formatNumber
													value=" ${i.unitPrice * i.quantity}" type="number"
													pattern="###,###" /> đ</span>
										</li>
									</c:forEach>
									<li>Phí vẫn chuyển (Giao hàng nhanh) : <span><fmt:formatNumber
												value=" ${totalPrice * 0.1}" type="number" pattern="###,###" />
											đ</span>
									</li>
									<li>Tổng tiền : <span><fmt:formatNumber
												value="${totalPrice + totalPrice*0.1}" type="number"
												pattern="###,###" /> VNĐ</span>
									</li>
								</ul>
							</div>
							<div class="col-md-6 address_form">
								<h4 style="color: blue; text-align: center;">Thông tin đơn
									hàng</h4>
								<form:form action="checkout.htm" method="post"
									modelAttribute="cart" class="creditly-card-form agileinfo_form">
									<section class="creditly-wrapper wrapper">
										<div class="information-wrapper">
											<div class="first-row form-group">
												<div class="controls">
													<form:hidden path="status" value="1" />
													<form:hidden path="id" />
													<form:hidden path="user.id" />
													<label class="control-label">Họ tên: </label>
													<form:input class="billing-address-name form-control"
														type="text" path="name" placeholder="Họ tên"
														required="required" oninput="this.setCustomValidity('')" />
												</div>
												<div class="card_number_grids">
													<div class="card_number_grid_left">
														<div class="controls">
															<label class="control-label">Số điện thoại: </label>
															<form:errors path="phone" />
															<form:input class="form-control" type="text" path="phone"
																placeholder="Số điện thoại" required="required"
																oninvalid="this.setCustomValidity('Vui lòng nhập số điện thoại')"
																pattern="(03|05|07|08|09)+([0-9]{8})\b"
																title="Số điện thoại sai định dạng!"
																oninput="this.setCustomValidity('')" />
														</div>
													</div>
													<div class="card_number_grid_right">
														<div class="controls">
															<label class="control-label">Email: </label>
															<form:input path="email" class="form-control"
																type="email" placeholder="Email" required="required"
																pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
																title="Email sai định dạng!"
																oninput="this.setCustomValidity('')" />
														</div>
													</div>
													<div class="clear"></div>
												</div>
												<div class="controls">
													<label class="control-label">Địa chỉ: </label>
													<form:input path="address" class="form-control" type="text"
														placeholder="Địa chỉ" required="required"
														
														oninput="this.setCustomValidity('')" />
												</div>
												<div class="controls">
													<label class="control-label">Ghi chú: </label>
													<form:input path="note" class="form-control" type="text" required ="required"
														placeholder="Ghi chú" />

												</div>

											</div>
											<form:button type="submit" class="submit check_out"
												style="background-color: #2272c7;">Đặt hàng</form:button>
										</div>
									</section>
								</form:form>

							</div>

							<div class="clearfix"></div>

						</div>

					</div>
				</c:otherwise>
			</c:choose>


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
	<script src="js/bootstrap.min.js"></script>
	<!-- top-header and slider -->
	<!-- here stars scrolling icon -->
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
	<!-- //here ends scrolling icon -->
	<script src="js/minicart.min.js"></script>
	<script>
		// Mini Cart
		paypal.minicart.render({
			action : '#'
		});

		if (~window.location.search.indexOf('reset=true')) {
			paypal.minicart.reset();
		}
	</script>
	<!-- main slider-banner -->
	<script src="js/skdslider.min.js"></script>
	<link href="css/skdslider.css" rel="stylesheet">
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery('#demo1').skdslider({
				'delay' : 5000,
				'animationSpeed' : 2000,
				'showNextPrev' : true,
				'showPlayButton' : true,
				'autoSlide' : true,
				'animationType' : 'fading'
			});

			jQuery('#responsive').change(function() {
				$('#responsive_wrapper').width(jQuery(this).val());
			});

		});
	</script>
	<!-- //main slider-banner -->
	<script type="text/javascript">
		function showMessage() {
			if (confirm('Bạn cần đăng nhập để mua hàng?')) {
				$("<a href='login.htm'></a>").click();
				//window.location.href = "signin.html";
			}
		}
	</script>





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
	<!-- Count-down -->


	<script>
		var d = new Date();
		simplyCountdown('simply-countdown-custom', {
			year : d.getFullYear(),
			month : d.getMonth() + 2,
			day : 25
		});
	</script>
	<!--// Count-down -->

	<script>
		$(document).ready(function() {
			$('.owl-carousel').owlCarousel({
				loop : true,
				margin : 10,
				responsiveClass : true,
				responsive : {
					0 : {
						items : 1,
						nav : true
					},
					600 : {
						items : 2,
						nav : false
					},
					900 : {
						items : 3,
						nav : false
					},
					1000 : {
						items : 4,
						nav : true,
						loop : false,
						margin : 20
					}
				}
			})
		})
	</script>

	<!-- //end-smooth-scrolling -->


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

	<!-- js file -->

</body>
</html>