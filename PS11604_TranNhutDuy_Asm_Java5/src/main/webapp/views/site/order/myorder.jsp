<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="/views/site/account/common/menu_editprofile.jsp" />
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Đơn hàng của tôi</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>

				<div class="myorder-content clearfix">
					<h1 class="title">
						<span>Đơn hàng của tôi</span>
					</h1>
					<div class="myorder-block">
						<div class="table-responsive clearfix myorder-info">
							<table class="table table-mycart">
								<thead>
									<tr>
										<th>STT</th>
										<th>Mã đơn hàng</th>
										<th>Tên khách hàng</th>
										<th>Tổng tiền</th>
										<th>Vận chuyển</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="item" items="${items}">
									<tr>
										<td>${i=i+1}</td>
										<td><a href="/don-hang/36485.html">#${item.id}</a></td>
										<td><a href="#">${item.account.fullname}</a></td>
										<c:set var="total" value="${0}" />
										<c:forEach var="itemDetail" items="${item.orderDetails}">
											<c:set var="total"
												value="${total+(itemDetail.price*itemDetail.quantity)}" />
										</c:forEach>
										<td><fmt:formatNumber value="${total}" pattern="###,###,###"/>đ</td>
										<td>${deliveried?'Đang vận chuyển':'Chưa'}</td>
										<td class="text-center"><a href="/account/myorder/detail/${item.id}"><i
												class="fa fa-angle-double-right "></i>Xem đơn hàng</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
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