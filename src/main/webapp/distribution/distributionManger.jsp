<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>distributionManger.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<!--<style type="text/css">
		th{height: 50px; font-size: 24px; color: #2F4F4F;}
		td{height: 45px; width: 180px; color: #5F9EA0; background-color: }
		a{text-decoration: none;color: #5F9EA0; }
		a:HOVER {text-decoration: underline;}
	</style>
  -->
	  <link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	  <script type="text/javascript" src="js/jquery.pagination.js"></script>
	  <script type="text/javascript">
	  	//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#distributionForm").attr("action", "distribution/querySelectAll.action?pageIndex="+(new_page_index+1));
		    $("#distributionForm").submit();
		    return false;
		}
	  	$(function(){
				$("#News-Pagination").pagination(${distributionPager.totalRecords}, {
			        items_per_page:${distributionPager.pageSize}, // 每页显示多少条记录
			        current_page:${distributionPager.pageIndex} - 1, // 当前显示第几页数据
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
    <c:if test="${empty distributionPager}">
    	<c:redirect context="/" url="/Cloth/distribution/querySelectAll.action"></c:redirect>
    </c:if>
    <center><h2>配货信息</h2></center>
    <table align="center" cellpadding="0"  cellspacing="0" width="100%">
    	<tr>
    		<th>配送编号</th>
    		<th>配送时间</th>
    		<th>是否验收</th>
    		<th>配送地址</th>
    		<th>配送订单</th>
    		<th>配送说明</th>
    	</tr>
    	<c:forEach items="${distributionPager.list}" var = "distribution">
    		<tr>
    			<td align="center">${distribution.distributionId } </td>
    			<td align="center">${distribution.distributionTime == null ? '暂无配送时间' : fn:substring(distribution.distributionTime,0,19)} </td>
    			<td align="center">
    				<c:if test="${distribution.isAcceptance == 0 }">
    					未验收
    				</c:if>
    				<c:if test="${distribution.isAcceptance == 1 }">
    					  已验收
    				</c:if>
    				<c:if test="${distribution.isAcceptance == 2 }">
    					拒收
    				</c:if>
    			</td>
	    		<td align="center">${distribution.disAddress } </td>
	    		<td align="center">${distribution.order.orderId } </td>
	    		<td align="center">${distribution.distributionRemark } </td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="8">
		  		<form id="distributionForm"  method="post"></form>
			  	<div style="margin-left: 500px;" id="News-Pagination" align="center"></div>
		 	</td>
		</tr>
    </table>
  </body>
</html>
