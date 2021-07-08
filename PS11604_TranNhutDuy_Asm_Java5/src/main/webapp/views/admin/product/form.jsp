<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
#pic {
	display: none;
}

.newbtn {
	cursor: pointer;
}

#blah {
	border:1px solid gray;
	max-width: 180px;
	height: 180px;
	margin-top: 5px;
}
</style>
<div class="ng-scope">
	<div id="main" role="main" block-ui="myBlockUI"
		ng-controller="productController" ng-init="initializeController()"
		class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
		<!-- RIBBON -->
		<div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
				class="btn btn-ribbon" data-action="resetWidgets"
				data-title="refresh" rel="tooltip" data-placement="bottom"
				data-original-title="
                &lt;i class=&#39;text-warning fa fa-warning&#39;&gt;&lt;/i&gt; Warning! This will reset all your widget settings."
				data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Sản phẩm</li>
				<li>Thêm mới sản phẩm</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- You can also add more buttons to the
                ribbon for further usability
                Example below:
        -->
			<span class="ribbon-button-alignment pull-right"> <a
				href="/admin/product" class="btn btn-default btn-sm">Trở về</a>
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
						<div data-widget-editbutton="false"
							data-widget-colorbutton="false" id="wid-id-0"
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
								<span class="widget-icon"> <i class="fa fa-edit"></i>
								</span>
								<h2>Thông tin sản phẩm</h2>
								<span class="jarviswidget-loader"><i
									class="fa fa-refresh fa-spin"></i></span>
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
									<form:form action="/admin/product/create" modelAttribute="item"
										enctype="multipart/form-data"
										cssClass="smart-form ng-valid ng-valid-max ng-valid-min ng-valid-parse ng-pristine">
										<fieldset>
											<div class="section col-xs-12 ">
												<div class="col-md-3 ">
													<h4>Thông tin sản phẩm</h4>
													<p>Nhập tên, giá sản phẩm</p>
												</div>
												<div class="col-md-9 col-xs-12">
													<div class="row">
														<section class="col col-9">
															<section>
																<label class="label">Tên sản phẩm</label> <label
																	class="input"> <form:hidden path="id" /> <form:input
																		path="name"
																		placeholder="ví dụ : Iphone 6s , Samsung S6"
																		cssClass="ng-pristine ng-untouched ng-valid" />
																</label>
															</section>
															<section>
																<label class="label">Giá</label> <label class="input">
																	<form:input path="price"
																		cssClass="ng-pristine ng-untouched ng-valid ng-valid-max ng-valid-min" />
																</label>
															</section>
														</section>
														<section class="col col-3">
															<label class="newbtn label">Hình ảnh <img id="blah"
																src="${item.image!=null?item.image:'http://placehold.it/180x180'}">
																<input id="pic" class='pis' onchange="readURL(this);"
																type="file" name="photo_file">
															</label>
														</section>
													</div>
												</div>
											</div>
										</fieldset>
										<fieldset>
											<div class="section col-xs-12 ">
												<div class="col-md-3 ">
													<h4>Nhóm sản phẩm</h4>
													<p>Phân loại sản phẩm theo nhóm để quản lý</p>
												</div>
												<div class="col-md-9 col-xs-12">
													<section>
														<label class="label">Nhóm sản phẩm</label> <label
															class="select"> <form:select path="category"
																cssClass="ng-pristine ng-untouched ng-valid">
																<form:option value="">Chọn nhóm sản phẩm</form:option>
																<form:options items="${categories}" itemLabel="name" />
															</form:select> <i></i>
														</label>
													</section>
													<div class="table-choose-collections">
														<table
															class="table no-padding margin-bottom-10 margin-top-10">
															<tbody>
																<!-- ngRepeat: item in ProductOtherGroups -->
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</fieldset>
										<fieldset>
											<div class="section col-xs-12 ">
												<div class="col-md-3 ">
													<h4>Trạng thái</h4>
													<p>Bạn có thể ngưng dùng sản phẩm khỏi hệ thống</p>
												</div>
												<div class="col-md-9 col-xs-12">
													<section>
														<label class="label">Ngưng dùng</label>
														<div class="row">
															<div class="col col-4">
																<label class=""> <form:radiobuttons
																		items="${availables}" path="available" delimiter="" />
																	<i></i></label>
															</div>
														</div>
													</section>
												</div>
											</div>
										</fieldset>
										<footer>
											<a href="/admin/product" class="btn btn-default">Trở về</a>
											<button class="btn btn-primary"
												formaction="${id==null?'/admin/product/save/true':'/admin/product/update/true'}">Lưu
												&amp; Quay lại</button>
											<button class="btn btn-default"
												formaction="${id==null?'/admin/product/save/false':'/admin/product/update/false'}">Lưu</button>
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
		<div class="modal fade" id="modalImgURL" tabindex="-1" role="dialog"
			aria-labelledby="modalImgURLLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalImgURLLabel">Thêm mới hình
							ảnh từ đường dẫn</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label class=""> Điền đường dẫn hình ảnh</label> <input
								type="text" placeholder="http://acb.com"
								class="form-control ng-pristine ng-untouched ng-valid"
								ng-model="ImgURL">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Hủy</button>
						<button type="button" class="btn btn-primary"
							ng-click="addImageFromURL()">Lưu</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<script>
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