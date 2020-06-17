<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--  bs 需要的一个必须写的标签   -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>

</head>
<body>
<br>

<!--  显示列表 -->

<form id="listform">
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder">超级管理信息</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main ring-hover"
                       href="${pageContext.request.contextPath}/master/findAll.do">所有管理员</a>
                </li>
            </ul>
        </div>
    </div>
</form>


<!--  表格显示内容 -->
<table class="table table-hover text-center">
    <tr>
        <th width="20%">用户名</th>
        <th width="20%">用户密码</th>
        <th width="10%">真实姓名</th>
        <th width="10%">性别</th>
        <th width="20%">联系方式</th>
        <th width="10%">注册时间</th>
        <th width="10%">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${pageInfo.list}" var="admin">
            <tr>
                <td>${admin.username}</td>
                <td><input class="input text-center" type="password" value="${admin.password}" readonly="readonly"></td>
                <td>${admin.truename}</td>
                <td>${admin.sex}</td>
                <td>${admin.phoneNumber}</td>
                <td>${admin.reg_timeStr}</td>
                <td class="text-center">
                    <a style="cursor: pointer" class="button border-red margin-large-left shake-hover" onclick="check()">
                        <span class="icon-trash-o"></span> 删除
                    </a>
                </td>
            </tr>
        </c:forEach>
    </div>
</table>

</body>

<script language="JavaScript">
    function check() {
        window.alert("没有权限");
    }


</script>
</html>