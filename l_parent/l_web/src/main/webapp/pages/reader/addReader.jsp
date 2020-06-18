<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker-theme.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <style type="text/css">
        a {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span>新增读者</strong>
        <strong>
            <a class="float-right text-center text"
               onclick="history.back(-1);">返回</a>
        </strong>
    </div>

    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath }/reader/addReader.do">

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">用户名：</label>
                </div>
                <div class="field">
                    <input placeholder="用户名" type="text" class="input w50" name="username"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">密码： </label>
                </div>
                <div class="field">
                    <input placeholder="长度限制在30位" type="text" class="input w50" name="password"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">学号：</label>
                </div>
                <div class="field">
                    <input placeholder="学号" type="text" class="input w50" name="student_id"
                           data-validate="required:请输入"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">真实姓名：</label>
                </div>
                <div class="field">
                    <input placeholder="真实姓名" type="text" class="input w50" name="trueName"
                           data-validate="required:请输入"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">联系电话：</label>
                </div>
                <div class="field">
                    <input placeholder="联系电话" type="text" class="input w50" name="phoneNum"
                           data-validate="required:请输入"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">昵称：</label>
                </div>
                <div class="field">
                    <input placeholder="昵称" type="text" class="input w50" name="nickname"
                           data-validate="required:请输入"/>
                </div>
            </div>

            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">性别：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="sex">
                            <option value="0" selected="selected">男</option>
                            <option value="1">女</option>
                            <option value="2">保密</option>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </if>
            <div class="clear"></div>

            <div class="form-group text-big">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button type="submit" class="margin-large border radius-big button-big bg-green text-white">
                        保存
                    </button>
                    <button type="button" class="margin-large border radius-big button-big bg-blue text-white"
                            onclick="history.back(-1);">返回
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
