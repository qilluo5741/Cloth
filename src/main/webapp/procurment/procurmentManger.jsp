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
    
    <title>采购表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<!-- http://localhost:8080/Cloth/Procure/selectAll.action-->
	<link rel="stylesheet" href="css/04.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/Myjquery.js"></script>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "Procure/selectAll.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${procList.totalRecords}, {
		        items_per_page:${procList.pageSize}, // 每页显示多少条记录
		        current_page:${procList.pageIndex}- 1, // 当前显示第几页数据
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
   <c:if test="${empty procList}">
  		<c:redirect url="Procure/selectAll.action"></c:redirect>
   </c:if>
  		<center><h2>采购信息</h2></center>
  		<table cellpadding="0" cellspacing="0" align="center" width="100%" height="280px;">
    		<tr>
    			<th>采购编号</th>
    			<th>采购时间</th>
    			<th>供应人姓名</th>
    			<th>供应商名称</th>
    			<th>供应商地址</th>
    			<th>采购人姓名</th>
    			<th>采购人电话</th>
    			<th>采购人地址</th>
    			<th>采购备注</th>
    		  </tr>
    		<c:forEach items="${procList.list}" var="p">
    		<tr>
    			<td align="center">${fn:substring(p.procurementId,0,17)}</td>
  				<td align="center">${fn:substring(p.procurementTime,0,19)}</td>
  				<td align="center">${p.supplier.supplierPeople}</td>
  				<td align="center">${p.supplier.supplierName}</td>
  				<td align="center">${p.supplier.supplierAddress}</td>
  				<td align="center">${p.emp.empName}</td>
  				<td align="center">${p.emp.empTel}</td>
  				<td align="center">${p.emp.empAddress}</td>
  				<td align="center">${p.procuremenRemark}</td>
  			  </tr>
    		</c:forEach>
    		<tr>
    			<td colspan="10" align="center"><a href="Procure/insertOne.action">添&nbsp;&nbsp;加</a></td>
    		</tr>
    	<tr>
    	<td colspan="10" align="center" height="40px;">
	  		<form id="returnForm" method="post"></form>
	 		 <div align="center" style="margin-left:540">
		  		<div style="" id="News-Pagination"  align="center"></div>
			</div>
		</td>
    	</table>
  </body>
</html>
