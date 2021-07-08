<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Hoàn tất</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<div class="payment-end">
					<div class="">
						<div class="alert alert-success fade in">
							<i class="fa-fw fa fa-check"></i> <strong>Success! </strong> <span>Đơn
								hàng của bạn đã được mua thành công</span>
						</div>
					</div>
					<div class="payment-order clearfix">
						<h3>
							Mã đơn hàng của bạn: <b>${order.id}</b>
						</h3>
						<p>
							<b>Ngày đặt:</b> <i>${order.createDate}</i>
						</p>
						<p>
							<b>Phương thức thanh toán:</b> <i></i>
						</p>
						<h1>Thông tin đơn hàng</h1>
						<table class="table">
							<thead>
								<tr>
									<th>STT</th>
									<th>Sản phâm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="i" value="0" />
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${i=i+1}</td>
										<td><span> ${item.product.name}</span>
											<p class="note"></p></td>
										<td><fmt:formatNumber value="${item.price}" pattern="###,###,###"/></td>
										<td>${item.quantity}</td>
										<td><fmt:formatNumber value="${item.price*item.quantity}" pattern="###,###,###"/>đ</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							<c:set var="total" value="${0}"/>
							<c:forEach var="item" items="${items}">
								<c:set var="total" value="${total+(item.price*item.quantity)}" />
							</c:forEach>
								<tr>
									<td colspan="4" class="text-right label-payment"><b>Tổng
											thanh toán:</b></td>
									<td class="total-payment"><fmt:formatNumber value="${total}" pattern="###,###,###"/> đ</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<div class="clearfix col-md-12">
						<div class="button text-right">
							<a class="btn btn-default" href="/product">Tiếp tục mua hàng</a> <a
								class="btn btn-primary" href="/myorder">Đơn hàng của
								tôi</a>
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