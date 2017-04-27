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
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/04.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "Order/queryAllByPager.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${OrderList.totalRecords}, {
		        items_per_page:${OrderList.pageSize}, // 每页显示多少条记录
		        current_page:${OrderList.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:2, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
			$("#btn_shen").click(function(){
				$("#orderId").val($(this).attr("orderId"));
				$("#isdo").val($(this).attr("isdo"));
			});
			$("#id_OK").click(function(){
			});
		});
</script>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
  	<c:if test="${empty OrderList}">
  		<c:redirect url="Order/queryAllByPager.action"></c:redirect>
  </c:if>
  		<center><h2>申请表信息</h2></center>
  		<table cellpadding="0" cellspacing="0" align="center" width="100%" >
    		<tr>
    			<th>申请编号</th>
    			<th>申请时间</th>
    			<th>商品数量</th>
    			<th>加盟名称</th>
    			<th>加盟状态</th>
    			<th>是否处理</th>
    			<th>申请备注</th>
    		</tr>
    		<c:forEach items="${OrderList.list}" var="o">
    		<tr>
    			<td align="center">${o.orderId}</td>
  				<td align="center">${fn:substring(o.orderTime,0,19)}</td>
  				<td align="center">${o.goodsNum}</td>
  				<td align="center">${o.joiningTrader.joiningTraderName}</td>
  				<td align="center">
	  				<c:if test="${o.joiningTrader.joiningTraderStatus == 0}">
			    			审核中
			    	</c:if>
			    	<c:if test="${o.joiningTrader.joiningTraderStatus == 1}">
			    			加盟成功
			    	</c:if>
			    	<c:if test="${o.joiningTrader.joiningTraderStatus == 2}">
			    			审核失败
			    	</c:if>
  				</td>
  				<td align="center">
	  				<c:if test="${o.isdo == 0}">
			    			已处理
			    	</c:if>
			    	<c:if test="${o.isdo == 1}">
			    			<a 
	    						class="btn" 
	    						id="btn_shen" 
	    						orderId="${o.orderId}" 
	    						isdo="${o.isdo}" 
	    						data-toggle="modal" 
	    						data-target="#ShenHe"
	    					>未处理</a>
			    	</c:if>
			    	<c:if test="${o.isdo == 2}">
			    			<a 
	    						class="btn" 
	    						id="btn_shen" 
	    						orderId="${o.orderId}" 
	    						isdo="${o.isdo}" 
	    						data-toggle="modal" 
	    						data-target="#ShenHe"
	    					>拒绝处理</a>
			    	</c:if>
				</td>
  				<td align="center">${o.orderRemark}</td>
    		</tr>
    		</c:forEach>
    	<tr>
    	<td colspan="10" align="center">
	  		<form id="returnForm" method="post"></form>
	 		 <div align="center" style="margin-left:580">
		  		<div style="" id="News-Pagination"  align="center"></div>
			</div>
		</td>
    	</table>
    	
   <div class="modal fade" id="ShenHe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="myModalLabel">
	             		确定处理
	            </h4>
	         </div>
	         <div class="modal-body" style="height:auto; overflow:auto;">
	         <CENTER>
	         	<form action="Order/passVerify.action" method="post">
	         		申请编号 <input id="orderId" class="form-control" name="orderId" requred/><br/>
	         		加盟状态<input id="isdo" class="form-control" name="isdo" requred/><br/>
		    		<input id="id_OK" type="submit" value="确认 "/>
	         	</form>
		    </CENTER>
		    </div>
	         <div class="modal-footer">
	         	<span id="msg" style="font-size: 12px"></span>
	            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	         </div>
	      </div>
	</div>
	</div>
  </body>
</html>
