<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>Danh mục</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
          crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/eaa729be91.js" crossorigin="anonymous"></script>
      </head>

      <body>
        <div class="container">
          <table class="table mt-3 table-bordered">
            <thead class="thead-dark">
              <tr>
                <th style="width: 80px;" class="text-center">ID</th>
                <th>Tên sản phẩm</th>
                <th class="w-25">Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${items}">
                <tr>
                  <td class="text-center">${item.id }</td>
                  <td>${item.name }</td>
                  <td class="text-center"><a href="/category/edit/${item.id}"><i class="far fa-edit"></i></a></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>

          <div class="card">
            <img src="https://pdp.edu.vn/wp-content/uploads/2021/02/tai-background-anh-sang-dep-nhat.jpg" style="height: 4cm;" alt="...">
            <div class="card-body">
              <form:form action="/category/create" modelAttribute="item">
            <div class="form-group">
              <label for="formGroupExampleInput">Mã sản phẩm</label>
              <form:input type="text" path="id" class="form-control" id="formGroupExampleInput" />
            </div>
            <div class="form-group">
              <label for="formGroupExampleInput2">Tên sản phẩm</label>
              <form:input type="text" path="name" class="form-control" id="formGroupExampleInput2" />
            </div>
            <button type="submit" class="btn btn-primary" formaction="/category/create">Thêm</button>
            <button type="submit" class="btn btn-primary" formaction="/category/update">Sữa</button>
            <a href="/category/delete/${item.id}" class="btn btn-dark">Xóa</a>
            <a href="/train/category" class="btn btn-success">reset</a>
          </form:form>
            </div>
          </div>          
        </div>


      </body>

      </html>