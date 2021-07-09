<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
	height: 210px;
	margin-top: 5px;
}
</style>
<form:form action="/product/ịndex" modelAttribute="item" enctype="multipart/form-data">
	<div class="row">
		<div class="col-10">
			<div class="form-group">
				<label>Tên sản phẩm:</label>
				<form:hidden path="id"/>
				<form:input path="name" cssClass="form-control" placeholder="Nhập tên sản phẩm"/>
			</div>
			<div class="form-group">
				<label>Đơn giá:</label>
				<form:input path="price" cssClass="form-control" placeholder="Nhập đơn giá"/>
			</div>
			<div class="form-group">
				<label>Số lượng:</label>
				<form:input path="quantity" cssClass="form-control" placeholder="Nhập số lượng"/>
			</div>
		</div>
		<div class="col-2">
			<c:set value="/upload/${item.image}" var="image"/>
			<label class="newbtn label">Hình ảnh <br>
				<img id="blah" src="${item.image!=null?image:'http://placehold.it/180x180'}">
				<input id="pic" class='pis' onchange="readURL(this);" type="file" name="photo_file">
			</label>
		</div>
	</div>
	<div class="form-group">
	    <label for="exampleInputEmail1">Danh mục</label>
	    <form:select path="category" cssClass="form-control">
	    	<form:options items="${categories}" itemLabel="name"/>
	    </form:select>
	 </div>
	 <button formaction="/product/save" class="btn btn-success">Thêm</button>
	 <button formaction="/product/update" class="btn btn-primary">Sửa</button>
	 <button formaction="/product/delete/${item.id}"class="btn btn-danger">Xóa</button>
	 <a href="/product/index" class="btn btn-dark">reset</a>
</form:form>
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