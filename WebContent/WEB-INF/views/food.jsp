<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Thông tin sản phẩm</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Doppio+One'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Monda' rel='stylesheet'
	type='text/css'>
<script src="js/script.js" type="text/javascript"></script>

</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="header_top">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt="" /></a>
				</div>
				<div class="header_top_right">
					<div class="search_box">
						<form>
							<input type="text" value="Tìm kiếm sản phẩm"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search for Products';}"><input
								type="submit" value="SEARCH">
						</form>
					</div>
					<div class="shopping_cart">
						<div class="cart">
							<a href="#" title="View my shopping cart" rel="nofollow"> <strong
								class="opencart"> </strong> <span class="cart_title">Giỏ
									hàng</span> <span class="no_product">(Trống)</span>
							</a>
						</div>
					</div>
					<div class="languages">
						<div id="language" class="wrapper-dropdown" tabindex="1">
							EN <strong class="opencart"> </strong>
							<ul class="dropdown languges">
								<li><a href="#" title="FranÃ§ais"> <span><img
											src="images/gb.png" alt="en" width="26" height="26"></span><span
										class="lang">English</span>
								</a></li>
								<li><a href="#" title="FranÃ§ais"> <span><img
											src="images/au.png" alt="fr" width="26" height="26"></span><span
										class="lang">FranÃ§ais</span>
								</a></li>
								<li><a href="#" title="EspaÃ±ol"> <span><img
											src="images/bm.png" alt="es" width="26" height="26"></span><span
										class="lang">EspaÃ±ol</span>
								</a></li>
								<li><a href="#" title="Deutsch"> <span><img
											src="images/ck.png" alt="de" width="26" height="26"></span><span
										class="lang">Deutsch</span>
								</a></li>
								<li><a href="#" title="Russian"> <span><img
											src="images/cu.png" alt="ru" width="26" height="26"></span><span
										class="lang">Russian</span>
								</a></li>
							</ul>
						</div>
						<script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#language') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown').removeClass('active');
				});

			});

		</script>
					</div>
					<div class="currency">
						<div id="currency" class="wrapper-dropdown" tabindex="1">
							$ <strong class="opencart"> </strong>
							<ul class="dropdown">
								<li><a href="#"><span>$</span>Dollar</a></li>
								<li><a href="#"><span>â¬</span>VNĐ</a></li>
							</ul>
						</div>
						<script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#currency') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown').removeClass('active');
				});

			});

		</script>
					</div>
					<div class="login">
						<span><a href="login.htm"><img src="images/login.png"
								alt="" title="login" /></a></span>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="h_menu">
				<a id="touch-menu" class="mobile-menu" href="#">Menu</a>
				<nav>
					<ul class="menu list-unstyled">
						<li><a href="index.htm">Trang chủ</a></li>
						<li class="activate"><a href="products.htm">Sản phẩm</a>
							<ul class="sub-menu list-unstyled">
								<div class="nag-mother-list">
									<div class="navg-drop-main">
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 1</a></li>
											<li><a href="products.htm">Sản phẩm 2</a></li>
											<li><a href="products.htm">Sản phẩm 3</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 1</a></li>
											<li><a href="products.htm">Sản phẩm 2</a></li>
											<li><a href="products.htm">Sản phẩm 3</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 1</a></li>
											<li><a href="products.htm">Sản phẩm 2</a></li>
											<li><a href="products.htm">Sản phẩm 3</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 1</a></li>
											<li><a href="products.htm">Sản phẩm 2</a></li>
											<li><a href="products.htm">Sản phẩm 3</a></li>
										</div>
										<div class="clear"></div>
									</div>
									<div class="navg-drop-main">
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="clear"></div>
									</div>
									<div class="navg-drop-main">
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="nav-drop">
											<li><a href="products.htm">Sản phẩm 4</a></li>
											<li><a href="products.htm">Sản phẩm 5</a></li>
											<li><a href="products.htm">Sản phẩm 6</a></li>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</ul></li>
						<li><a href="products.htm">Hàng đầu</a>
							<ul class="sub-menu list-unstyled sub-menu2">
								<div class="navg-drop-main">
									<div class="nav-drop nav-top-brand">
										<li><a href="products.htm">Sản phẩm 1</a></li>
										<li><a href="products.htm">Sản phẩm 2</a></li>
										<li><a href="products.htm">Sản phẩm 3</a></li>
										<li><a href="products.htm">Sản phẩm 4</a></li>
										<li><a href="products.htm">Sản phẩm 5</a></li>
										<li><a href="products.htm">Sản phẩm 6</a></li>
									</div>
								</div>
							</ul></li>
						<li><a href="faq.htm">Dịch vụ</a>
							<ul class="sub-menu list-unstyled sub-menu3">
								<div class="navg-drop-main">
									<div class="nav-drop">
										<li><a href="products.htm">Sản phẩm 4</a></li>
										<li><a href="products.htm">Sản phẩm 5</a></li>
										<li><a href="products.htm">Sản phẩm 6</a></li>
									</div>
									<div class="nav-drop">
										<li><a href="products.htm">Sản phẩm 4</a></li>
										<li><a href="products.htm">Sản phẩm 5</a></li>
										<li><a href="products.htm">Sản phẩm 6</a></li>
									</div>
									<div class="nav-drop">
										<li><a href="products.htm">Sản phẩm 4</a></li>
										<li><a href="products.htm">Sản phẩm 5</a></li>
										<li><a href="products.htm">Sản phẩm 6</a></li>
									</div>
									<div class="nav-drop">
										<li><a href="products.htm">Sản phẩm 4</a></li>
										<li><a href="products.htm">Sản phẩm 5</a></li>
										<li><a href="products.htm">Sản phẩm 6</a></li>
									</div>
									<div class="clear"></div>
								</div>
							</ul></li>
						<li><a href="about.htm">Thông tin</a></li>

						<li><a href="faq.html">Chính sách mua hàng </a></li>
						<li><a href="contact.html">Liên hệ</a></li>
						<div class="clear"></div>
					</ul>
				</nav>
				<script src="js/menu.js" type="text/javascript"></script>
			</div>
		</div>
		<div class="main">
			<div class="content">
				<div class="content_top">
					<div class="back-links">
						<p>
							<a href="index.htm">Trang chủ</a> >> <a href="#">Thông tin</a>
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
					<div class="page-no">
						<p>Trang:
						<ul>
							<li><a href="#">1</a></li>
							<li class="active"><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li>[<a href="#"> Tiếp>>></a>]
							</li>
						</ul>
						</p>
					</div>
					<div class="clear"></div>
				</div>
				<div class="section group">
					<div class="cont-desc span_1_of_2">
						<div class="grid images_3_of_2">
							<img src="images/feature-pic2.jpg" alt="" />
						</div>
						<div class="desc span_3_of_2">
							<h2>Bể cá mini nguyên khẩu</h2>
							<ur>
							<li>Thiết kế sang trọng , khung gỗ dày và chắc</li>
							<li>Kích thước khung gỗ 32x16x16cm</li>
							<li>Kích thước khung kiếng 28x13x14cm</li>
							<li>Màu sơn đếu và đẹp</li>
							<li>Tặng sỏi nền và cây nhựa mini</li>


							</ur>
							<div class="price">
								<p>
									Price: <span>320.000 VNĐ</span>
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
									<span><a href="#">Thêm vào giỏ</a></span>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="product-desc">
							<h2>Thông tin chi tiết</h2>
							<p>Bể cá mini để bàn khung gỗ đẹp, mang ý nghĩa phong thủy
								lớn cho bạn, nên đặt một bể cá mini khung gỗ trên bàn làm việc,
								ngắm cá cảnh bơi để xả stress, rất hiệu quả đấy, bạn hãy thử xem</p>
							<p>Bể cá mini để bàn khung gỗ màu đen có kích thước nhỏ gọn
								32x16x16cm, bể cá mini được làm bằng kính tốt, bên ngoài ốp gỗ
								sơn dầu bóng và đẹp. Khi mua bể cá mini loại này bạn được tặng
								kèm các vật dụng để nuôi cá như sỏi nền trang trí và cây nhựa
								tạo cảnh cho đẹp.</p>
							<p>Bộ sản phẩm bao gồm : 1 Khung gỗ kích thước 32x16x16cm 1
								Hồ kiếng kích thước 28x13x14cm 1 Đèn LED 1 Lọc Thác sobo 303H 1
								Gói sỏi nền 1 Cây nhựa mini trang trí Thông tin sản phẩm : - Hồ
								kiếng 5ly chắc chắn - Khung gỗ dày 1.8cm đem lại vẻ sang trọng
								và chắc chắn</p>
							<p>Giá sản phẩm trên đã bao gồm thuế theo luật hiện hành. Tuy
								nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao
								hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển,
								phụ phí hàng cồng kềnh, ..</p>

						</div>
						<div class="product-tags">
							<h2>Product Tags</h2>
							<h4>Add Your Tags:</h4>
							<div class="input-box">
								<input type="text" value="" />
							</div>
							<div class="button">
								<span><a href="#">Add Tags</a></span>
							</div>
						</div>
					</div>
					<div class="rightsidebar span_3_of_1">
						<h2>Sản phẩm khác</h2>
						<ul>
							<li><a href="preview-1.htm">Bể cá hình tròn</a></li>
							<li><a href="preview-2.htm">Bể cá mini nguyên khẩu</a></li>
							<li><a href="preview-3.htm">Bể cá tròn+ thủy sinh</a></li>
							<li><a href="preview-4.htm">Bể cá đôi</a></li>
							<li><a href="preview-dau4.htm">Thức ăn</a></li>
							<li><a href="preview-dau2.htm">Phụ kiện</a></li>
							<li><a href="preview-7.htm">Cây rong thủy sinh</a></li>
							<li><a href="preview-5.htm">Vợt bắt cá</a></li>
							<li><a href="preview-6.htm">Bột cát trắng thủy tinh</a></li>
							<li><a href="preview-8.htm">Cá cảnh</a></li>

						</ul>
						<div class="subscribe">
							<h2>Newsletters Signup</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod.......</p>
							<div class="signup">
								<form>
									<input type="text" value="E-mail address"
										onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = 'E-mail address';"><input
										type="submit" value="Sign up">
								</form>
							</div>
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
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="wrapper">
			<div class="section group">
				<div class="col_1_of_4 span_1_of_4">
					<h4>Information</h4>
					<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#"><span>Advanced Search</span></a></li>
						<li><a href="#">Orders and Returns</a></li>
						<li><a href="#"><span>Contact Us</span></a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
					<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="faq.html">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html"><span>Site Map</span></a></li>
						<li><a href="preview-2.html"><span>Search Terms</span></a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
					<ul>
						<li><a href="contact.html">Sign In</a></li>
						<li><a href="index.html">View Cart</a></li>
						<li><a href="#">My Wishlist</a></li>
						<li><a href="#">Track My Order</a></li>
						<li><a href="faq.html">Help</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
					<ul>
						<li><span>0982.78.58.28</span></li>
						<li><span>0352.479.544</span></li>
					</ul>
					<div class="social-icons">
						<h4>Follow Us</h4>
						<ul>
							<li class="facebook"><a href="#" target="_blank"> </a></li>
							<li class="twitter"><a href="#" target="_blank"> </a></li>
							<li class="googleplus"><a href="#" target="_blank"> </a></li>
							<li class="contact"><a href="#" target="_blank"> </a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="copy_right">
				<p>
					&copy; 2019 Smart Store. All Rights Reserved | Design by <a
						href="http://w3layouts.com">Tuấn Vũ</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>

