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
    
    <title>My JSP 'localReturnIndex.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<style type="text/css">
		.localreturn{color: #FF7F50}
		.modal-body input{width:150px}
		.form-controls{width:100%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;}
		.modal-dialog{line-height: 45px}
		table tr th{text-align: center}
	</style>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">

		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "localReturn/queryLocalReturn.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pagerLocalReturn.totalRecords}, {
		        items_per_page:${pagerLocalReturn.pageSize}, // 每页显示多少条记录
		        current_page:${pagerLocalReturn.pageIndex}- 1, // 当前显示第几页数据
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
   <c:if test="${empty pagerLocalReturn}">
  	<c:redirect url="/localReturn/queryLocalReturn.action"></c:redirect>
  </c:if>
  <center><h3>本地退（换）货信息</h3></center>
  <table cellpadding="0" cellspacing="0" width="100%" align="center">
  	<tr style="line-height: 35px"><th>操作ID</th><th>操作类型</th><th>操作时间</th><th>商品名称</th><th>商品颜色</th><th>商品尺寸</th><th>商品数量</th><th>操作原因</th><th>所在仓库</th><th>编辑</th></tr>
	    <c:forEach items="${pagerLocalReturn.list}" var="localreturn">
	    	<tr style="line-height: 35px">
	    	<td>${localreturn.returnId}</td><td>${localreturn.returnOrExchange==0?'退货':'换货'}</td><td>${fn:substring(localreturn.returnTime,0,11)}</td><td>${localreturn.goodsName}</td><td>${localreturn.colorName}</td><td>${localreturn.sizeName}</td><td>${localreturn.goodsNum}</td><td>${localreturn.returnRemark}</td><td>${localreturn.warehouse.warehouseName}</td>
	    		<td>
	    		<c:if test="${localreturn.returnOrExchange==0}">
	    			<c:if test="${localreturn.returnStatus==0}">已退货</c:if>
	    			<c:if test="${localreturn.returnStatus==1}"><!--
		    			<a class=returnGoods href="localReturn/localReturnSure.action?returnId=${localreturn.returnId}">确认退货</a>-->
		    				<span class="localreturn" returnId="${localreturn.returnId}" goodsName="${localreturn.goodsName}" colorName="${localreturn.colorName}" sizeName="${localreturn.sizeName}" goodsNum="${localreturn.goodsNum}" warehouseName="${localreturn.warehouse.warehouseName}">确认退货</span>
		    			</c:if>
	    		</c:if>
	    		<c:if test="${localreturn.returnOrExchange==1}">
	    			<c:if test="${localreturn.returnStatus==0}">已换货</c:if>
	    			<c:if test="${localreturn.returnStatus==1}">
	    			<!-- <a class=returnGoods href="localReturn/localReturnSure.action?returnId=${localreturn.returnId}">确认换货</a> -->
	    				<span class="localreturn" returnId="${localreturn.returnId}" goodsName="${localreturn.goodsName}" colorName="${localreturn.colorName}" sizeName="${localreturn.sizeName}" goodsNum="${localreturn.goodsNum}" warehouseName="${localreturn.warehouse.warehouseName}">确认退货</span>
	    			</c:if>
	    		</c:if>
	    		</td></tr>
	    </c:forEach>
     <tr><td colspan="10" align="center">
  		<form id="returnForm"  method="post"></form>
 		 <div style="margin-left:-100px;height: 50px; margin-top: -20px" align="center">
	  			<div style="" id="News-Pagination"  align="center"></div>
		</div>
	</table>
	
	<script type="text/javascript">
  	$(function(){
  		$(".localreturn").click(function(){
  			//设置修改的值
  			 $("#returnId").val($(this).attr("returnId"));//退货Id
  			 $("#goodsName").val($(this).attr("goodsName"));//退货Id
  			 $("#colorName").val($(this).attr("colorName"));//退货Id
  			 $("#sizeName").val($(this).attr("sizeName"));//退货Id
  			 $("#goodsNum").val($(this).attr("goodsNum"));//退货Id
  			 $("#warehouseName").val($(this).attr("warehouseName"));//退货Id
  			 $("#returnGoodsModel").click();
  		});
  		$("#turnSubmit").click(function(){
				//验证内容是否为空
				var returnId=$("#returnId").val();
  			 	//执行修改
  			 	$.ajax({
					url:'localReturn/localReturnSure.action?returnId='+returnId,
					type:"post",
					success:function(res){
						if(res=="0"){
						}
						else{
							alert("退货失败！");
						}
						//刷新
						window.location.href=window.location.href;
					}
				});
			});
  	})
  </script>
	
	<button style="display: none;" id="returnGoodsModel" class="btn btn-primary btn-lg" data-toggle="modal" 
   		data-target="#returnModal">
	</button>
	
	
	<!-- 本地退货确定 -->
	<div class="modal fade" id="returnModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">确认退货</h4>
	         </div>
	         <div class="modal-body">
	        	 <input type="hidden" id="returnId">
	          		商品名称：<input type="text" class="form-controls" style="width: 150px" id="goodsName" readonly="readonly">
	          		商品颜色：<input type="text" class="form-controls" id="colorName" readonly="readonly"><br/>
	          		商品尺寸：<input type="text" class="form-controls" id="sizeName" readonly="readonly">
	          		商品数量：<input type="text" class="form-controls" id="goodsNum" readonly="readonly"><br/>
	          		所在仓库：<input type="text" class="form-controls" id="warehouseName" readonly="readonly"><br/>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="button" id="turnSubmit" class="btn btn-primary">退货</button>
	         </div>
	      </div>
		</div>
	</div>
  </body>
</html>
