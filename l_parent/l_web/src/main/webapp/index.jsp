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

    <script language="JavaScript">
        // 显示时间
        function myTimer() {
            var date = new Date();
            // var month = date.getMonth();
            var time = date.toLocaleTimeString();

            var year = date.getFullYear();
            var month = date.getMonth();
            var day = date.getDate();
            var weekDay = date.getDay();

            document.getElementById("time").innerHTML = year + "年" + month + "月" + day + "日" + "星期" + weekDay + "  " + time;
        }

        setInterval(function () {
            myTimer()
        }, 1000);
    </script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-green">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>后台管理中心</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green-light" href="index.jsp" target="_self"><span class="icon-home"></span>后台首页</a>
        <a href="#" class="button button-little bg-green-light"><span class="icon-wrench"></span>清除缓存</a>
        <a class="button button-little bg-red-light" href="login.html"><span class="icon-power-off"></span>退出登录</a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-book"></span>书 籍 管 理</h2>
    <ul style="display:block">
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/book/findAll.do" target="right">
                <span class="icon-caret-right"></span>书籍信息
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/./pages/book/add.jsp" target="right">
                <span class="icon-caret-right"></span>添加书籍
            </a>
        </li>
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/book/borrowTimes.do" target="right">
                <span class="icon-caret-right"></span>借阅排行
            </a>
        </li>
        <li><a onclick="loading()" href="adv.html" target="right"><span class="icon-caret-right"></span>预期未还</a></li>
        <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
    </ul>
    <h2><span class="icon-user"></span> 用 户 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/master/findAll.do" target="right">
                <span class="icon-caret-right"></span>超级管理员
            </a>
        </li>
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/manager/findAll.do" target="right">
                <span class="icon-caret-right"></span>管理员信息
            </a>
        </li>
        <li>
            <a href="pages/master/addManager.jsp" target="right">
                <span class="icon-caret-right"></span>添加管理员
            </a>
        </li>
    </ul>
    <h2><span class="icon-users"></span>读 者 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/manager/findAll.do" target="right">
                <span class="icon-caret-right"></span>读者信息
            </a>
        </li>
        <li>
            <a href="pages/master/addManager.jsp" target="right">
                <span class="icon-caret-right"></span>添加读者
            </a>
        </li>
    </ul>
</div>

<ul class="bread">
    <li class="icon-home"><b id="a_leader_txt">首页</b></li>
    <li><b>当前时间：</b><strong id="time"></strong></li>
</ul>

<%--右边小窗口--%>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="pages/common/welcome.jsp"
            name="right" width="100%" height="99%"></iframe>
</div>

<div id="loading" style="position: absolute;display: none" class="admin">
    <iframe scrolling="auto" rameborder="0" src="pages/common/loading.jsp"
            name="right" width="100%" height="99%"></iframe>
</div>


<%--控制左边子按钮展开,以及顶端小导航栏--%>
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

    // 伪loading页
    function loading() {
        $("#loading").css("display", "block");
        setTimeout(function () {
            // alert(count);
            $("#loading").css("display", "none");
        }, 1000);
    }


</script>

</body>
</html>