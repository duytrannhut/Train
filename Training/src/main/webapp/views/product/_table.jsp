<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Tên sản phẩm</th>
      <th scope="col">Đơn giá</th>
      <th scope="col">Số lượng</th>
      <th scope="col">Danh mục</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  	<c:set var="i" value="0"/>
  	<c:forEach var="item" items="${items}">
    <tr>
      <th scope="row">${i=i+1}</th>
      <td>${item.name}</td>
      <td><fmt:formatNumber value="${item.price}" pattern="###,###,###"/></td>
      <td>${item.quantity}</td>
      <td>${item.category.name}</td>
      <td><a href="/product/edit/${item.id}">Edit</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>