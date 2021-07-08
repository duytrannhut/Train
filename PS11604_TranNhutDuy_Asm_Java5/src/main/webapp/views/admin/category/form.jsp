<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="ng-scope">
            <div id="main" role="main" block-ui="myBlockUI" ng-controller="productController"
                ng-init="initializeController()" class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
                <!-- RIBBON -->
                <div id="ribbon">

                    <span class="ribbon-button-alignment">
                        <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"
                            rel="tooltip" data-placement="bottom"
                            data-original-title="
                &lt;i class=&#39;text-warning fa fa-warning&#39;&gt;&lt;/i&gt; Warning! This will reset all your widget settings." data-html="true">
                            <i class="fa fa-refresh"></i>
                        </span>
                    </span>

                    <!-- breadcrumb -->
                    <ol class="breadcrumb">
                        <li>Home</li>
                        <li>Sản phẩm</li>
                        <li>Thêm mới danh mục</li>
                    </ol>
                    <!-- end breadcrumb -->
                    <!-- You can also add more buttons to the
                ribbon for further usability
                Example below:
        -->
                    <span class="ribbon-button-alignment pull-right">
                        <a href="/admin/category" class="btn btn-default btn-sm">Trở về</a>
                    </span>
                </div>
                <!-- END RIBBON -->
                <!-- MAIN CONTENT -->
                <div id="content">
                    <div class="row">
                        <article class="col-md-12">
                            <!-- ngIf: IsError -->
                            <!-- ngIf: IsSuccess -->
                            <!-- ngIf: InValid -->
                        </article>
                    </div>
                    <!-- widget grid -->
                    <section class="" id="widget-grid">
                        <!-- row -->
                        <div class="row">
                            <!-- NEW WIDGET START -->
                            <article class="col-sm-12 col-md-12 col-lg-12">

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div data-widget-editbutton="false" data-widget-colorbutton="false" id="wid-id-0"
                                    class="jarviswidget jarviswidget-sortable" role="widget">
                                    <!-- widget options:
                            usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                            data-widget-colorbutton="false"
                            data-widget-editbutton="false"
                            data-widget-togglebutton="false"
                            data-widget-deletebutton="false"
                            data-widget-fullscreenbutton="false"
                            data-widget-custombutton="false"
                            data-widget-collapsed="true"
                            data-widget-sortable="false"

                        -->
                                    <header role="heading">
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Thông tin danh mục sản phẩm</h2>
                                        <span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span>
                                    </header>
                                    <!-- widget div-->
                                    <div role="content">

                                        <!-- widget edit box -->
                                        <div class="jarviswidget-editbox">
                                            <!-- This area used as dropdown edit box -->

                                        </div>
                                        <!-- end widget edit box -->
                                        <!-- widget content -->
                                        <div class="widget-body no-padding">
                                            <!-- Error states for elements -->
                                            <form:form action="/admin/category/create" modelAttribute="item" cssClass="smart-form ng-valid ng-valid-max ng-valid-min ng-valid-parse ng-pristine">
                                            	<fieldset>
                                                    <div class="section col-xs-12 ">
                                                        <div class="col-md-3 ">
                                                            <h4>Thông tin danh mục</h4>
                                                            <p>Nhập tên danh mục</p>
                                                        </div>
                                                        <div class="col-md-9 col-xs-12">
                                                        	<section>
                                                        		<label class="label">Mã danh mục</label>

                                                                <label class="input">
                                                                	<form:input path="id" cssClass="ng-pristine ng-untouched ng-valid"/>
                                                                </label>
                                                        	</section>
                                                            <section>
                                                                <label class="label">Tên danh mục</label>

                                                                <label class="input">
                                                                	<form:input path="name" cssClass="ng-pristine ng-untouched ng-valid"/>
                                                                </label>
                                                            </section>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <footer>
                                                    <a href="/admin/category"
                                                        class="btn btn-default">Trở về</a>
                                                    <button class="btn btn-primary" formaction="${id==null?'/admin/category/save/true':'/admin/category/update/true'}">Lưu &amp; Quay lại</button>
                                                    <button class="btn btn-default" formaction="${id==null?'/admin/category/save/false':'/admin/category/update/false'}">Lưu</button>
                                                </footer>
                                            </form:form>
                                            <!--/ Error states for elements -->

                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>
                            <!-- WIDGET END -->
                        </div>
                        <!-- end row -->
                    </section>
                    <!-- end widget grid -->
                </div>
                <!-- END MAIN CONTENT -->
                <!-- Modal -->
                <div class="modal fade" id="modalImgURL" tabindex="-1" role="dialog" aria-labelledby="modalImgURLLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="modalImgURLLabel">Thêm mới hình ảnh từ đường dẫn</h4>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label class=""> Điền đường dẫn hình ảnh</label>
                                    <input type="text" placeholder="http://acb.com"
                                        class="form-control ng-pristine ng-untouched ng-valid" ng-model="ImgURL">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Hủy
                                </button>
                                <button type="button" class="btn btn-primary" ng-click="addImageFromURL()">
                                    Lưu
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
</div>