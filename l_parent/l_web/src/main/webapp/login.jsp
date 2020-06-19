<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<body>


<form action="${pageContext.request.contextPath}/login.do" method="post" class="box">
    <h1>登录&nbsp;&nbsp;<strong class="little">LOGIN</strong></h1>
    <input type="text" placeholder="Username" name="username"/>
    <input type="password" placeholder="Password" name="password"/>
    <input type="submit" class="submit"/>
</form>

</body>
</html>
