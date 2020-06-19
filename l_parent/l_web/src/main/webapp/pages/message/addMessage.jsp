<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
        <strong><span class="icon-pencil-square-o"></span>新增留言</strong>
        <strong>
            <a class="float-right text-center text"
               onclick="history.back(-1);">返回</a>
        </strong>
    </div>

    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath }/message/addMessage.do">

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">学号：</label>
                </div>
                <div class="field">
                    <input placeholder="学号" type="text" class="input w50" name="student_id"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">姓名： </label>
                </div>
                <div class="field">
                    <input placeholder="姓名" type="text" class="input w50" name="student_name"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">留言信息：</label>
                </div>
                <div class="field">
                    <textarea placeholder="留言信息" type="text" class="input w50" name="message"
                              data-validate="required:请输入">
                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">联系号码：</label>
                </div>
                <div class="field">
                    <input placeholder="联系号码" type="text" class="input w50" name="phoneNumber"
                           data-validate="required:请输入"/>
                </div>
            </div>

            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">是否已解决：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="is_del">
                            <option value="0" selected="selected">未解决</option>
                            <option value="1">已解决</option>
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
