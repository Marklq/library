<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>

<div>

    <!-- 内容区域 -->
    <div>

        <!-- Main content -->
        <section class="margin-large text-center">
            <div class="error-page text-center text-yellow text-large">
                <h1 class="headline text-yellow "> 404</h1>


                <div class="text-black text-black">
                    <h3>Oops! 页面<b class="text-red">请求</b>出错了.</h3>
                    <br>
                    <br>
                    <br>
                    <br>
                    <p class="text-dot">
                        没有响应你的请求, 你可以
                        <a href="${pageContext.request.contextPath}/pages/index.jsp" target="_parent">
                            返回到后台首页
                        </a>
                    </p>

                </div>
                <!-- /.error-content -->
            </div>
            <!-- /.error-page -->
        </section>
        <!-- /.content -->
    </div>
    <!-- 内容区域 /-->


</div>

</body>
</html>
