<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<%--头--%>
<div class="header bg-blue-light">
    <div class=" margin-big-left fadein-top">
        <img style="cursor: pointer" src="images/y.jpg" class="radius-circle rotate-hover float-left" height="50"
             alt=""/>
        <h5 class="margin-little"><strong class="margin text-white">当前用户：</strong>
            <br>
            <b class="text-yellow margin"><security:authentication property="principal.username"/></b>
        </h5>
    </div>
    <div class="text-center fadein-top">
        <strong class="text-white">
            <h2><label class="icon-desktop"></label>后台管理中心</h2>
        </strong>
    </div>
    <div class="margin-large-right fixed-top-right margin-large">
        <a class="button button-little bg-green-light" href="index.jsp" target="_self"><span class="icon-home"></span>后台首页</a>
        <a class="button button-little bg-red-light" href="${pageContext.request.contextPath}/logout.do">
            <span class="icon-power-off"></span>退出登录</a>
    </div>
</div>

<%--左导航--%>
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
            <a href="${pageContext.request.contextPath}/pages/book/add.jsp" target="right">
                <span class="icon-caret-right"></span>添加书籍
            </a>
        </li>
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/book/borrowTimes.do" target="right">
                <span class="icon-caret-right"></span>借阅排行
            </a>
        </li>
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/book/findAllRecords.do" target="right">
                <span class="icon-caret-right"></span>借书记录
            </a>
        </li>
        <li>
            <a onclick="loading()" href="${pageContext.request.contextPath}/book/findNot_R_Records.do" target="right">
                <span class="icon-caret-right"></span>逾期未还
            </a>
        </li>
    </ul>
    <h2><span class="icon-user"></span> 用 户 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/master/findAll.do" target="right">
                <span class="icon-caret-right"></span>超级管理员
            </a>
        </li>
        <security:authorize access="hasRole('ROLE_S_ADMIN')" method="" url="" var="">
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
        </security:authorize>
    </ul>
    <h2><span class="icon-users"></span>读 者 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/reader/findAll.do" target="right">
                <span class="icon-caret-right"></span>读者信息
            </a>
        </li>
        <li>
            <a href="pages/reader/addReader.jsp" target="right">
                <span class="icon-caret-right"></span>添加读者
            </a>
        </li>
    </ul>
    <h2><span class="icon-users"></span>赔 偿 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/amerce/findAll.do" target="right">
                <span class="icon-caret-right"></span>赔偿记录
            </a>
        </li>
        <li>
            <a href="pages/amerce/addAmerce.jsp" target="right">
                <span class="icon-caret-right"></span>添加记录
            </a>
        </li>
    </ul>
    <h2><span class="icon-users"></span>留 言 管 理</h2>
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/message/findAll.do" target="right">
                <span class="icon-caret-right"></span>留言记录
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/pages/message/addMessage.jsp" target="right">
                <span class="icon-caret-right"></span>添加留言
            </a>
        </li>
    </ul>
</div>

<ul class="bread">
    <li class="icon-home"><b id="a_leader_txt">首页</b></li>
    <li><b>当前时间：</b><strong id="time"></strong></li>
    <li class="float-right"><b>当前用户：</b>
        <b class="text-yellow margin"><security:authentication property="principal.username"/></b>
    </li>
</ul>

<%--右边iframe--%>
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