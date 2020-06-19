<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  bs 需要的一个必须写的标签   -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title> 登录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>  
		
	
	<!-- 引入 js 文件  -->
	</head>
<body>
<!--  引用的模板 -->
		<div class="bg"></div>
		<div class="container">
		    <div class="line bouncein">
		        <div class="xs6 xm4 xs3-move xm4-move">
		            <div style="height:150px;"></div>
		            <div class="media media-y margin-big-bottom">           
		            </div>         
		            <form action="${pageContext.request.contextPath}/login.do" method="post">
		            <div class="panel loginbox">
		                <div class="text-center margin-big padding-big-top"><h1>图书管理系统</h1></div>
		                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
		                    <div class="form-group">
		                        <div class="field field-icon-right">
		                            <input type="text" class="input input-big" name="username" placeholder="登录账号" data-validate="required:请填写账号" />
		                            <span class="icon icon-user margin-small"></span>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="field field-icon-right">
		                            <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
		                            <span class="icon icon-key margin-small"></span>
		                        </div>
		                    </div>
		                  
		                </div>
		                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
		            </div>
		            </form>          
		        </div>
		    </div>
		</div>

<!-- 引用的模板结束 -->

</body>
</html>