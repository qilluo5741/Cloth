<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'supplierManger.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
  	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery.pagination.js"></script>
  	<script type="text/javascript">
  	//点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
	    $("#supplierForm").attr("action", "supplier/querySelectAll.action?pageIndex="+(new_page_index+1));
	    $("#supplierForm").submit();
	    return false;
	}
  	$(function(){
			$("#News-Pagination").pagination(${supplierPager.totalRecords}, {
		        items_per_page:${supplierPager.pageSize}, // 每页显示多少条记录
		        current_page:${supplierPager.pageIndex}- 1, // 当前显示第几页数据
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
    <c:if test="${empty supplierPager}">
    	<c:redirect context="/" url="/Cloth/supplier/querySelectAll.action"></c:redirect>
    </c:if>
    <center><h2>供应商信息</h2></center>
    <table align="center" cellpadding="0"  cellspacing="0" width="100%">
    	<tr>
    		<th>供应商编号</th>
    		<th>供应商名称</th>
    		<th>联系人名称</th>
    		<th>联系人电话</th>
    		<th>供应商地址</th>
    		<th>供应商备注</th>
    	</tr>
    	<c:forEach items="${supplierPager.list}" var = "supplier">
    		<tr>
    			<td align="center">${supplier.supplierId }</td>
    			<td align="center">${supplier.supplierName}</td>
    			<td align="center">${supplier.supplierPeople}</td>
    			<td align="center">${supplier.supplierTel }</td>
    			<td align="center">${supplier.supplierAddress }</td>
	    		<td align="center">${supplier.supplierRemark }</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="6">
		  		<form id="supplierForm"  method="post"></form>
		  		<a href="supplier/supplierInsert.jsp" style="margin-left: -250px;">添加</a>
		 		 <div align="center">
			  		<div style="margin-left: 520px; margin-top: -25px;" id="News-Pagination" align="center"></div>
				</div>
		 	</td>
		</tr>
    </table>
  </body>
</html>
