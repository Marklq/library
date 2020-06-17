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
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>

</head>
<body>
<br>

<!--  显示列表 -->

<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href=""
                                                                               style="float:right; display:none;">添加字段</a>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="add.jsp"> 增加</a></li>
                <li>搜索：</li>

                <if condition="$iscid eq 1">
                    <li>
                        <select name="cid" class="input" style="width:100px; line-height:17px;"
                                onchange="changesearch()">
                            <option value="">请选择分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                            <option value="">产品分类</option>
                        </select>
                    </li>
                </if>
                <li>
                    <input type="text" onkeydown="Search()" placeholder="请输入书名" id="bookName" class="input border-gray"
                           style="width:250px; line-height:17px;display:inline-block"/>
                    <a id="search" class="button border-main icon-search" onclick="submitSearch()"> 搜索</a>
                    <%--<button class="bg-green-light button-group-justified">搜索</button>--%>
                </li>
            </ul>
        </div>

    </div>
</form>


<!--  表格显示内容 -->
<table class="table table-hover text-center">
    <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th>图书名称</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
        <th width="10%">出版时间</th>
        <th width="10%">是否出借</th>
        <th>图书类型</th>
        <th width="310">操作</th>
    </tr>
    <div class="button-group">
        <!--  修改  -->
        <c:forEach items="${bookList}" var="b">
            <tr>
                <td class="ID">${b.book_Id}</td>
                <td>${book.book_name}</td>
                <td class="">${book.author }</td>
                <td>${book.press}</td>
                <td>${book.price}</td>
                <td>${book.publish_dateStr}</td>
                <td class='<c:if test="${book.is_borrow==0}"> alert-red</c:if>'>${book.is_borrowStr}</td>
                <td>${book.book_typeStr}</td>
                <td class="text-center">
                    <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                    <a class="button border-red" href="javascript:void(0)"
                       onclick="delBook('${book.book_Id }','${book.book_name }')"><span class="icon-trash-o"></span> 删除</a>
                </td>
            </tr>
        </c:forEach>


    </div>
</table>

</body>

<script language="JavaScript">

    $(function () {


        $("#search").click(function () {
            //获取搜索框中的数据
            var bookName = $("#bookName").val();
            // window.alert(bookName);
            window.location.href = "${pageContext.request.contextPath }/book/findByName.do?bookName=" + bookName;

        });

        $("#bookName").bind("keypress", function () {
            var keyCode = event.keyCode;
            if (keyCode == 13) {
                // alert(keyCode);
                var bookName = $("#bookName").val();
                // window.alert(bookName);
                location.href = "${pageContext.request.contextPath }/book/findByName.do?bookName=" + bookName;
                <%--var str = "${pageContext.request.contextPath }/book/findByName.do?bookName=" + bookName;--%>
                // alert(str);
                // $("#bookName").val().clear();
            }
        });

    });
    /*    function Search() {
            var keyCode = event.keyCode;
            var bookName = $("#bookName").val();
            if (keyCode == 13) {
                if (bookName = "") {
                    window.alert("请输入");
                } else {
                    window.location.href = "${pageContext.request.contextPath }/book/findByName.do?bookName=" + bookName;
            }
        }
    }

    //提交搜索信息
    function submit() {
        var keyCode = event.keyCode;
        var name = $("#productName").val();

        if (keyCode == 13) {
            // alert(name);
            if (name == "") {
                window.alert("请输入搜索信息");
            } else {
                window.location.href = "${pageContext.request.contextPath}/product/findProductByName.do?name=" + name + "&size=10";
            }
        }
    }

    function buttonSubmit() {
        var name = $("#productName").val();
        if (name == '') {
            window.alert("请输入搜索信息");
        } else {
            window.location.href = "${pageContext.request.contextPath}/product/findProductByName.do?name=" + name + "&size=10";
        }

    }*/


</script>
</html>