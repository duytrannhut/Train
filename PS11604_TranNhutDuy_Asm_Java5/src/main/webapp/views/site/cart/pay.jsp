<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="payment-content">
					<h1 class="title">
						<span>Thanh toán</span>
					</h1>
					<div class="steps clearfix">
						<ul class="clearfix">
							<li
								class="cart active col-md-2 col-xs-12 col-sm-4 col-md-offset-3 col-sm-offset-0 col-xs-offset-0"><span><i
									class="glyphicon glyphicon-shopping-cart"></i></span><span>Giỏ
									hàng của tôi</span><span class="step-number"><a>1</a></span></li>
							<li class="payment active col-md-2 col-xs-12 col-sm-4"><span><i
									class="glyphicon glyphicon-usd"></i></span><span>Thanh toán</span><span
								class="step-number"><a>2</a></span></li>
							<li class="finish col-md-2 col-xs-12 col-sm-4"><span><i
									class="glyphicon glyphicon-ok"></i></span><span>Hoàn tất</span><span
								class="step-number"><a>3</a></span></li>
						</ul>
					</div>
					<div class="payment-title text-center hidden">
						<h3>GIAO HÀNG TOÀN QUỐC - THANH TOÁN KHI NHẬN HÀNG - 15 NGÀY
							ĐỔI TRẢ MIỄN PHÍ</h3>
						<div>
							Nếu gặp khó khăn trong việc đặt hàng xin hãy gọi<b
								class="hotline"> 0123456789 </b> để được hỗ trợ tốt nhất.
						</div>
					</div>
					<form class="payment-block clearfix" id="checkout-container"
						action="/order/success" method="post">
						<div class="col-md-4 col-sm-12 col-xs-12 payment-step step2">
							<h4>1. Địa chỉ thanh toán và giao hàng</h4>
							<div class="step-preview clearfix">
								<h2 class="title">Thông tin thanh toán</h2>
								<div class="info-user ng-scope">
									<label>Người nhận:<span class="ng-binding">${user.fullname}</span></label> 
									<label>Email:<span class="ng-binding">${user.email}</span></label>
								</div>
								<div class="form-block">
									<textarea class="form-control" rows="4" name="address"
										placeholder="Địa chỉ"></textarea>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12 col-xs-12 payment-step step3">
							<h4>2. Thanh toán và vận chuyển</h4>
							<div class="step-preview clearfix">
								<h2 class="title">Vận chuyển</h2>
								<div class="form-group ">
									<select class="form-control"></select>
								</div>
								<h2 class="title">Thanh toán</h2>
							</div>
						</div>
						<div class="col-md-4 col-sm-12 col-xs-12 payment-step step1">
							<h4>3. Thông tin đơn hàng</h4>
							<div class="step-preview">
								<div class="cart-info">
									<c:forEach var="item" items="${cart.items}">
										<div class="cart-items">
											<div class="cart-item clearfix">
												<span class="image pull-left" style="margin-right: 10px;">
													<a href="#"> <img src="${item.image}"
														class="img-responsive" />
												</a>
												</span>
												<div class="product-info pull-left">
													<span class="product-name"> <a href="#">${item.name}</a>
														x <span>${item.quantity}</span>
													</span>
												</div>
												<span class="price"><fmt:formatNumber
														value="${item.quantity*item.price}" pattern="###,###,###" />
													₫</span>
											</div>
										</div>
									</c:forEach>
									<div class="total-price">
										Thành tiền <label> <fmt:formatNumber
												value="${cart.total}" pattern="###,###,###" /> ₫
										</label>
									</div>
									<div class="total-payment">
										Thanh toán <span> <fmt:formatNumber
												value="${cart.total}" pattern="###,###,###" /> ₫
										</span>
									</div>
									<div class="button-submit">
										<button class="btn btn-default">Đặt hàng</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>


				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="index.html"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Thanh toán</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
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