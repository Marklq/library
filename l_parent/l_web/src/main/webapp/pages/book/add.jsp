<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-datepicker/css/datepicker-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/._bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加图书</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath }/book/addBook.do">

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">作者：</label>
                </div>
                <div class="field">
                    <input placeholder="古校长" type="text" class="input w50" name="author"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">价格： </label>
                </div>
                <div class="field">
                    <input placeholder="例：20.00" type="text" class="input w50" name="price"
                           data-validate="required:请输入价格"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">出版社：</label>
                </div>
                <div class="field">
                    <input placeholder="成理工程出版" type="text" class="input w50" name="press"
                           data-validate="required:出版社"/>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍名称: &nbsp; </label>
                </div>
                <div class="field">
                    <input placeholder="例：C语言" type="text" class="input w50" value="" name="book_name"
                           data-validate="required:请输入名称"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍编号: &nbsp; </label>
                </div>
                <div class="field">
                    <input placeholder="例：jsj-001" type="text" class="input w50" value="" name="book_id"
                           data-validate="required:请输入编号"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍数量：</label>
                </div>
                <div class="field">
                    <input placeholder="0-100" type="text" class="input w50" name="is_borrow"
                           data-validate="required:请输入书籍数量"/>
                </div>
            </div>


            <if condition="$iscid eq 1">
                <div class="form-group">
                    <div class="label">
                        <label class="text-big text-center text-justify">图书类型：</label>
                    </div>
                    <div class="field">
                        <select class="form-control select2 input w50" name="book_type">
                            <option value="0" selected="selected">计算机类</option>
                            <option value="1">社科类</option>
                            <option value="2">小说类</option>
                            <option value="3">人文类</option>
                        </select>
                        <div class="tips"></div>
                    </div>
                </div>
            </if>
            <div class="clear"></div>


            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">出版时间：</label>
                </div>
                <div class="field">
                    <input id="datetimepicker" type="text" class="datepicker-dropdown  input w50"
                           name="publish_date" placeholder="X年X月X日" data-validate="required:日期不能为空"
                           style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;"/>
                </div>
            </div>


            <div class="form-group text-big">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button type="submit" class="margin-large border radius-big button-big bg-green text-white">
                        保存书籍
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

<script>

    $('.datepicker-dropdown').datepicker({
        minView: "month",
        format: "yyyy-mm-dd",
        language: 'zh-CN',
        autoClose: true
    });
</script>
</html>
