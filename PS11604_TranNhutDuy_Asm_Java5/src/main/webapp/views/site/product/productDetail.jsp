<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<!--Begin-->
				<!--End-->
				<div class="box-product">
					<h3>
						<span> Sản phẩm Hot </span>
					</h3>
					<div class="box-product-block">
						<c:forEach var="sp" items="${items}">
						<div class="item">
							<div class="image">
								<a href="/product/detail/${sp.id}" title="">
									<img class="img-responsive lazy-img" src="${sp.image}" data-original="" alt="" title="" style="display: inline-block;">
								</a>
							</div>
							<div class="name">
								<a
									href="/product/detail/${sp.id}"
									title="">${sp.name}</a>
							</div>
							<div class="rating">
								<div class="rating-1">
									<span class="rating-img"> </span>
								</div>
							</div>
							<div class="price">
								<span class="price-new"><fmt:formatNumber value="${sp.price}" pattern="###,###,###" />&nbsp;₫</span> 
								<!-- <span class="price-old">12.490.000&nbsp;₫</span> -->
							</div>
							<div class="button text-center">
								<a class="btn btn-default btn-add-cart"
									href="/cart/add/${sp.id}">Mua</a>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="category17 icon-li">
							<div class="link-site-more">
								<a title="" href="/san-pham/may-anh-canon" itemprop="url"> <span
									itemprop="title">${item.category.name}</span>
								</a>
							</div>
						</li>
						<li class="productname icon-li"><strong>${item.name}</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>

				<link
					href="/views/layout/site/Scripts/smoothproducts/smoothproducts.css"
					rel="stylesheet" type="text/css">
				<script
					src="/views/layout/site/Scripts/smoothproducts/smoothproducts.js"
					type="text/javascript"></script>
				<div class="product-detail clearfix relative ng-scope">
					<!--Begin-->
					<div class="product-block clearfix">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12 product-image clearfix">
								<div class="sp-loading" style="display: none;">
									<img src="/Images/sp-loading.gif" alt=""><br>LOADING
									IMAGES
								</div>
								<div class="sp-wrap sp-non-touch" style="display: inline-block;">
									<div class="sp-large">
										<a
											href="/product/detail/${item.id}"
											class="sp-current-big"><img
											src="${item.image}"
											alt=""></a>
									</div>

								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12 clearfix">
								<h2 class="ng-binding">${item.name}</h2>
								<div class="price ng-scope">
									<!-- ngIf: IsPromotion==true -->
									<div class="ng-scope">
										<span class="price-new ng-binding">
											<fmt:formatNumber value="${item.price}" pattern="###,###,###" />đ
										</span>
										<%-- <span class="price-old ng-binding">
											<fmt:formatNumber value="${item.price}" pattern="###,###,###" />đ
										</span> --%>
									</div>
									<!-- end ngIf: IsPromotion==true -->
									<!-- ngIf: IsPromotion==false -->
									<span class="product-code ng-binding">Mã SP: ${item.id}</span>
								</div>
								<div class="button ng-scope">
									<a href="/cart/add/${item.id}" class="btn btn-default"><i
										class="glyphicon glyphicon-shopping-cart"></i>Thêm giỏ hàng</a> 
									<a href="/order/pay/${item.id}" class="btn btn-primary"><i
										class="glyphicon glyphicon-ok"></i>Mua ngay</a>
								</div>
								<div class="call">
									<p class="title">Để lại số điện thoại, chúng tôi sẽ tư vấn
										ngay sau từ 5 › 10 phút</p>
									<div class="input">
										<div class="input-group">
											<input class="form-control ng-pristine ng-untouched ng-valid"
												ng-model="CustomerPhone"
												onblur="if(this.value=='')this.value='Nhập số điện thoại...'"
												onfocus="if(this.value=='Nhập số điện thoại...')this.value=''"
												value="Nhập số điện thoại..." type="text"> <span
												class="input-group-btn">
												<button class="btn btn-primary" type="button"
													ng-click="callMe()">
													<i class="fa fa-phone"></i> Gọi lại cho tôi
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$(".menu-quick-select ul").hide();
		$(".menu-quick-select").hover(function() {
			$(".menu-quick-select ul").show();
		}, function() {
			$(".menu-quick-select ul").hide();
		});
	});
</script>