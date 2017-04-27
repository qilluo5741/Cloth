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
    
    <title>My JSP 'outbound.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/04.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "select/selectbyAlloutbound.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pagerList.totalRecords}, {
		        items_per_page:${pagerList.pageSize}, // 每页显示多少条记录
		        current_page:${pagerList.pageIndex}- 1, // 当前显示第几页数据
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
   <c:if test="${empty pagerList}">
  		<c:redirect url="select/selectbyAlloutbound.action"></c:redirect>
  </c:if>		
  			<center><h2>出库信息</h2></center>
    		<table cellpadding="0" cellspacing="0" width="100%">
    			<tr align="center">
    				<th>编号</th>
    				<th>出库时间</th>
    				<th>审核人</th>								
    				<th>商品所在仓库</th>
    				<th>出库商品名称</th>
    				<th>数量</th>
    				<th>加盟</th>
    				<th>出库备注</th>
    				<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本操作</th>
    			</tr>
    			<c:forEach items="${pagerList.list}" var="outbound">
    				<tr align="center">
    					<td>${fn:substring(outbound.outboundId,0,17)}</td>
    					<td>${fn:substring(outbound.outboundTime,0,11)}</td>
    					<td>${outbound.emp.empName}</td>
    					<td>${outbound.warehouse.warehouseName}</td>
    					<td>${outbound.goodsName}</td>
    					<td>${outbound.goodsNum}</td>
    					<td><c:if test="${outbound.isExitorSale==1}">
    						${outbound.joiningTrader.joiningTraderName}
    					</c:if>
    					<c:if test="${outbound.isExitorSale==0}">${outbound.supplier.supplierName}</c:if>
    					</td>
    					<td>${outbound.outboundRemark}</td>
    					<td><a href="select/deleteOutboundInfo.action?outboundId=${outbound.outboundId}">删除</a>&nbsp;&nbsp;<a href="select/selectOutboundInfo.action?outboundId=${outbound.outboundId}">修改</a></td>
    				</tr>
    			</c:forEach>
	  		<tr>
    		<td colspan="9" align="center">
	  			<form id="returnForm" method="post"></form>
	 			 <div align="center" style="margin-left:440">
		  			<div style="" id="News-Pagination"  align="center"></div>
				</div>
			</td>
			</tr>
    	</table>
  </body>
</html>
