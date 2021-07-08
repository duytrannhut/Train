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
				<jsp:include page="/views/site/account/common/menu_editprofile.jsp"/>
			</div>
			<div class="col-md-9">

				<div class="breadcrumb clearfix">
					<ul>
						<li itemtype="http://shema.org/Breadcrumb" itemscope=""
							class="home"><a title="Đến trang chủ" href="/"
							itemprop="url"><span itemprop="title">Trang chủ</span></a></li>
						<li class="icon-li"><strong>Thông tin tài khoản</strong></li>
					</ul>
				</div>
				<script type="text/javascript">
					$(".link-site-more").hover(function() {
						$(this).find(".s-c-n").show();
					}, function() {
						$(this).find(".s-c-n").hide();
					});
				</script>
				<div class="comunication-content clearfix ng-scope"
					ng-controller="accountController"
					ng-init="initPersonalController()">
					<h1 class="title">
						<span>Thông tin tài khoản</span>
					</h1>
					<jsp:include page="/views/site/account/common/message.jsp"></jsp:include>
					<div
						class="col-md-8 col-md-offset-2 col-xs-12 col-sm-12 col-xs-offset-0 col-sm-offset-0">
						<form:form 
							cssClass="form-horizontal ng-pristine ng-valid ng-valid-required" 
							action="/account/edit-profile" method="post" modelAttribute="user" enctype="multipart/form-data">
							<h2>Thông tin tài khoản</h2>
							<div class="form-group">
								<label for="Email" class="col-sm-3 control-label">Email</label>
								<div class="col-sm-9">
									<label class="control-label ng-binding">${user.email}</label>
								</div>
								<form:hidden path="username"/>
								<form:hidden path="photo"/>
								<form:hidden path="email"/>
							</div>
							<div class="form-group">
								<label for="Email" class="col-sm-3 control-label">Mật
									khẩu</label>
								<div class="col-sm-9">
									<form:hidden path="password"/>
									<label class="control-label">***</label> <a
										href="/account/change-password"><i class="fa fa-edit"></i></a>
								</div>
							</div>
							<h2>Thông tin cá nhân</h2>
							<div class="form-group">
								<label for="Name" class="col-sm-3 control-label">Họ tên</label>
								<div class="col-sm-9">
									<form:input path="fullname" cssClass="form-control ng-pristine ng-untouched ng-valid ng-valid-required" required="true"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Hình ảnh</label>
								<div class="col-sm-9">
									<label class=newbtn> <img id="blah"
										src="${user.photo!=null?user.photo:'http://placehold.it/120x120'}"> <input id="pic"
										class='pis' onchange="readURL(this);" type="file" name="photo_file">
									</label>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<button type="submit" class="btn btn-default">Cập nhật</button>
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