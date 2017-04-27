<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/Myjquery.js"></script>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "Menu/selectAll.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${IMenuList.totalRecords}, {
		        items_per_page:${IMenuList.pageSize}, // 每页显示多少条记录
		        current_page:${IMenuList.pageIndex}- 1, // 当前显示第几页数据
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
  	 <c:if test="${empty IMenuList}">
  		<c:redirect url="Menu/selectAll.action"></c:redirect>
  </c:if>
  		<center><h2>查询所有菜单信息</h2></center>
  		<table cellpadding="0" cellspacing="0" align="center" width="100%" height="280px;">
    		<tr>
    			<th>菜单编号</th>
    			<th>菜单名称</th>
    			<th>菜单路径</th>
    			<th>target</th>
    			<th>菜单类型名</th>
    			<th>项目操作</th>
    		</tr>
    		<c:forEach items="${IMenuList.list}" var="m">
    		<tr>
    			<td align="center">${fn:substring(m.menuId,0,17)}</td>
  				<td align="center">${m.menuName}</td>
  				<td align="center">${m.href}</td>
  				<td align="center">${m.target}</td>
  				<td align="center">${m.menuType.menuTypeName}</td>
  				<td align="center"><%--<a href="#">删除</a>&nbsp;&nbsp;--%><a href="Menu/selectOneMenuInfo.action?menuId=${m.menuId}">修改</a></td>
    			</tr>
    		</c:forEach>
    	<tr>
    	<td colspan="9" align="center" height="40px;">
	  		<form id="returnForm" method="post"></form>
	 		 <div align="center" style="margin-left:540">
		  		<div style="" id="News-Pagination"  align="center"></div>
			</div>
		</td>
    	</table>
  </body>
</html>
