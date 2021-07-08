<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">

				<div class="menu-product">
					<h3>
						<span> Sản phẩm </span>
					</h3>
					<ul class='level0'>
						<li class="child"><span><a
								href="/product?category_id="><i
									class='fa fa-arrow-circle-o-right'></i>Tất cả sản phẩm</a></span><span
							class='open-close'></span></li>
						<c:forEach var="item" items="${categories}">
							<li class="child"><span><a
									href="/product?category_id=${item.id}"><i
										class='fa fa-arrow-circle-o-right'></i>${item.name}</a></span><span
								class='open-close'></span></li>
						</c:forEach>
					</ul>
				</div>
				<script type="text/javascript">
					$(document).ready(
							function() {
								$('.menu-product li.child .open-close').on(
										'click',
										function() {
											$(this).removeAttr('href');
											var element = $(this).parent('li');
											if (element.hasClass('open')) {
												element.removeClass('open');
												element.children('ul')
														.slideUp();
											} else {
												element.addClass('open');
												element.children('ul')
														.slideDown();
											}
										});
							});
				</script>
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="index.html"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Sản phẩm</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>

				<section class="product-content clearfix">
					<h1 class="title clearfix">
						<span>${category==null?'Sản phẩm':category.name}</span>
					</h1>
					<nav class="navbar navbar-default product-filter">
						<ul class="display">
							<li id="grid" class="active grid"><a href="#" title="Grid"><i
									class="fa fa-th-large"></i></a></li>
						</ul>
						<div class="limit">
							<span>Sản phẩm/trang</span> <select id="lblimit" name="lblimit"
								class="nb_item"
								onchange="window.location.href = this.options[this.selectedIndex].value">
								<c:forEach var="item" items="${limits}">
									<option ${limit==item?'selected':''} value="?limit=${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
						<div class="sort">
							<span>Sắp xếp</span> <select class="selectProductSort"
								id="lbsort"
								onchange="window.location.href = this.options[this.selectedIndex].value">
								<c:forEach var="item" items="${sortItems}">
									<option ${(sort==item.sort && order==item.order)?'selected':''}
										value="?sort=${item.sort}&amp;order=${item.order}">${item.value}</option>
								</c:forEach>

							</select>
						</div>
					</nav>
					<div class="product-block product-grid clearfix">
						<c:forEach var="item" items="${page.content}">
							<div
								class="col-md-3 col-sm-3 col-xs-6 product-resize product-item-box">
								<div class="product-item">
									<div class="image image-resize">
										<a
											href="/product/detail/${item.id}"
											title=""><img src="${item.image}" data-original="" alt=""
											class="img-responsive lazy-img" /> </a>
										<!-- <span class="promotion">-40%</span> -->
									</div>
									<div class="right-block">
										<h2 class="name">
											<a href="/product/detail/${item.id}" title="">${item.name}</a>
										</h2>
										<div class="rating">
											<div class="rating-1">
												<span class="rating-img"> </span>
											</div>
										</div>
										<div class="price">
											<span class="price-new"><fmt:formatNumber
													value="${item.price}" pattern="###,###,###" />&nbsp;₫</span>
											<!-- <span
											class="price-old">12.490.000&nbsp;₫</span> -->
										</div>
										<div class="button">
											<a class="btn btn-default btn-add-cart"
												href="/cart/add/${item.id}">Mua</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="navigation">
						<ul class="pagination">
							<li><a
								href="/product?p=0&limit=${limit}&sort=${sort}&order=${order}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${page.totalPages}" var="i">
								<li class="${(p+1)==i?'active':''}"><a
									href="/product?p=${i-1}&limit=${limit}&sort=${sort}&order=${order}">${i}</a></li>
							</c:forEach>
							<li><a
								href="/product?p=${page.totalPages-1}&limit=${limit}&sort=${sort}&order=${order}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</div>
				</section>
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