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
            <strong class="icon-reorder">读者信息</strong>
            <strong>
                <a class="float-right text-center text"
                   onclick="history.back(-1);">返回</a>
            </strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main ring-hover"
                       href="${pageContext.request.contextPath}/reader/findAll.do">所有读者</a>
                </li>
                <li>
                    <a class="button border-main icon-plus-square-o ring-hover"
                       href="${pageContext.request.contextPath}/pages/reader/addReader.jsp">新增读者</a>
                </li>
                <li class="float-right">
                    <input type="text" placeholder="请输入真实姓名" id="username" class="input border-gray"
                           style="width:250px; line-height:17px;display:inline-block"/>
                    <a id="search" class="button border-main icon-search ring-hover">搜索</a>
                    <%--<button class="bg-green-light button-group-justified">搜索</button>--%>
                </li>
            </ul>
        </div>
    </div>
</form>


<!--  表格显示内容 -->
<table class="table table-hover text-center">
    <tr>
        <th width="10%">用户名</th>
        <th width="10%">用户密码</th>
        <th width="10%">联系方式</th>
        <th width="10%">昵称</th>
        <th width="10%">学号</th>
        <th width="10%">真实姓名</th>
        <th width="10%">性别</th>
        <th width="10%">注册时间</th>
        <th width="20%">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${pageInfo.list}" var="reader">
            <tr>
                <td>${reader.username}</td>
                <td>${reader.password}</td>
                <td>${reader.phoneNum}</td>
                <td>${reader.nickname}</td>
                <td>${reader.student_id}</td>
                <td>${reader.trueName}</td>
                <td>${reader.sexStr}</td>
                <td>${reader.reg_timeStr}</td>
                <td class="text-center">
                    <a class="button border-main"
                       href="${pageContext.request.contextPath}/reader/modifyPage.do?id=${reader.id}">
                        <span class="icon-edit"></span>修改
                    </a>
                    <a class="button border-red margin-large-left"
                       href="${pageContext.request.contextPath}/reader/deleteReader.do?id=${reader.id}">
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

<%--分页--%>
<div class="box-footer border-bottom border-blue">
    <div class="float-left margin-big">
        <div class=" text-big">
            总共<b class="text-red">${pageInfo.pages}</b>页，
            每页展示<b class="text-red">${pageInfo.pageSize}</b>条数据，
            共<b class="text-red">${pageInfo.total}</b> 条数据。
        </div>
    </div>

    <div class="box-tools float-right margin-big">
        <ul class="pagination">
            <li <c:if test="${pageInfo.pageNum==1}">class="disabled bg-inverse" </c:if>>
                <a href="${pageContext.request.contextPath}/reader/findAll.do?page=1&size=${pageInfo.pageSize}"
                   aria-label="Previous">首页</a></li>
            <li <c:if test="${pageInfo.pageNum==1}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/reader/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
            </li>

            <c:choose>
                <c:when test="${pageInfo.pages>=5}">
                    <%--在页面展示出5条页码数--%>
                    <c:forEach
                            begin="${pageInfo.pageNum>=pageInfo.pages-4?pageInfo.pages-4:pageInfo.pageNum}"
                            end="${pageInfo.pageNum<=pageInfo.pages-4?pageInfo.pageNum+4:pageInfo.pages}"
                            var="pageNum">
                        <li
                            <%--显示当前选中的页数--%>
                                <c:if test="${pageInfo.pageNum == pageNum}">class="active" </c:if>
                        >
                            <a href="${pageContext.request.contextPath}/reader/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                        </li>
                    </c:forEach>
                </c:when>
                <%--数据过少，页码小于5页时--%>
                <c:when test="${pageInfo.pages<5}">
                    <%--在页面展示出5条页码数--%>
                    <c:forEach
                            begin="1"
                            end="${pageInfo.pages}"
                            var="pageNum">
                        <li
                            <%--显示当前选中的页数--%>
                                <c:if test="${pageInfo.pageNum == pageNum}">class="bg-blue" s</c:if>
                        >
                            <a href="${pageContext.request.contextPath}/reader/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                        </li>
                    </c:forEach>
                </c:when>
            </c:choose>
            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/reader/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>
            </li>
            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/reader/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                   aria-label="Next">尾页</a></li>
        </ul>
    </div>

</div>

</body>
<script language="JavaScript">


    $("#search").click(function () {
        //获取搜索框中的数据
        var trueName = $("#username").val();
        if (trueName == "") {
            window.alert("请输入");
        } else {
            window.location.href = "${pageContext.request.contextPath }/reader/findByName.do?trueName=" + trueName + "&page=1&size=10";
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