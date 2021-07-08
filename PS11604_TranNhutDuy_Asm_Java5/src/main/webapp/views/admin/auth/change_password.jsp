<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="main" role="main" block-ui="myBlockUI"
	ng-controller="userLoginController" ng-init="initializeController()"
	class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
	<!-- RIBBON -->
	<div id="ribbon">

		<span class="ribbon-button-alignment"> <span id="refresh"
			class="btn btn-ribbon" data-action="resetWidgets"
			data-title="refresh" rel="tooltip" data-placement="bottom"
			data-original-title="
                <i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
			data-html="true"> <i class="fa fa-refresh"></i>
		</span>
		</span>

		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li>Home</li>
			<li>Tài khoản</li>
			<li>Thay đổi mật khẩu</li>
		</ol>
		<!-- end breadcrumb -->
		<!-- You can also add more buttons to the
                ribbon for further usability
                Example below:
        -->
	</div>
	<!-- END RIBBON -->
	<!-- MAIN CONTENT -->
	<div id="content">
		<div class="row">
			<div class="col-sm-12">
				<div class="well form-horizontal">
					<c:if test="${not empty message}">
						<div ng-show="IsSuccess"
							class="alert alert-success fade in ng-hide">
							<button data-dismiss="alert" class="close"></button>
							<i class="fa-fw fa fa-check"></i> <strong>Success!</strong>
							${message}.
						</div>
					</c:if>
					<c:if test="${not empty error}">
						<div ng-show="InValid" class="alert alert-danger fade in ng-hide">
							<button data-dismiss="alert" class="close"></button>
							<i class="fa-fw fa fa-times"></i> <strong>Error!</strong>
							${error}.<span ng-bind-html="Message" class="ng-binding"></span>
						</div>
					</c:if>
					<h2 class="margin-top-10">
						<i class="fa fa-th text-primary"></i> Thay đổi mật khẩu
					</h2>
					<hr>
					<form action="/admin/change-password" method="post">
						<div class="form-group">
							<label class="col-md-3 control-label">Mật khẩu cũ</label>
							<div class="col-md-8">
								<input type="password"
									class="form-control ng-pristine ng-untouched ng-valid"
									name="passwordOld" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Mật khẩu mới</label>
							<div class="col-md-8">
								<input type="password"
									class="form-control ng-pristine ng-untouched ng-valid"
									name="password" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Nhắc lại mật khẩu
								mới</label>
							<div class="col-md-8">
								<input type="password"
									class="form-control ng-pristine ng-untouched ng-valid"
									name="rePassword" autocomplete="off">
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-primary">
										<i class="fa fa-save"></i> Lưu
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
</div>