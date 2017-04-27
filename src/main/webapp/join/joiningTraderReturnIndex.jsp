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
    
    <title>joiningTraderReturnIndex.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	
 	<script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#joiningForm").attr("action", "joiningTraderReturn/selectAllByPager.action?pageIndex="+(new_page_index+1));
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
			$("#btn_shen").click(function(){
				$("#joinReId").val($(this).attr("joinId"));
				$("#goodsName").val($(this).attr("goodsName"));
				$("#colorName").val($(this).attr("colorName"));
				$("#sizeName").val($(this).attr("sizeName"));
				$("#goodsNum").val($(this).attr("goodsNum"));
				$("#returnRemark").val($(this).attr("returnRemark"));
			});
			$("#id_OK").click(function(){
			});
		});
		
	</script>
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table tr{height: 40px;}
		table tr th{text-align: center;}
	</style>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
    <CENTER>
     <center><h2>加盟商退货信息</h2></center>
    	<c:if test="${empty pager}">
    		<p>暂没有任何数据</p>
    	</c:if>
	    <c:if test="${!empty pager}">
    		<table cellpadding="0" cellspacing="0" width="100%">
    			<tr>
    				<th>编号</th>
    				<th>时间</th>
    				<th>退/换</th>
    				<th>商品编号</th>
    				<th>商品颜色</th>
    				<th>尺寸</th>
    				<th>数量</th>
    				<th>状态</th>
    				<th>退货方</th>
    				<th>备注</th>
    			</tr>
		    	<c:forEach items="${pager.list}" var="joinR">
		    		<tr>
		    			<td>${joinR.joiningTraderReturnId }</td>
		    			<td>${fn:substring(joinR.returnTime,0,11)}</td>
		    			<td>
		    				<c:if test="${joinR.returnOrExchange == 0 }">
		    					退
		    				</c:if>
		    				<c:if test="${joinR.returnOrExchange == 1 }">
		    					换
		    				</c:if>
		    			</td>
		    			<td>${joinR.goodsName }</td>
		    			<td>${joinR.colorName }</td>
		    			<td>${joinR.sizeName }</td>
		    			<td>${joinR.goodsNum }</td>
		    			<td>
		    				<c:if test="${joinR.returnStatus == 0 }">
		    					<!-- <a href="joiningTraderReturn/updateOneByStatus.action?joiningTraderReturnId=${joinR.joiningTraderReturnId}">未审核</a> -->
		    					<a 
		    						class="btn" 
		    						id="btn_shen" 
		    						goodsName="${joinR.goodsName}" 
		    						colorName="${joinR.colorName }" 
		    						sizeName="${joinR.sizeName }"
		    						goodsNum="${joinR.goodsNum }"
		    						returnRemark="${joinR.returnRemark }"
		    						joinId="${joinR.joiningTraderReturnId}" 
		    						data-toggle="modal" 
		    						data-target="#ShenHe"
		    					>未审核</a>
		    				</c:if>
		    				<c:if test="${joinR.returnStatus == 1 }">
		    					已审核
		    				</c:if>
		    			</td>
		    			<td>${joinR.joiningTrader.joiningTraderName }</td>
		    			<td>${joinR.returnRemark }</td>
		    		</tr>
		    	</c:forEach>
		    	<tr><td colspan="11" align="center">
			  		<form id="joiningForm"  method="post"></form>
			 		 <div style="margin-left: -150px;" align="center">
				  		<div style="" id="News-Pagination" align="center"></div>
					</div>
			     </td></tr>
	    	</table>
	    </c:if>
    </CENTER>
    <div class="modal fade" id="ShenHe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="myModalLabel">
	             		确定审核
	            </h4>
	         </div>
	         <div class="modal-body" style="height:auto; overflow:auto;">
	         <CENTER>
	         	<!-- 编号   商品名称  颜色   尺码  数量 -->
	         	<form action="joiningTraderReturn/updateOneByStatus.action" method="post">
	         		退货单编号 <input id="joinReId" class="form-control" name="joiningTraderReturnId" requred/><br/>
	         		退货商品名称 <input id="goodsName" class="form-control" name="goodsName" requred/><br/>
	         		退货商品颜色 <input id="colorName" class="form-control" name="colorName" requred/><br/>
	         		退货商品尺寸 <input id="sizeName" class="form-control" name="sizeName" requred/><br/>
	         		退货商品数量 <input id="goodsNum" class="form-control" name="goodsNum" requred/><br/>
	         		退货描述<input id="returnRemark" class="form-control" name="returnRemark" requred/><br/>
		    		<input id="id_OK" type="submit" value="确认 "/>
	         	</form>
		    </CENTER>
		    </div>
	         <div class="modal-footer">
	         	<span id="msg" style="font-size: 12px"></span>
	            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	         </div>
	      </div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
  </body>
</html>
