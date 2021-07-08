<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:if test="${not empty message}">
	<div class="alert alert-success fade in">
		<button data-dismiss="alert" class="close"></button>
		<i class="fa-fw fa fa-check"></i> <strong>Success!</strong> ${message}
	</div>
</c:if>

<c:if test="${not empty error}">
	<div class="alert alert-danger fade in">
		<button data-dismiss="alert" class="close"></button>
		<i class="fa-fw fa fa-times"></i> <strong>Error!</strong> ${error}
	</div>
</c:if>