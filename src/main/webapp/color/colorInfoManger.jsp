<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'colorInfoManger.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<!--<style type="text/css">
		th{height: 50px; font-size: 24px; color: #2F4F4F;}
		td{height: 45px; width: 200px; color: #5F9EA0; background-color: }
		#colorId{height: 45px; width: 150px;}
		a{text-decoration: none;color: #5F9EA0; }
		a:HOVER {text-decoration: underline;}
	</style>
  -->
  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  <link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery.pagination.js"></script>
  <script type="text/javascript">
  	//点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
	    $("#colorForm").attr("action", "color/querySelectAll.action?pageIndex="+(new_page_index+1));
	    $("#colorForm").submit();
	    return false;
	}
  	$(function(){
			$("#News-Pagination").pagination(${colorPager.totalRecords}, {
		        items_per_page:${colorPager.pageSize}, // 每页显示多少条记录
		        current_page:${colorPager.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:2, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
		});
  </script>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
    <c:if test="${empty colorPager}">
    	<c:redirect context="/" url="/Cloth/color/querySelectAll.action"></c:redirect>
    </c:if>
    <center><h2>颜色信息</h2></center>
    <table align="center" cellpadding="0" cellspacing="0" width="100%" >
    	<tr>
    		<th>颜色编号</th>
    		<th>颜色名称</th>
    		<th>颜色备注</th>
    	</tr>
    	<c:forEach items="${colorPager.list}" var = "color">
    		<tr>
    			<td align="center">${color.colorId }</td>
	    		<td id="colorId" align="center" style="background-color:${color.colorNo}; color:#9D9D9D;">${color.colorName }</td>
	    		<td align="center">${color.colorRemark }</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="3">
		  		<form id="colorForm"  method="post"></form>
		  		<a href="color/colorInfoInsert.jsp" style="margin-left: -280px;">添加</a>
		 		 <div align="center">
			  		<div style="margin-left: 500px; margin-top: -25px;" id="News-Pagination" align="center"></div>
				</div>
		 	</td>
		</tr>
    </table>
  </body>
</html>
