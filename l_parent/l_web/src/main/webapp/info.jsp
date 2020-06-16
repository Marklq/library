<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="box-body">

    <!-- 数据表格 -->
    <div class="table-box">

        <!--工具栏-->
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" title="新建"
                            onclick=" window.location.href = '/pages/product/product-add.jsp'">
                        <i class="fa fa-plus"></i>新建商品
                    </button>
                    <button onclick="window.location.reload();" type="button" class="btn btn-primary"
                            title="刷新">
                        <i class="fa fa-refresh"></i> 刷新页面
                    </button>
                </div>
            </div>
        </div>
        <%--搜索--%>
        <div style="width: 260px;" class="box-tools pull-right">
            <div class="input-group has-feedback">
                <input type="text" id="productName" class="form-control "
                       placeholder="请输入产品名称" onkeydown="submit()">
                <span class="input-group-btn">
                                    <button onclick="buttonSubmit()" class="btn btn-primary">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
            </div>
        </div>
        <!--工具栏/-->

        <!--数据列表-->
        <table id="dataList"
               class="table table-bordered table-striped table-hover dataTable">
            <thead>
            <tr>
                <th class="sorting_asc">ID</th>
                <th class="sorting_desc">书名</th>
                <th class="sorting_asc sorting_asc_disabled">作者</th>
                <th class="sorting_desc sorting_desc_disabled">出版社</th>
                <th class="sorting">出版日期</th>
                <th class="text-center sorting">被借次数</th>
                <th class="sorting">书籍类型</th>
            </tr>
            </thead>
            <tbody>


            <c:forEach items="${bookList}" var="book">
                <tr>
                    <td class="ID">${book.book_Id}</td>
                    <td>${book.book_name}</td>
                    <td>${book.author }</td>
                    <td>${book.press}</td>
                    <td>${book.price}</td>
                    <td>${book.publish_date}</td>
                    <td>${book.is_borrow}</td>
                    <td>${book.book_type}</td>
                    <td class="text-center">
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="window.location.href='${pageContext.request.contextPath}/orders/findOrdersByProductId.do?id=${product.id}&page=1&size=5'">
                            订单
                        </button>
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="deleteProduct(${product.id})">删除
                        </button>
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="window.location.href='${pageContext.request.contextPath}/product/modifyPage.do?id=${product.id}'">
                            修改
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <!--
        </table>
        <!--数据列表/-->

        </table>
    </div>
    <!-- 数据表格 /-->

    <p class="text-justify text-red text-bold text-center pager">
        <c:if test="${pageInfo.total==0}">
            目前没有与此商品信息!或是商品信息已被删除
        </c:if>
    </p>

</div>

</body>
</html>