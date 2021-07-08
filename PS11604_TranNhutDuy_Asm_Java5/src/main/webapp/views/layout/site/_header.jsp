<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="header">

	<script src="/views/layout/site/Scripts/common/login.js"
		type="text/javascript"></script>
	<section class="top-link clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="nav navbar-nav topmenu-contact pull-left">
						<li><i class="fa fa-phone"></i> <span>Hotline:0123456789</span></li>
					</ul>
					<ul
						class="nav navbar-nav navbar-right topmenu  hidden-xs hidden-sm">
						<li class="order-check"><a href="/kiem-tra-don-hang.html"><i
								class="fa fa-pencil-square-o"></i> Kiểm tra đơn hàng</a></li>
						<li class="order-cart"><a href="/cart"><i
								class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
						<c:if test="${!isLogin}">
							<li class="account-login"><a href="/login"><i
									class="fa fa-sign-in"></i> Đăng nhập </a></li>
							<li class="account-register"><a href="/registration"><i
									class="fa fa-key"></i> Đăng ký </a></li>
						</c:if>
						<c:if test="${isLogin}">
							<c:if test="${admin}">
								<li class="webmaster"><a href="/admin/home"><i
										class="fa fa-gears"></i> Quản trị website</a></li>
							</c:if>
							<li class="account-info"><a href="/account/edit-profile">${fullname}</a>
								<a class="account-logout" id="btnLogOff" href="/logout" title="">[Thoát]
							</a></li>
						</c:if>
					</ul>
					<div class="show-mobile hidden-lg hidden-md">
						<div class="quick-user">
							<div class="quickaccess-toggle">
								<i class="fa fa-user"></i>
							</div>
							<div class="inner-toggle">
								<ul class="login links">
									<c:if test="${!isLogin}">
										<li class="account-login"><a href="/login"><i
												class="fa fa-sign-in"></i> Đăng nhập </a></li>
										<li class="account-register"><a href="#"><i
												class="fa fa-key"></i> Đăng ký </a></li>
									</c:if>
									<c:if test="${isLogin}">
										<c:if test="${admin}">
											<li class="webmaster"><a href="/admin/home"><i
													class="fa fa-gears"></i> Quản trị website</a></li>
										</c:if>
										<li class="account-info"><a
											href="/thong-tin-tai-khoan.html">${fullname}</a> <a
											class="account-logout" id="btnLogOff" href="/logout" title="">[Thoát]
										</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="quick-access">
							<div class="quickaccess-toggle">
								<i class="fa fa-list"></i>
							</div>
							<div class="inner-toggle">
								<ul class="links">
									<li><a id="mobile-wishlist-total"
										href="/kiem-tra-don-hang.html" class="wishlist"><i
											class="fa fa-pencil-square-o"></i> Kiểm tra đơn hàng</a></li>
									<li><a href="/cart" class="shoppingcart"><i
											class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="header-content clearfix">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-12 col-sm-12 header-left text-center">
					<div class="logo">
						<a href="/" title=""> <img alt="PS11604 Shop"
							src="/views/layout/site/Uploads/shop90/images/banner(1).png"
							class="img-responsive" />
						</a>
					</div>
				</div>
				<div class="col-md-9 col-xs-12 col-sm-12 header-right">
					<div class="sale-policy clearfix hidden-sm hidden-xs">
						<ul class="clearfix">
							<li class="shipping"><i class="fa fa-truck"></i><span>
									Giao hàng miễn phí </span></li>
							<li class="payment"><i class="fa fa-money"></i><span>
									Thanh toán linh hoạt </span></li>
							<li class="return"><i class="fa fa-refresh"></i><span>
									Trả hàng trong 30 ngày </span></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-8 col-sm-7 col-xs-12 top-search">
							<div class="search-mobile hidden-md hidden-lg">
								<div class="input-cat form-search clearfix">
									<div class="form-search-controls  input-group">
										<input type="text" name="search" id="txtsearch1"
											onblur="if(this.value=='')this.value='Tìm kiếm...'"
											onfocus="if(this.value=='Tìm kiếm...')this.value=''"
											value="T&#236;m kiếm..." /> <span class="input-group-btn">
											<button class="btn btn-search" title="Search" type="button"
												id="btnsearch1" value="Search">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="search hidden-sm hidden-xs">
								<div class="input-cat form-search clearfix">
									<form action="/product" method="post">
										<div class="form-search-controls">
											<input type="text" name="keywords" value="${keywords}" />
										</div>
										<button class="btn btn-search" title="Search" id="btnsearch"
											value="Search">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-5 col-xs-12 top-cart">
							<div class="cart">
								<div class="heading">
									<a href="/cart"> <span class="icon">icon</span><span
										id="cart-total"> ${cart.count} sp - <fmt:formatNumber
												value="${cart.total}" pattern="###,###,###" />đ
									</span><i class="fa fa-arrow-right"></i>
									</a>
								</div>
								<c:if test="${not empty cart.items }">
									<div class="box-cart-dropdown">
										<!--<div class="cart-empty hide">
                                                <div class="docs">Giỏ hàng trống!</div>
                                                <a>Tiếp tục mua hàng</a>
                                            </div>-->

										<div class="box-cart-dropdown-block">
											<div class="total">
												Có <a href="/cart"><span>${cart.count}</span> sản phẩm</a>
												trong giỏ.<br>
											</div>
											<ul>
												<c:forEach var="item" items="${cart.items}">
													<li class="clearfix">
														<figure class="image">
															<a href="#"> <img alt="" src="${item.image}"
																class="img-responsive">
															</a>
														</figure>
														<div class="name">
															<a href="#">${item.name}</a>
															<div>
																${item.quantity} x <span class="price"> <fmt:formatNumber
																		value="${item.price}" pattern="###,###,###" />₫
																</span>
															</div>
														</div> <span class="remove_link"> <a
															href="/remove/${uri}/${item.id}" class="remove-cart"><i
																class="fa fa-times-circle"></i></a>
													</span>
													</li>
												</c:forEach>

											</ul>
											<div class="cart-payment">
												<div class="amount">
													Tổng tiền: <strong> <fmt:formatNumber
															value="${cart.total}" pattern="###,###,###" />₫
													</strong>
												</div>
												<div class="btn-payment">
													<a class="btn btn-default" href="/order/pay">Đặt
														hàng &amp; Thanh toán</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$("#btnsearch").click(function() {
			SearchProduct();
		});
		$("#txtsearch").keydown(function(event) {
			if (event.keyCode == 13) {
				SearchProduct();
			}
		});
		$("#btnsearch1").click(function() {
			SearchProduct1();
		});
		$("#txtsearch1").keydown(function(event) {
			if (event.keyCode == 13) {
				SearchProduct1();
			}
		});
		function SearchProduct() {
			var key = $('#txtsearch').val();
			if (key == '' || key == 'Tìm kiếm...') {
				$('#txtsearch').focus();
				return;
			}
			var group = $('#lbgroup').val();
			window.location = '/tim-kiem.html?group=' + group + '&key=' + key;
		}
		function SearchProduct1() {
			var key = $('#txtsearch1').val();
			if (key == '' || key == 'Tìm kiếm...') {
				$('#txtsearch1').focus();
				return;
			}
			var group = 0;
			window.location = '/tim-kiem.html?group=' + group + '&key=' + key;
		}
	</script>
	<section class="navigation-menu clearfix">
		<div class="container">
			<div class="menu-top">
				<div class="row">
					<div class="col-md-3">
						<div class="menu-cate menu-quick-select">
							<div class="menu-cate-title">
								<span><i class="fa fa-th-list"></i><a
									href="/san-pham.html">Danh mục sản phẩm</a></span> <i
									class="fa fa-chevron-circle-down"></i>
							</div>
							<ul class="menu-cate-content">
								<li><a href="/san-pham/may-anh-may-quay-phim-1130"> <i
										class="icon-menu fa /views/layout/site/Uploads/shop90/images/icon/i_catelogy_7-20x20_png_pagespeed_ce_kzOx8kw31-.png"></i>
										M&#225;y ảnh &amp; M&#225;y quay phim<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a>
									<div class="sub-menu hidden-xs">
										<ul class="colum0">
											<li><a href="#">M&#225;y ảnh số</a>
												<ul class="subview-menu">
													<c:forEach var="item" items="${listCamera}">
														<li><a href="/product?category_id=${item.id}">${item.name}</a></li>
													</c:forEach>
												</ul></li>
										</ul>
										<ul class="colum1">
											<li><a href="#">M&#225;y quay phim</a>
												<ul class="subview-menu">
													<c:forEach var="item" items="${listCameraPhim}">
														<li><a href="/product?category_id=${item.id}">${item.name}</a></li>
													</c:forEach>
												</ul></li>

										</ul>
									</div></li>
								<li><a href="#"> <i
										class="icon-menu fa /views/layout/site/Uploads/shop90/images/icon/i_catelogy_5-20x20_png_pagespeed_ce_ou8xCNG4YJ.png"></i>
										M&#225;y để b&#224;n &amp; Laptop<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a></li>
								<li><a href="#"> <i class="icon-menu fa "></i> Điện
										thoại<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a></li>
								<li><a href="#"> <i
										class="icon-menu fa /Uploads/shop90/images/icon/i_catelogy_3-20x20_png_pagespeed_ce_j-iqkcibbN.png"></i>
										M&#225;y t&#237;nh bảng<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a></li>
								<li><a href="#"> <i
										class="icon-menu fa /views/layout/site/Uploads/shop90/images/icon/i_catelogy_4-20x20_png_pagespeed_ce_J1kY_BybUA.png"></i>
										Thời trang<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a></li>
								<li><a href="#"> <i
										class="icon-menu fa /views/layout/site/Uploads/shop90/images/icon/i_catelogy_9-20x20_png_pagespeed_ce_G4vH-e1_d9.png"></i>
										H&#224;ng gia dụng<span class="arrow-menu"><i
											class="fa fa-chevron-right "></i></span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-9 ">
						<nav class="navbar nav-menu">
							<div class="navbar-header">
								<button class="navbar-toggle collapsed" type="button"
									data-toggle="collapse" data-target="#mobile-menu"
									aria-controls="mobile-menu" aria-expanded="false">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<nav id="mobile-menu"
								class="mobile-menu collapse navbar-collapse">
								<ul class='menu nav navbar-nav'>
									<li class="level0"><a class='' href='/home'><span>Trang
												chủ</span></a></li>
									<li class="level0"><a class='' href='/about-us'><span>Giới
												thiệu</span></a></li>
									<li class="level0"><a class='' href='/product'><span>Sản
												phẩm</span></a></li>
									<li class="level0"><a class='' href='/news'><span>Tin
												tức</span></a></li>
									<li class="level0"><a class='' href='/contact'><span>Liên
												hệ</span></a></li>
								</ul class='menu nav navbar-nav'>
							</nav>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$(document).ready(function() {
			var str = location.href.toLowerCase();
			$("ul.menu li a").each(function() {
				if (str.indexOf(this.href.toLowerCase()) >= 0) {
					$("ul.menu li").removeClass("active");
					$(this).parent().addClass("active");
				}
			});
		});
	</script>
</div>