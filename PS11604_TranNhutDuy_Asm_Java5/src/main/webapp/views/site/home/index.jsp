<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-9 ">

			<script src="/views/layout/site/app/services/moduleServices.js"></script>
			<script src="/views/layout/site/app/controllers/moduleController.js"></script>
			<!--Begin-->
			<link href="/views/layout/site/Scripts/flexSlider/flexslider.css"
				rel="stylesheet" type="text/css" />
			<script
				src="/views/layout/site/Scripts/flexSlider/jquery.flexslider-min.js"
				type="text/javascript"></script>
			<div class="flexslider slideshow-content" id="bannerheaderhome"
				ng-controller="moduleController"
				ng-init="initSlideshowController('Slideshows')">
				<ul class="slides">
					<li ng-repeat="item in Slideshows"><a title="{{item.Name}}"
						href="{{item.Link}}"> <img alt="{{item.Name}}"
							ng-src="{{item.Image}}" data-original="{{item.Image}}"
							class="lazy" />
					</a></li>
				</ul>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#bannerheaderhome').flexslider({
						directionNav : true,
						controlNav : false,
						animation : "slide",
						itemHeigh : 270,
						itemMargin : 0,
						animationSpeed : 700,
						slideshowSpeed : 3000
					});
				});
			</script>
			<!--End-->
			<script type="text/javascript">
				window.Slideshows = [
						{
							"Id" : 75654,
							"ShopId" : 54611,
							"Name" : "#2",
							"Image" : "/views/layout/site/Uploads/shop90/images/product/785x350%20_%20O1.jpg",
							"Link" : null,
							"Index" : 2,
							"Inactive" : false,
							"Timestamp" : "AAAAAABZ25Q="
						},
						{
							"Id" : 75655,
							"ShopId" : 54611,
							"Name" : "65",
							"Image" : "/views/layout/site/Uploads/shop90/images/product/785x350fujifilm.jpg",
							"Link" : null,
							"Index" : 3,
							"Inactive" : false,
							"Timestamp" : "AAAAAABZ25U="
						},
						{
							"Id" : 75656,
							"ShopId" : 54611,
							"Name" : "654",
							"Image" : "/views/layout/site/Uploads/shop90/images/product/785x350dungthumayanh.jpg",
							"Link" : null,
							"Index" : 4,
							"Inactive" : false,
							"Timestamp" : "AAAAAABZ25Y="
						} ];
			</script>
		</div>
	</div>
</div>


<div class="adv">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<link
					href="/views/layout/site/Scripts/owl-carousel/owl.carousel.css"
					rel="stylesheet" />
				<link href="/views/layout/site/Scripts/owl-carousel/owl.theme.css"
					rel="stylesheet" />
				<script
					src="/views/layout/site/Scripts/owl-carousel/owl.carousel.min.js"></script>
				<script src="/views/layout/site/app/services/moduleServices.js"></script>
				<script src="/views/layout/site/app/controllers/moduleController.js"></script>
				<!--Begin-->
				<div class="adv-content row" ng-controller="moduleController"
					ng-init="initAdvSlideController('AdvSlides')">
					<div class="owl-carousel">
						<ul id="adv-content">
							<li ng-repeat="item in AdvSlides"><a href="{{item.Link}}"><img
									ng-src="{{item.Image}}" data-original="{{item.Image}}"
									alt="{{it.Name}}" class="img-responsive lazy" /></a></li>
						</ul>
						<div class="controls boxprevnext">
							<a class="prev prevlogo"><i class="fa fa-angle-left"></i></a> <a
								class="next nextlogo"><i class="fa fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						var owladv = $(".adv-content ul");
						owladv.owlCarousel({
							autoPlay : true,
							autoPlay : 5000,
							items : 3,
							slideSpeed : 1000,
							pagination : false,
							itemsDesktop : [ 1200, 3 ],
							itemsDesktopSmall : [ 980, 3 ],
							itemsTablet : [ 767, 1 ],
							itemsMobile : [ 480, 1 ]
						});
						$(".adv-content .nextlogo").click(function() {
							owladv.trigger('owl.next');
						})
						$(".adv-content .prevlogo").click(function() {
							owladv.trigger('owl.prev');
						})
					});
				</script>
				<!--End-->
				<script type="text/javascript">
					window.AdvSlides = [
							{
								"Id" : 67401,
								"ShopId" : 54611,
								"AdvType" : 2,
								"AdvTypeName" : "Chạy ngang",
								"Name" : "Áo thun nữ",
								"Image" : "/views/layout/site/Uploads/shop90/images/product/EOS-5D-MarkIII.jpg",
								"ImageThumbnai" : "/views/layout/site/Uploads/shop90/images/product/EOS-5D-MarkIII.jpg",
								"Link" : "#",
								"IsVideo" : false,
								"Index" : 1,
								"Inactive" : false,
								"Timestamp" : "AAAAAABZ2o4="
							},
							{
								"Id" : 67403,
								"ShopId" : 54611,
								"AdvType" : 2,
								"AdvTypeName" : "Chạy ngang",
								"Name" : "Đồng hồ nam",
								"Image" : "/views/layout/site/Uploads/shop90/images/product/canon-powershot-g7x.jpg",
								"ImageThumbnai" : "/views/layout/site/Uploads/shop90/images/product/canon-powershot-g7x.jpg",
								"Link" : "#",
								"IsVideo" : false,
								"Index" : 2,
								"Inactive" : false,
								"Timestamp" : "AAAAAABZ2pA="
							},
							{
								"Id" : 67402,
								"ShopId" : 54611,
								"AdvType" : 2,
								"AdvTypeName" : "Chạy ngang",
								"Name" : "Giày nam",
								"Image" : "/views/layout/site/Uploads/shop90/images/product/canon-powershot-g1x-mark-ii1.jpg",
								"ImageThumbnai" : "/views/layout/site/Uploads/shop90/images/product/canon-powershot-g1x-mark-ii1.jpg",
								"Link" : "#",
								"IsVideo" : false,
								"Index" : 3,
								"Inactive" : false,
								"Timestamp" : "AAAAAABZ2o8="
							} ];
				</script>
			</div>
		</div>
	</div>
</div>

<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<section class="product-content clearfix">
					<h1 class="title clearfix">
						<span>Sản phẩm bán chạy</span>
					</h1>
					<div class="product-block product-grid clearfix">
						<c:forEach var="item" items="${top12.content}">
							<div
								class="col-md-2 col-sm-2 col-xs-6 product-resize product-item-box">
								<div class="product-item">
									<div class="image image-resize">
										<a href="/product/detail/${item.product.id}"
											title=""> <img
											src="${item.product.image}"
											data-original=""
											alt=""
											class="img-responsive lazy-img" />
										</a>
									</div>
									<div class="right-block">
										<h2 class="name">
											<a href="/product/detail/${item.product.id}"
												title="">${item.product.name}</a>
										</h2>
										<div class="rating">
											<div class="rating-1">
												<span class="rating-img"> </span>
											</div>
										</div>
										<div class="price">
											<span class="price-new"><fmt:formatNumber value="${item.product.price}" pattern="###,###,###"/> ₫</span>
										</div>
										<div class="button">
											<a class="btn btn-default btn-add-cart"
												href="/cart/add/${item.product.id}">Mua</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</section>
				<!--Template--
--End-->
			</div>
		</div>
	</div>
</div>