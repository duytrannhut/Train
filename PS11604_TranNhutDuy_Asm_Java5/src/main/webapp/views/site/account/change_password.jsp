<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="/views/site/account/common/menu_editprofile.jsp"/>
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Thay đổi mật khẩu</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<div class="change-password-content clearfix ng-scope">
					<h1 class="title">
						<span>Thay đổi mật khẩu</span>
					</h1>
					<jsp:include page="/views/site/account/common/message.jsp"/>
					<div
						class="col-md-8 col-md-offset-2 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
						<form
							class="form-horizontal ng-pristine ng-invalid ng-invalid-required"
							 action="/account/change-password" method="post">
							<div class="form-group">
								<label for="" class="col-sm-4 control-label">Mật khẩu cũ</label>
								<div class="col-sm-8">
									<input type="password"
										class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required"
										name="password" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-4 control-label">Mật khẩu
									mới</label>
								<div class="col-sm-8">
									<input type="password"
										class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required"
										name="newpassword" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-4 control-label">Nhập lại
									mật khẩu</label>
								<div class="col-sm-8">
									<input type="password"
										class="form-control ng-pristine ng-untouched ng-invalid ng-invalid-required"
										name="repassword" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button type="submit" class="btn btn-default">Cập nhật</button>
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