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

<!-- filter search table -->
<style>
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
	<script src="jss/minicart.min.js"></script>

	<div class="wrap">
		<div>

			<jsp:include page="header/header.jsp"></jsp:include>
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


		<!-- 		header botton -->
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Tất cả sản phẩm</h3>
					</div>
					<div class="sort">
						<p>
							Sắp xếp: <select>
								<option >Lowest Price</option>
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
								href="index/${i+1}/${currentPageKM}.htm"
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
						<div class="grid_1_of_4 images_1_of_4"
							style="height: 400px !important; width: 237px !important;">
							<a href="preview-1/${p.id}.htm"><img src="images/${p.image}"
								style="height: 197px !important; width: 192px !important;"
								alt="" /></a>
							<h2>${p.name}</h2>

							<p>
								<span class="strike"><fmt:formatNumber
										value="${p.price} " pattern="###,###"></fmt:formatNumber></span> <span
									class="price"><fmt:formatNumber
										value="${p.price-(p.price*(p.discount/100))}"
										pattern="###,###"></fmt:formatNumber> VNĐ</span>
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
		<!-- 		sản phẩm mới -->

		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Sản phẩm mới</h3>
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




					<div class="clear"></div>
				</div>
				<div class="section group">


					<c:forEach var="p" items="${SPMOI}" begin="0" end="3">
						<div class="grid_1_of_4 images_1_of_4"
							style="height: 400px !important; width: 237px !important;">
							<a href="preview-1/${p.id}.htm"><img src="images/${p.image}"
								style="height: 197px !important; width: 192px !important;"
								alt="" /></a>
							<h2>${p.name}</h2>

							<p>
								<span class="strike"><fmt:formatNumber
										value="${p.price} " pattern="###,###"></fmt:formatNumber></span> <span
									class="price"><fmt:formatNumber
										value="${p.price-(p.price*(p.discount/100))}"
										pattern="###,###"></fmt:formatNumber> VNĐ</span>
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

		<!-- 		khuyến mãi -->

		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Sản phẩm khuyến mãi</h3>
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
						<c:forEach var="i" begin="0" end="${totalPageKM-1}"
							varStatus="status">



							<a class="btn btn-outline-primary"
								href="index/${currentPage}/${i+1}.htm"
								${status.index + 1 == currentPageKM ? 'style="background-color: #007bff;"':''}>
								<span
								${status.index + 1 == currentPageKM ? 'style="color: white;"':''}>
									${i+1}</span>
							</a>



						</c:forEach>
					</div>
					<div class="clear"></div>
				</div>
				<div class="section group">


					<c:forEach var="p" items="${listProductkm}">

						<div class="grid_1_of_4 images_1_of_4"
							style="height: 400px !important; width: 237px !important;">
							<a href="preview-1/${p.id}.htm"><img src="images/${p.image}"
								style="height: 197px !important; width: 192px !important;"
								alt="" /></a>
							<h2>${p.name}</h2>

							<p>
								<span class="strike"><fmt:formatNumber
										value="${p.price} " pattern="###,###"></fmt:formatNumber></span> <span
									class="price"><fmt:formatNumber
										value="${p.price-(p.price*(p.discount/100)) }"
										pattern="###,###"></fmt:formatNumber> VNĐ</span>
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







		<!-- khuyen mai -->
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
	<script type="text/javascript">
		function showMessage() {
			if (confirm('Bạn cần đăng nhập để mua hàng?')) {
				$("<a href='signin.html'></a>").click();
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

