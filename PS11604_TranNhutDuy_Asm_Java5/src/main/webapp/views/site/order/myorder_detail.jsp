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
				<div class="myorder-content myorder-detail-content clearfix">
					<h1 class="title">
						<span>Đơn hàng của tôi</span>
					</h1>
					<div class="myorder-block">
						<div class="row-title docs">
							Đơn hàng của <a href="#">${order.account.fullname}</a><b>
								(#${order.id})</b> lúc <span class="grey">${order.createDate}</span>
						</div>
						<div class="table-responsive clearfix myorder-info">
							<table class="table table-mycart">
								<thead>
									<tr>
										<th>STT</th>
										<th colspan="2">Tên sản phẩm</th>
										<th>Mã sản phẩm</th>
										<th>Giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="item" items="${items}">
										<tr>
											<td>${i=i+1}</td>
											<td class="image"><a href="#"><img
													class="img-responsive" src="${item.product.image}"></a></td>
											<td><a href="#">${item.product.name}</a> <!-- ngIf: it.IsVariant==true --></td>
											<td>${item.product.id}</td>
											<td><fmt:formatNumber value="${item.price}"
													pattern="###,###,###" />đ</td>
											<td>${item.quantity}</td>
											<td><fmt:formatNumber
													value="${item.price*item.quantity}" pattern="###,###,###" />đ</td>
										</tr>
									</c:forEach>
									<tr>
										<td class="border-right" colspan="3">
											<div class="box-customer-content">
												<div class="title docs">
													<span>Thông tin giao hàng</span>
												</div>
												<div>
													[Anh/Chị]<b> ${order.account.fullname}</b>
												</div>
												<div>${order.account.email} | ${order.address}</div>
											</div>
											<div class="box-customer-content">
												<div class="title">
													<span>Thông tin thanh toán</span>
												</div>
												<div>
													[Anh/Chị]<b>${order.account.fullname}</b>
												</div>
												<div>${order.account.email} | ${order.address}</div>
											</div>
										</td>
										<td colspan="4">
											<table class="table">
												<tbody>
													<tr>
														<td class="text-left"><b>Tổng tiền thanh toán</b></td>
														<c:set var="total" value="${0}" />
														<c:forEach var="item" items="${items}">
															<c:set var="total"
																value="${total+(item.price*item.quantity)}" />
														</c:forEach>
														<td class="text-right "><b class="total-payment">
																<fmt:formatNumber value="${total}" pattern="###,###,###" />đ
														</b>
															<div class="help-block">Bao gồm VAT</div></td>
													</tr>
													<tr class="text-center order-stt">
														<td colspan="2">
															<div class="docs">Trạng thái đơn hàng</div>
															<div class="docs">
																<b>Chưa</b>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="button text-right">
							<a class="btn btn-default" href="/myorder">Trở về danh
								sách đơn hàng</a> <a class="btn btn-primary" href="/home">Tiếp tục
								mua hàng</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>