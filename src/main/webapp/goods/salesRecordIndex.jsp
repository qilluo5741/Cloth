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
    
    <title>salesRecordIndex.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	<script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#joiningForm").attr("action", "salesRecord/selectAllByPager.action?pageIndex="+(new_page_index+1));
		    $("#joiningForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pager.totalRecords}, {
		        items_per_page:${pager.pageSize}, // 每页显示多少条记录
		        current_page:${pager.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:2, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
		});
	</script>
	<!--<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width: 65%; text-align: center;}
		table tr{height: 35px;}
	</style>
  --></head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
    <CENTER>
    	<c:if test="${empty pager}">
    		<p>暂没有任何数据</p>
    	</c:if>
	    <c:if test="${!empty pager}">
	    	<center><h2>销售记录</h2></center>
    		<table  cellpadding="0" cellspacing="0" width="100%">
    			<tr>
    				<th>编号</th>
    				<th>订单编号</th>
    				<th>交易商品</th>
    				<th>交易金额</th>
    				<th>交易时间</th>
    				<th>交易备注</th>
    			</tr>
		    	<c:forEach items="${pager.list}" var="sr">
		    		<tr>
		    			<td>${sr.salesRecordId }</td>
		    			<td>${sr.goodsOrder.order.orderId }</td>
		    			<td>${sr.goodsOrder.goods.goodsName }</td>
		    			<td>${sr.salesRecordMoney }</td>
		    			<td>${sr.salesRecordTime }</td>
		    			<td>${sr.salesRecordRemark }</td>
		    		</tr>
		    	</c:forEach>
		    	<tr><td colspan="13" align="center">
			  		<form id="joiningForm"  method="post"></form>
			 		 <div style="margin-left: 445px;" align="center">
				  		<div style="" id="News-Pagination" align="center"></div>
					</div>
			     </td></tr>
	    	</table>
	    </c:if>
    </CENTER>
  </body>
</html>
