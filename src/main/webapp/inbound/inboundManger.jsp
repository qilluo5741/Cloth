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
    
    <title>inboundManger.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	 <script type="text/javascript">
  	//点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
	    $("#inboundForm").attr("action", "inbound/querySelectAll.action?pageIndex="+(new_page_index+1));
	    $("#inboundForm").submit();
	    return false;
	}
  	$(function(){
			$("#News-Pagination").pagination(${inboundPager.totalRecords}, {
		        items_per_page:${inboundPager.pageSize}, // 每页显示多少条记录
		        current_page:${inboundPager.pageIndex}- 1, // 当前显示第几页数据
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
      <c:if test="${empty inboundPager}">
    	<c:redirect context="/" url="/Cloth/inbound/querySelectAll.action"></c:redirect>
    </c:if>
    <center><h2>入库信息</h2></center>
    <table align="center" cellpadding="0"  cellspacing="0" width="100%" height="280">
    	<tr>
    		<th>入库编号</th>
    		<th>入库时间</th>
    		<th>审核人</th>
    		<th>入库商品</th>
    		<th>采购批次</th>
    		<th>入库仓库</th>
    		<th>退货/采购</th>
			<th>入库说明</th>
    	</tr>
    	<c:forEach items="${inboundPager.list}" var = "inbound">
    		<tr>
    			<td align="center">${inbound.inboundId }</td>
	    		<td align="center" >${fn:substring(inbound.inboundTime,0,19)}</td>
	    		<td align="center">${inbound.emp.empName }</td>
	    		<td align="center">
		    		<c:if test="${inbound.goodsName  == null}">
		    			暂无商品
		    		</c:if>
	    		</td>
	    		<td align="center">${inbound.procurement.procurementId }</td>
	    		<td align="center">${inbound.warehouse.warehouseId}</td>
	    		<td align="center">
		    		<c:if test="${inbound.reOrPo == 0}">
		    			采购入库
		    		</c:if>
		    		<c:if test="${inbound.reOrPo != 0}">
		    			退货入库
		    		</c:if>
	    		</td>
	    		<td align="center">${inbound.inboundRemark }</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="8" align="center">
		  		<form id="inboundForm"  method="post"></form>
		 		 <div align="center">
			  		<div style="margin-left: 500px;" id="News-Pagination" align="center"></div>
				</div>
		 	</td>
		</tr>
    </table>
  </body>
</html>
