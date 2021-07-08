<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div data-ng-view="" class="ng-scope"><div id="main" role="main" block-ui="myBlockUI" ng-controller="memberController" ng-init="initializeController()" class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
    <!-- RIBBON -->
    <div id="ribbon">

        <span class="ribbon-button-alignment">
            <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="
                    <i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
                    <i class="fa fa-refresh"></i>
                </span>
        </span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>Home</li>
            <li>Thành viên</li>
            <li>Thêm mới thành viên</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- You can also add more buttons to the
                ribbon for further usability
                Example below:
        -->
        <span class="ribbon-button-alignment pull-right">
            <a href="/admin/account" class="btn btn-default btn-sm">Trở về</a>
        </span>
    </div>
    <!-- END RIBBON -->
    <!-- MAIN CONTENT -->
    <div id="content">
<!--         <div class="row"> -->
<!--             <article class="col-md-12"> -->
<!--                 <div ng-show="IsError" class="alert alert-danger fade in ng-hide"> -->
<!--                     <button data-dismiss="alert" class="close"></button> -->
<!--                     <i class="fa-fw fa fa-times"></i> -->
<!--                     <strong>Error!</strong> -->
<!--                     <span ng-bind-html="Message" class="ng-binding"></span> -->
<!--                 </div> -->
<!--                 <div ng-show="IsSuccess" class="alert alert-success fade in ng-hide"> -->
<!--                     <button data-dismiss="alert" class="close"></button> -->
<!--                     <i class="fa-fw fa fa-check"></i> -->
<!--                     <strong>Success!</strong> Cập nhật thành công. -->
<!--                 </div> -->
<!--                 <div ng-show="InValid" class="alert alert-danger fade in ng-hide"> -->
<!--                     <button data-dismiss="alert" class="close"></button> -->
<!--                     <i class="fa-fw fa fa-times"></i> -->
<!--                     <strong>Error!</strong> -->
<!--                     <span ng-bind-html="Message" class="ng-binding"></span> -->
<!--                 </div> -->
<!--             </article> -->
<!--         </div> -->
        <div class="row">
            <div class="col-sm-12">
            	<form:form action="/admin/account/create" modelAttribute="user" enctype="multipart/form-data">
            		<div class="well form-horizontal">
	                    <h2>Thông tin tài khoản</h2>
	                    <hr>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Tài khoản</label>
	                        <div class="col-md-8">
	                        	<form:input path="username" cssClass="form-control ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Email</label>
	                        <div class="col-md-8">
	                        	<form:input path="email" cssClass="form-control ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Mật khẩu</label>
	                        <div class="col-md-8">
	                        	<form:password path="password" cssClass="form-control ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Nhắc lại mật khẩu</label>
	                        <div class="col-md-8">
	                            <input type="password" name="cpassword" class="form-control ng-pristine ng-untouched ng-valid">
	                        </div>
	                    </div>
	
	                    <h2>Thông tin cá nhân</h2>
	                    <hr>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Họ tên</label>
	                        <div class="col-md-8">
	                        	<form:input path="fullname" cssClass="form-control ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Avatar</label>
	                        <div class="col-md-8">
	                            <img class="img-upload" src="${user.photo}">
	                            <input type="file" name="photo_file">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-3 control-label">Trạng thái</label>
	                        <div class="col-md-8">
	                        	<form:radiobuttons items="${activates}" path="activated" delimiter="" cssClass="ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                     <div class="form-group">
	                        <label class="col-md-3 control-label">Phân quyền</label>
	                        <div class="col-md-8">
	                        	<form:radiobuttons items="${admins}" path="admin" delimiter="" cssClass="ng-pristine ng-untouched ng-valid"/>
	                        </div>
	                    </div>
	                    <div class="form-actions">
	                        <div class="row">
	                            <div class="col-md-12">
	                                <button formaction="${userId==null?'/admin/account/save/false':'/admin/account/update/false'}" class="btn btn-primary" data-title="save"><i class="fa fa-save"></i> Lưu</button>
	                                <button formaction="${userId==null?'/admin/account/save/true':'/admin/account/update/true'}" class="btn btn-primary" data-title="save"><i class="fa fa-plus"></i> Lưu &amp; Quay lại</button>
	                                <a href="/admin/account" class="btn btn-default">Trở về</a>
	                            </div>
	                        </div>
	                    </div>
                	</div>
            	</form:form>
            </div>
        </div>
    </div>
</div>
</div>