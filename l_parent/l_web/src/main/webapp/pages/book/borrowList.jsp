<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--  bs 需要的一个必须写的标签   -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Insert title here</title>
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
            <strong class="icon-reorder"> 借阅记录</strong>
            <strong>
                <a class="float-right text-center text"
                   onclick="history.back(-1);">返回</a>
            </strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main ring-hover"
                       href="${pageContext.request.contextPath}/book/findAllRecords.do">所有记录</a>
                </li>
                <li>
                    <a class="button border-main icon-plus-square-o ring-hover"
                       href="${pageContext.request.contextPath}/pages/book/add.jsp">新增借书记录</a>
                </li>
                <li class="float-right">
                    <input type="text" onkeydown="Search()" placeholder="请输入书名" id="bookName" class="input border-gray"
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
        <th width="10%">书籍编号</th>
        <th width="10%">学号</th>
        <th width="15%">借书时间</th>
        <th width="15%">应还书时间</th>
        <th width="15%">还书时间</th>
        <th width="15%">是否已还</th>
        <th width="20%">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${pageInfo.list}" var="record">
            <tr>
                <td>${record.book_Num}</td>
                <td>${record.student_id}</td>
                <td>${record.borrow_timeStr}</td>
                <td>${record.should_r_timeStr}</td>
                <td>${record.return_timeStr}</td>
                <td class='<c:if test="${record.is_return==0}"> alert-red</c:if>'>${record.is_returnStr}</td>
                <td class="text-center">
                    <a class="button border-main  "
                       href="${pageContext.request.contextPath}/book/modifyRecords.do?bookId=${book.book_id}">
                        <span class="icon-edit"></span> 修改
                    </a>
                </td>
            </tr>
        </c:forEach>
    </div>
</table>
<%--提示信息--%>
<c:if test="${pageInfo.total==0}">
    <p class=" text-large text-center text-red">
        目前没有此类书籍！！
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
                <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=1&size=${pageInfo.pageSize}"
                   aria-label="Previous">首页</a></li>
            <li <c:if test="${pageInfo.pageNum==1}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
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
                            <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
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
                            <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                        </li>
                    </c:forEach>
                </c:when>
            </c:choose>
            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>
            </li>
            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled" </c:if>>
                <a href="${pageContext.request.contextPath}/book/findAllRecords.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                   aria-label="Next">尾页</a></li>
        </ul>
    </div>

</div>
</body>

<script language="JavaScript">

    $(function () {
        $("#search").click(function () {
            //获取搜索框中的数据
            var bookName = $("#bookName").val();
            if (bookName == "") {
                window.alert("请输入搜索信息");
            } else {// window.alert(bookName);
                window.location.href = "${pageContext.request.contextPath }/book/findByName.do?bookName=" + bookName + "&page=1&size=10";
            }
        });
    });

    // 删除二次确认
    function deleteConfirm(id) {
        if (confirm("确认删除吗？")) {
            // alert(bookId);
            window.location.href = "${pageContext.request.contextPath}/book/deleteRecord.do?id=" + id;
            window.reload();
            window.alert("删除成功");
        }
    }

</script>
</html>