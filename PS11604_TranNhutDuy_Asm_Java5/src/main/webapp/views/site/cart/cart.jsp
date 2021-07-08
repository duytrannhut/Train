<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="index.html"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Giỏ hàng</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<script src="app/services/orderServices.js"></script>
				<script src="app/controllers/orderController.js"></script>
				<div class="cart-content" ng-controller="orderController"
					ng-init="initOrderCartController()">
					<h1>
						<span>Giỏ hàng của tôi</span>
					</h1>
					<div class="steps clearfix">
						<ul class="clearfix">
							<li
								class="cart active col-md-2 col-xs-12 col-sm-4 col-md-offset-3 col-sm-offset-0 col-xs-offset-0"><span><i
									class="glyphicon glyphicon-shopping-cart"></i></span><span>Giỏ
									hàng của tôi</span><span class="step-number"><a>1</a></span></li>
							<li class="payment col-md-2 col-xs-12 col-sm-4"><span><i
									class="glyphicon glyphicon-usd"></i></span><span>Thanh toán</span><span
								class="step-number"><a>2</a></span></li>
							<li class="finish col-md-2 col-xs-12 col-sm-4"><span><i
									class="glyphicon glyphicon-ok"></i></span><span>Hoàn tất</span><span
								class="step-number"><a>3</a></span></li>
						</ul>
					</div>
					<div class="cart-block">
						<div class="cart-info table-responsive">
							<table class="table product-list">
								<thead>
									<tr>
										<th></th>
										<th>Tên sản phẩm</th>
										<th>Giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${cart.items}">
										<form action="/cart/update/${item.id}" method="post">
											<input type="hidden" name="id" value="${item.id}">
											<tr>
												<td class="image"><a
													href="#"> <img
														src="${item.image}" class="img-responsive" /></a></td>
												<td class="des">
													<h2>
														<a href="#">${item.name}</a>
													</h2> 
												</td>
												<td class="price"> <fmt:formatNumber value="${item.price}" pattern="###,###,###"/>đ</td>
												<td class="quantity"><input type="number" value="${item.quantity}"
													class="text" name="quantity" onblur="this.form.submit()"/></td>
												<td class="amount"><fmt:formatNumber value="${item.price * item.quantity}" pattern="###,###,###"/>đ</td>
												<td class="remove"><a href="/cart/remove/${item.id}"> <i
														class="glyphicon glyphicon-trash"></i>
												</a></td>
											</tr>
										</form>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="clearfix text-right">
							<span><b>Tổng thanh toán:</b></span> <span class="pay-price">
								<fmt:formatNumber value="${cart.total}" pattern="###,###,###"/>đ </span>
						</div>
						<div class="button text-right">
							<a class="btn btn-default" href="/product">Tiếp tục mua hàng</a> <a
								class="btn btn-primary" href="/order/pay">Tiến hành
								thanh toán</a>
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