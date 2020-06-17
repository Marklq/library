<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form method="post" class="form-x"
              action="${pageContext.request.contextPath }/book/modify.do">

            <%--隐藏的input框，用于获取修改的书籍的注册时间--%>
            <div class="form-group">
                <div class="field">
                    <input type="hidden" class="input w50" name="register_time" value="${book.register_time}"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">作者：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="author" value="${book.author}"
                           data-validate="required:请输入"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">价格： </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="price" value="${book.price}"
                           data-validate="required:请输入价格"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">出版社：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="press" value="${book.press}"
                           data-validate="required:出版社"/>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍名称: &nbsp; </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${book.book_name}" name="book_name"
                           data-validate="required:请输入名称"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍编号: &nbsp; </label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${book.book_id}" title="书籍编号不可更改" name="book_id"
                           readonly="readonly"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label class="text-big text-center text-justify">书籍数量：</label>
                </div>
                <div class="field">
                    <input value="${book.is_borrow}" type="text" class="input w50" name="is_borrow"
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
                            <option value="0" <c:if test="${book.book_type==0}">selected="selected"</c:if>">计算机类</option>
                            <option value="1" <c:if test="${book.book_type==1}">selected="selected"</c:if>">社科类</option>
                            <option value="2" <c:if test="${book.book_type==2}">selected="selected"</c:if>">小说类</option>
                            <option value="3" <c:if test="${book.book_type==3}">selected="selected"</c:if>">人文类</option>
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
                           value="${book.publish_dateStr}" name="publish_date" data-validate="required:日期不能为空"
                           style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;"/>
                </div>
            </div>


            <div class="form-group text-big">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <%--                    <input class="button button-big bg-blue-light icon-check-square-o" value="修改书籍" type="submit"/>
                                        <input class="button button-big bg-blue-light icon-check-square-o" onclick="history.back(-1);" value="返回"/>--%>

                    <button type="submit" class="margin-large border radius-big button-big bg-green text-white">
                        修改
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
