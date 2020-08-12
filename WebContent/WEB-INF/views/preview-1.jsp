<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Thông tin sản phẩm</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Doppio+One'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Monda' rel='stylesheet'
	type='text/css'>
<script src="js/script.js" type="text/javascript"></script>

<link href="csslogin/all.css" rel="stylesheet">
<!-- ccss slide -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 12px;
	background-repeat: no-repeat;
	width: 86%;
	font-size: 15px;
	padding: 10px 1px 20px 10px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myUL {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myUL li a {
	
}
#myUL






























 






























li






























 






























a




























































:hover




























































:not






























 






























(
.header






























 






























)
{
background-color




























































:






























 






























#eee




























































;
}
</style>

</head>
<body>
	<div class="wrap">
		<div>
			<jsp:include page="header/header.jsp"></jsp:include>
		</div>
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="back-links">
						<p>
							<a href="index/1/1.htm">Trang chủ</a> >> <a href="#">Thông
								tin</a>
						</p>
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

					<div class="cont-desc span_1_of_2">
						<div class="grid images_3_of_2">
							<img src="images/${chitiet.image}"
								style="width: 250px !important; height: 300px !important;"
								alt="" />
						</div>
						<div class="desc span_3_of_2">
							<h2>${chitiet.name }</h2>
							<p>${chitiet.mota}</p>
							<div class="price">
								<p>
									Giá: <span><fmt:formatNumber
											value="${chitiet.price - (chitiet.price * (chitiet.discount/100) ) }"
											pattern="###,###"></fmt:formatNumber> VNĐ</span>
								</p>
							</div>
							<div class="available">
								<p>Available Options :</p>
								<ul>
									<li>Color: <select>
											<option>Silver</option>
											<option>Black</option>
											<option>Dark Black</option>
											<option>Red</option>
									</select></li>
									<li>Size:<select>
											<option>Large</option>
											<option>Medium</option>
											<option>small</option>
											<option>Large</option>
											<option>small</option>
									</select></li>
									<li>Quality:<select>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
									</select></li>
								</ul>
							</div>
							<div class="share">
								<p>Chia sẻ sản phẩm :</p>
								<ul>
									<li><a href="#"><img src="images/youtube.png" alt=""></a></li>
									<li><a href="#"><img src="images/facebook.png" alt=""></a></li>
									<li><a href="#"><img src="images/twitter.png" alt=""></a></li>
									<li><a href="#"><img src="images/linkedin.png" alt=""></a></li>
								</ul>
							</div>
							<div class="add-cart">
								<div class="rating">
									<p>
										Đánh giá:<img src="images/rating.png"><span></span>
									</p>
								</div>
								<div class="button">
									<c:choose>
										<c:when test="${userLogin != null}">
											<form:form action="cart/insert.htm" modelAttribute="cartItem">
												<form:input type="hidden" path="id" />

												<form:input type="hidden" path="quantity" value="1" />
												<form:input type="hidden" path="unitPrice"
													value="${chitiet.price-(chitiet.price*(chitiet.discount/100))}" />
												<form:input type="hidden" path="product.id"
													value="${chitiet.id}" />
												<form:input type="hidden" path="cart.id" value="${cart.id}" />

												<%-- 						<form:button type="submit" style="color:#f75108e8">Thêm vào giỏ
													
													</form:button> --%>
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
								<div class="clear"></div>
							</div>
						</div>
						<div class="product-desc">
							<h2>Thông tin chi tiết</h2>
							<p>${chitiet.chitiet}</p>
						</div>

						<%-- <div class="product-tags">
							<div class="header_bottom_right_images">
								<!-- FlexSlider -->
								<section class="slider">
									<c:forEach var="s" items="${chitiet.category.products}">
										<div class="flexslider">
											<ul class="slides">


												<li><img src="images/${s.image}" alt="" /></li>


											</ul>
										</div>
									</c:forEach>
								</section>
								<!-- FlexSlider -->
							</div>
						</div> --%>

					</div>
					<div class="rightsidebar span_3_of_1">

						<div class="product-tag">
							<div class="dropdown">
								<input type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Tìm kiếm sản phẩm khác" title="Type in a name">



								<ul class="dropdown-menu" id="myUL">
									<c:forEach var="p" items="${listDetail}">
										<li><a href="preview-1/${p.id}.htm">${p.name}</a></li>

									</c:forEach>

								</ul>
							</div>
							<%-- 		<h2>My Phonebook</h2>

							<input type="text" id="myInput" onkeyup="myFunction()"
								placeholder="Tìm kiếm sản phẩm khác" title="Type in a name">

							<ul id="myUL">

								<c:forEach var="p" items="${listDetail}">
									<li><a href="preview-1/${p.id}.htm">${p.name}</a></li>

								</c:forEach>
							</ul> --%>

						</div>


						<div class="community-poll">
							<h2>Cộng đồng</h2>
							<p>Lý do chính để bạn mua sản phẩm trực tuyến là gì?</p>
							<div class="poll">
								<form>
									<ul>
										<li><input type="radio" name="vote" class="radio"
											value="1"> <span class="label"><label>Vận
													chuyển thuận tiện và giao hàng nhanh </label></span></li>
										<li><input type="radio" name="vote" class="radio"
											value="2"> <span class="label"><label
												for="vote_2">Chi phí thấp</label></span></li>
										<li><input type="radio" name="vote" class="radio"
											value="3"> <span class="label"><label
												for="vote_3">Lựa chọn lớn hơn</label></span></li>
										<li><input type="radio" name="vote" class="radio"
											value="5"> <span class="label"><label
												for="vote_5">Bảo đảm thanh toán </label></span></li>
										<li><input type="radio" name="vote" class="radio"
											value="6"> <span class="label"><label
												for="vote_6">Hoàn trả sản phẩm trong 7 ngày </label></span></li>
										<li><input type="radio" name="vote" class="radio"
											value="7"> <span class="label"><label
												for="vote_7">Khác.</label></span></li>
									</ul>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 	slide sp khac -->


			</div>
		</div>
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="heading">
						<h3>Sản phẩm cùng loại</h3>
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


					<c:if test="${listProduct.size() != 0}">
						<div class="page-no">
							<%-- <c:forEach var="i" begin="0" end="${totalPage-1}"
								varStatus="status">

								<c:if test="${status.index == 0 && currentPage > 1}">
									<a href="preview-1/${chitiet.id}/${currentPage-1}.htm"
										class="btn btn-outline-primary">&laquo</a>
								</c:if>

								<a class="btn btn-outline-primary"
									href="preview-1/${chitiet.id}/${i+1}.htm"
									${status.index + 1 == currentPage ? 'style="background-color: #007bff;"':''}>
									<span
									${status.index + 1 == currentPage ? 'style="color: white;"':''}>
										${i+1}</span>
								</a>



								<c:if
									test="${status.index == totalPage-1 && currentPage <= totalPage-1}">
									<a href="preview-1/${chitiet.id}/${currentPage+1}/.htm"
										class="btn btn-outline-primary">&raquo;</a>
								</c:if>

							</c:forEach> --%>


						</div>
					</c:if>
					<br>
					<c:if test="${listProduct.size() == 0}">
						<div class="text-center">
							<h3>Hiện chưa có sản phẩm nào phù hợp !</h3>
						</div>

					</c:if>
					<div class="clear"></div>
				</div>
				<div class="section group">


					<c:forEach var="p" items="${chitiet.category.products}">
						<c:if test="${p.discount > 0}">
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
						</c:if>
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
		id="toTopHover" style="opacity: 1;"></span></a> dropdown nav
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
	// end-smoth-scrolling
	<script src="jslogin/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider1').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>

	<!-- 	filter list sp -->
	<script>
		function myFunction() {
			var input, filter, ul, li, a, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("myUL");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				txtValue = a.textContent || a.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		}
	</script>

	<script src="jslogin/jquery-ui.js"></script>
	<script>
		//<![CDATA[ 
		$(window).load(
				function() {
					$("#slider-range").slider(
							{
								range : true,
								min : 0,
								max : 9000,
								values : [ 50, 6000 ],
								slide : function(event, ui) {
									$("#amount").val(
											"$" + ui.values[0] + " - $"
													+ ui.values[1]);
								}
							});
					$("#amount").val(
							"$" + $("#slider-range").slider("values", 0)
									+ " - $"
									+ $("#slider-range").slider("values", 1));

				}); //]]>
	</script>
	//price range (top products) //price r (top products)

	<script src="jslogin/owl.carousel.js"></script>
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

	//end-smooth-scrolling
</body>
</html>

