<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>仓库表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "Warehouse/selectAll.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${IwList.totalRecords}, {
		        items_per_page:${IwList.pageSize}, // 每页显示多少条记录
		        current_page:${IwList.pageIndex}- 1, // 当前显示第几页数据
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
	  <c:if test="${empty IwList}">
	  		<c:redirect url="Warehouse/selectAll.action"></c:redirect>
	  </c:if>
	  <center><h2>仓库信息</h2></center>
  		<table cellpadding="0" cellspacing="0" align="center" width="100%" >
    		<tr>
    			<th>仓库编号</th>
    			<th>仓库名字</th>
    			<th>仓库管理员</th>
    			<th>仓库地址</th>
    		</tr>
    		<c:forEach items="${IwList.list}" var="i">
    		<tr>
    			<td align="center">${i.warehouseId}</td>
  				<td align="center">${i.warehouseName}</td>
  				<td align="center">${i.emp.empName}</td>
  				<td align="center">${i.warehouseAddress}</td>
    		</tr>
    		</c:forEach>
    	<tr>
    	<td colspan="9" align="center">
	  		<form id="returnForm" method="post"></form>
	 		 <div align="center" style="margin-left:460">
		  		<div style="" id="News-Pagination"  align="center"></div>
			</div>
		</td>
    	</table>
  </body>
</html>
