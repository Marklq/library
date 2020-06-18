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

    <style type="text/css">
        a {
            cursor: pointer;
        }
    </style>

</head>
<body>
<br>

<!--  显示列表 -->

<form id="listform">
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder">管理员信息</strong>
            <strong>
                <a class="float-right text-center text"
                   onclick="history.back(-1);">返回</a>
            </strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main ring-hover"
                       href="${pageContext.request.contextPath}/manager/findAll.do">所有管理员</a>
                </li>
                <li>
                    <a class="button border-main icon-plus-square-o ring-hover"
                       href="${pageContext.request.contextPath}/pages/master/addManager.jsp">新增管理员</a>
                </li>
                <li class="float-right">
                    <input type="text" onkeydown="Search()" placeholder="请输入用户名" id="username" class="input border-gray"
                           style="width:250px; line-height:17px;display:inline-block"/>
                    <a id="search" class="button border-main icon-search ring-hover" onclick="submitSearch()"> 搜索</a>
                    <%--<button class="bg-green-light button-group-justified">搜索</button>--%>
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
        <th width="20%">联系方式</th>
        <th width="10%">性别</th>
        <th width="10%">注册时间</th>
        <th width="20%">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${pageInfo.list}" var="manager">
            <tr>
                <td>${manager.username}</td>
                <td>${manager.password}</td>
                <td>${manager.phoneNumber}</td>
                <td>${manager.sexStr}</td>
                <td>${manager.reg_timeStr}</td>
                <td class="text-center">
                    <a class="button border-main "
                       href="${pageContext.request.contextPath}/manager/modifyPage.do?id=${manager.id}">
                        <span class="icon-edit"></span>修改
                    </a>
                    <a class="button border-red margin-large-left"
                       href="${pageContext.request.contextPath}/manager/deleteManager.do?id=${manager.id}">
                            <%--onclick="deleteManagerConfirm('${manager.id}')">--%>
                        <span class="icon-trash-o"></span>删除
                    </a>
                </td>
            </tr>
        </c:forEach>
    </div>
</table>

<%--提示信息--%>
<c:if test="${pageInfo.total==0}">
    <p class=" text-large text-center text-red">
        没有此用户！！
    </p>
</c:if>

</body>
<script language="JavaScript">


    $("#search").click(function () {
        //获取搜索框中的数据
        var username = $("#username").val();
        if (username == "") {
            window.alert("请输入信息");
        } else {
            window.location.href = "${pageContext.request.contextPath }/manager/findByName.do?username=" + username + "&page=1&size=10";
        }
    });

    // 删除二次确认
    function deleteManagerConfirm(managerId) {
        if (window.confirm("确认删除吗？")) {
            window.location.href = "${pageContext.request.contextPath}/manager/deleteManager.do?id=" + managerId;
            window.location.reload();
            window.alert("删除成功！");
        }
    }


</script>
</html>