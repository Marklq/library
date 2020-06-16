<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--  bs 需要的一个必须写的标签   -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title> 主页面</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>

</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-green">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>后台管理中心</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green-light" href="index.jsp" target="_self"><span class="icon-home"></span>前台首页</a>
        <a href="#" class="button button-little bg-green-light"><span class="icon-wrench"></span>清除缓存</a>
        <a class="button button-little bg-red-light" href="login.html"><span class="icon-power-off"></span>退出登录</a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>图书管理</h2>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath}/book/findAll.do" target="right"><span
                class="icon-caret-right"></span>图书信息</a></li>
        <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>预期未还</a></li>
        <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>借阅排行</a></li>
        <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
        <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>用户管理</h2>
    <ul>
        <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加管理</a></li>
        <li><a href="list.html" target="right"><span class="icon-caret-right"></span>添加用户</a></li>
        <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>用户管理</h2>
    <ul>
        <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加管理</a></li>
        <li><a href="list.html" target="right"><span class="icon-caret-right"></span>添加用户</a></li>
        <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
</div>

<%--控制左边子按钮展开--%>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <%--   <li><a href="#" target="" class="icon-home"> 图书管理</a></li>--%>
    <li class="icon-home"><a href="index.jsp" id="a_leader_txt">首页</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="pages/welcome.jsp"
            name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>