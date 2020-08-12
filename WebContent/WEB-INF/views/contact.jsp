<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>

<title>Free Smart Store Website Template | Contact :: w3layouts</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Doppio+One'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Monda' rel='stylesheet'
	type='text/css'>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
	<div class="wrap">
		<div>
			<jsp:include page="header/header.jsp"></jsp:include>
		</div>
		<div class="main">
			<div class="content">
				<div class="support">
					<div class="support_desc">
						<h3>Hỗ trợ trực tuyến</h3>
						<p>
							<span>24 giờ | 7 ngày trong tuần | &nbsp;&nbsp; Hỗ trợ kĩ
								thuật tài đây</span>
						</p>

					</div>
					<img src="images/contact.png" alt="" />
					<div class="clear"></div>
				</div>
				<div class="section group">
					<div class="col span_2_of_3">
						<div class="contact-form">
							<h2>Liên hệ chúng tôi</h2>

							<%-- 	<form action="contact.htm" method="post">

								<div>
									<span><label>Tên</label></span> <span><input type="text"
										name="from" value=""></span>
								</div>
								<div>
									<span><label>E-MAIL</label></span> <span><input
										name="to" type="text" value=""></span>
								</div>
								<div>
									<span><label>Số điện thoại</label></span> <span><input
										name="subject" type="text" value=""></span>
								</div>
								<div>
									<span><label>Nội dung</label></span> <span><textarea
											name="body" rows="3" cols="30"> </textarea></span>
								</div>
								<div>
									<span><input type="submit" value="SUBMIT"></span>
								</div>
							</form> --%>
							<div style="color: red;">${message}</div>

							<s:form method="post" modelAttribute="sendmail"
								action="contact/send.htm">
								<div>
									<span><label>Name</label></span> <span><s:input
											type="text" path="name" /></span>
								</div>

								<div>
									<span><label>Phone</label></span> <span><s:input
											type="text" path="phone" /></span>
								</div>

								<div>
									<span><label>Email</label></span> <span><s:input
											type="text" path="email" /></span>
								</div>
								<div>
									<span><label>Đia chỉ</label></span> <span><s:input
											type="text" path="address" /></span>
								</div>


								<div>
									<span><label>Tieu de</label></span> <span><s:input
											type="text" path="subject" /></span>
								</div>
								<div>
									<span><label>Noi dung</label></span> <span><s:textarea
											type="text" path="content" rows="3" cols="30" /></span>
								</div>
								<div>
									<span><input type="submit" value="SUBMIT"></span>
								</div>


							</s:form>
						</div>
					</div>
					<div class="col span_1_of_3">
						<div class="contact_info">
							<h2>Tìm tại đây</h2>
							<div class="map">
								<iframe width="100%" height="175" frameborder="0" scrolling="no"
									marginheight="0" marginwidth="0"
									src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe>
								<br> <small><a
									href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
									style="color: #666; text-align: left; font-size: 12px">View
										Larger Map</a></small>
							</div>
						</div>
						<div class="company_address">
							<h2>Thông tin cửa hàng :</h2>
							<p>25 Man Thiện P.Hiệp Phú Q.9,TP.HCM</p>
							<p>Việt Nam</p>

							<p>Phone:0982.78.58.28</p>
							<p>Fax: (000) 000 00 00 0</p>
							<p>
								Email: <span><a href="mailto:info@mycompany.com">trinhtuanvuu@gmail.com</a></span>
							</p>
							<p>
								Follow on: <span><a href="#">Facebook</a></span>, <span><a
									href="#">Twitter</a></span>
							</p>
						</div>
					</div>
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

