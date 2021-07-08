<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="/views/site/account/common/menu_account.jsp"/>
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/home"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Đăng nhập</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<script src="app/services/accountServices.js"></script>
				<script src="app/controllers/accountController.js"></script>
				<div class="login-content clearfix"
					ng-controller="accountController" ng-init="initController()">
					<h1 class="title">
						<span>Đăng nhập hệ thống</span>
					</h1>
					<jsp:include page="/views/site/account/common/message.jsp"/>
					<div
						class="col-md-6 col-md-offset-3 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
						<form class="form-horizontal" action="/login" method="post">
							<div class="form-group">
								<label for="Email" class="col-sm-4 control-label">Tên tài khoản</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="username" value="${username}" required="required"/>
								</div>
							</div>
							<div class="form-group">
								<label for="Password" class="col-sm-4 control-label">Mật
									khẩu</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" name="password"/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<input type="checkbox" name="remember" value="true"> Remember me?
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button type="submit" class="btn btn-default">Đăng
										nhập</button>
									<a href="/forgotpassword">Quên mật khẩu</a>
								</div>

							</div>
						</form>
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