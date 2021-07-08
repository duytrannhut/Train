<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
	#pic {
		display: none;
	}
	
	.newbtn {
		cursor: pointer;
	}
	
	#blah {
		max-width: 120px;
		height: 120px;
		margin-top: 10px;
	}
</style>
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
						<li class="icon-li"><strong>Đăng ký tài khoản</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<div class="register-content clearfix">
					<h1 class="title">
						<span>Đăng ký tài khoản</span>
					</h1>
					<jsp:include page="/views/site/account/common/message.jsp"></jsp:include>
					<div
						class="col-md-8 col-md-offset-2 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
						<form:form cssClass="form-horizontal" method="post" modelAttribute="user" enctype="multipart/form-data">
							<h2>
								<span>Thông tin tài khoản</span>
							</h2>
							<div class="form-group">
								<label for="Code" class="col-sm-3 control-label">Tài
									khoản<span class="warning">(*)</span>
								</label>
								<div class="col-sm-9">
									<form:input path="username" cssClass="form-control" required="true"/>
								</div>
							</div>
							<div class="form-group">
								<label for="Email" class="col-sm-3 control-label">Email<span
									class="warning">(*)</span></label>
								<div class="col-sm-9">
									<form:input path="email" cssClass="form-control" required="true"/>
								</div>
							</div>
							<div class="form-group">
								<label for="Password" class="col-sm-3 control-label">Mật
									khẩu<span class="warning">(*)</span>
								</label>
								<div class="col-sm-9">
									<form:password path="password" cssClass="form-control" required="true"/>
								</div>
							</div>
							<div class="form-group">
								<label for="RePassword" class="col-sm-3 control-label">Nhập
									lại mật khẩu<span class="warning">(*)</span>
								</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="repassword"/>
								</div>
							</div>
							<h2>Thông tin cá nhân</h2>
							<div class="form-group">
								<label for="Name" class="col-sm-3 control-label">Họ tên<span
									class="warning">(*)</span></label>
								<div class="col-sm-9">
									<form:input path="fullname" cssClass="form-control" required="true"/>
								</div>
							</div>

							<div class="form-group">
								<label for="" class="col-sm-3 control-label">Hình ảnh</label>
								<div class="col-sm-9">
									<label class=newbtn> <img id="blah"
										src="http://placehold.it/120x120"> <input id="pic"
										class='pis' onchange="readURL(this);" type="file" name="photo_file">
									</label>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button type="submit" class="btn btn-default">Đăng ký</button>
								</div>
							</div>
						</form:form>
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

	$('.newbtn').bind("click", function() {
		$('#pic').click();
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>