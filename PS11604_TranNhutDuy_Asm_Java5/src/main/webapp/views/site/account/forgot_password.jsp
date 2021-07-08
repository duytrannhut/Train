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
							class="home"><a title="Đến trang chủ" href="index.html"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Quên mật khẩu</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<div class="foget-password-content clearfix">
					<h1 class="title">
						<span>Quên mật khẩu</span>
					</h1>
					<jsp:include page="/views/site/account/common/message.jsp"/>
					<div class="alert alert-info fade in">
						<button data-dismiss="alert" class="close"></button>
						<i class="fa-fw fa fa-check"></i> Điền vào email của bạn để yêu
						cầu một mật khẩu mới. Một Email sẽ được gửi đến địa chỉ này để xác
						minh địa chỉ Email của bạn.
					</div>

					<div
						class="col-md-8 col-md-offset-2 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
						<form class="form-horizontal" action="/forgotpassword" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-sm-4 control-label">Email</label>
								<div class="col-sm-8">
									<input type="email" name="email" class="form-control" required/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Tên tài khoản</label>
								<div class="col-sm-8">
									<input type="text" name="username" class="form-control" required/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button type="submit" class="btn btn-default">Gửi mật
										khẩu</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<script type="text/javascript">
					$(document).ready(function() {
						$("#btnRefreshCapcha").click(function() {
							GetImageCaptcha();
						});
					});
					function GetImageCaptcha() {
						var date = new Date();
						var t = date.getTime();
						$("#imgCaptcha").attr("src", "/Captcha.ashx?t=" + t);
					}
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