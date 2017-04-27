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
    
    <title>goodsInventoryIndex.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="join/css/pintuer.css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="join/css/pintuer.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	<script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#joiningForm").attr("action", "goodsInventory/selectAllByPager.action?pageIndex="+(new_page_index+1));
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
	<style type="text/css">
		.v_not td{color: red;}
		.v_more td{color: #C4C400;}
		img{margin-left: -15px;}	
	</style>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
    	<c:if test="${empty pager}">
    		<p>暂没有任何数据</p>
    	</c:if>
	    <c:if test="${!empty pager}">
  			<center><h2 style="margin-left: -210px;margin-top: 10px;">库存信息</h2></center><br/><br/>
  			<div class="xm9" style="margin-left: 880px;width: 300px;margin-top: -90px;margin-right: 30px;margin-bottom: -39px" >
		       <div class="alert alert-yellow" align="left" style="margin-left: -10px;margin-top: 10px">
			       	<span class="close"></span>
			       	<strong>注意：</strong>红色行表示该商品库存量&lt;100。<br/>
			       	<strong>注意：</strong>黄色行表示该商品库存量&gt;1000。
		       </div>
		    </div>
    		<table  cellpadding="0" cellspacing="0" width="100%" >
    			<tr>
    				<th>库存编号</th>
    				<th>商品名称</th>
    				<th>颜色</th>
    				<th>尺码</th>
    				<th>数量</th>
    				<th>所在仓库</th>
    				<th>操作</th>
    			</tr>
		    	<c:forEach items="${pager.list}" var="gi">
		    		<c:if test="${gi.goodsNum < 100}">
			    		<tr class="v_not">
			    			<td><img src="images/icon/icon_warning.png"/>&nbsp;${gi.goodsInventoryId }</td>
			    			<td>${gi.goodsName }</td>
			    			<td>${gi.colorName }</td>
			    			<td>${gi.sizeName }</td>
			    			<td>${gi.goodsNum }</td>
			    			<td>${gi.warehouse.warehouseName }</td>
			    			<td>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=1">进货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=2">出货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=3">转移</a>
			    			</td>
			    		</tr>
		    		</c:if>
		    		<c:if test="${gi.goodsNum > 1000}">
			    		<tr class="v_more">
			    			<td><img height="14px" width="14px" src="images/icon/warning2.png"/>&nbsp;${gi.goodsInventoryId }</td>
			    			<td>${gi.goodsName }</td>
			    			<td>${gi.colorName }</td>
			    			<td>${gi.sizeName }</td>
			    			<td>${gi.goodsNum }</td>
			    			<td>${gi.warehouse.warehouseName }</td>
			    			<td>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=1">进货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=2">出货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=3">转移</a>
			    			</td>
			    		</tr>
		    		</c:if>
		    		<c:if test="${gi.goodsNum > 100 && gi.goodsNum < 1000}">
			    		<tr>
			    			<td>&nbsp;${gi.goodsInventoryId }</td>
			    			<td>${gi.goodsName }</td>
			    			<td>${gi.colorName }</td>
			    			<td>${gi.sizeName }</td>
			    			<td>${gi.goodsNum }</td>
			    			<td>${gi.warehouse.warehouseName }</td>
			    			<td>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=1">进货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=2">出货</a>
			    				&nbsp;<a href="goodsInventory/selectOne.action?goodsInventoryId=${gi.goodsInventoryId }&a=3">转移</a>
			    			</td>
			    		</tr>
		    		</c:if>
		    		
		    	</c:forEach>
		    	<tr><td colspan="13"><a href="goodsInventory/insertOneBefore.action">添加</a></td></tr>
		    	<tr><td colspan="13" align="center">
			  		<form id="joiningForm"  method="post"></form>
			 		 <div style="margin-left: 0px;" align="center">
				  		<div style="" id="News-Pagination" align="center"></div>
					</div>
			     </td></tr>
	    	</table>
	    </c:if>
  </body>
</html>
