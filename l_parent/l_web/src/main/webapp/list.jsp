<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  bs 需要的一个必须写的标签   -->
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>  
</head>
<body>
			<br>
	
			<!--  显示列表 -->
					
	<form method="post" action="" id="listform">
  		<div class="panel admin-panel">
   		 <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
   			 <div class="padding border-bottom">
		      <ul class="search" style="padding-left:10px;">
		        <li> <a class="button border-main icon-plus-square-o" href="add.jsp"> 增加</a> </li>
		        <li>搜索：</li>
		      
		        <if condition="$iscid eq 1">
		          <li>
		            <select name="cid" class="input" style="width:100px; line-height:17px;" onchange="changesearch()">
		              <option value="">请选择分类</option>
		              <option value="">产品分类</option>
		              <option value="">产品分类</option>
		              <option value="">产品分类</option>
		              <option value="">产品分类</option>
		            </select>
		          </li>
		        </if>
		        <li>
		          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
		          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
		       <li>
		         
		          推荐
		          <select name="s_isvouch" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
		            <option value="">选择</option>
		            <option value="1">是</option>
		            <option value="0">否</option>
		          </select>
		          &nbsp;&nbsp;
		          置顶
		          <select name="s_istop" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
		            <option value="">选择</option>
		            <option value="1">是</option>
		            <option value="0">否</option>
		          </select>
		        </li>
		      </ul>
		    </div>
   
   		 </div>
   	</form>
   
 
   
   

   
   
    <!--  表格显示nei'rong -->
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th width="10%">是否出借</th>
        <th>图书名称</th>
        <th>图书类型</th>
        <th>作者</th>
        <th>价格</th>
        
        <th width="10%">发行时间</th>
        <th>出版社</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">

    
        <tr>
          <td style="text-align:left; padding-left:10px;">
          <input type="checkbox" name="id[]" value="" />
            11</td>
            <!--  是否可以出借 使用 if 判断 -->
          
            <td>true </td> 

          
          <td width="10%">10</td>
          <td>20</td>
          <td><font color="#00CC99">30</font></td>
          <td>10</td>
          <td>20</td>
          <td> 30</td>
          <td><div class="button-group"> 
        <!--  修改  -->
    
          <a  class="button border-main" 
          href="#">
          
          <span class="icon-edit"></span> 修改</a> 
          <a class="button border-red" href="javascript:void(0)" 
          
          onclick="delBook('${b.book_id }','${b.book_name }')">
          <span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
   		
  
      

    </table>

</body>
</html>