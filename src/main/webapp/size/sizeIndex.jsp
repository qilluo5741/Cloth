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
    
    <title>My JSP 'sizeIndex.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<style type="text/css">
		.addGoodsSize{color:#4F4F4F;background-color:#FFDC35;border-color:#2e6da4}
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
		    $("#sizeForm").attr("action", "size/queryAllSize.action?pageIndex="+(new_page_index+1));
		    $("#sizeForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pagersize.totalRecords}, {
		        items_per_page:${pagersize.pageSize}, // 每页显示多少条记录
		        current_page:${pagersize.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:2, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
			$.ajax({
  				url:'select/queryAllGoodTypeInfoToAjax.action',
  				type:'post',
  				async:false,
  				dataType:'json',
  				success:function(res){
  					$.each(res, function(i, item) {
						$("#sizes").append(" <option class=gt_"+item.goodTypeId+" value="+item.goodTypeId+">"+item.goodTypeName+"</option>")
					});
  				}
  			});
  			$("#sizeNames").blur(function(){
  				var sizeName=$(this).val();
  				var goodsTypeName=$(".gt_"+$("#sizes").val()).html();
  				$.ajax({
	  				url:'size/selectIsExistsSize.action?sizeName='+sizeName+'&goodsTypeName='+goodsTypeName,
	  				type:'post',
	  				async:false,
	  				dataType:'text',
	  				success:function(res){
	  					if(res==true||res=="true"){
	  						alert("该商品类型下已存在这个尺寸！！！！！");
	  					}
	  				}
  				});
  			});
		});
</script>
  </head>
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
  <c:if test="${empty pagersize}">
  	<c:redirect url="/size/queryAllSize.action"></c:redirect>
  </c:if>
  <center><h2>尺码信息</h2></center>
  <table cellpadding="0" cellspacing="0" width="100%" align="center">
  	<tr style="line-height: 35px"><th>尺寸编号</th><th>尺寸大小</th><th>商品类型</th><th>尺寸说明</th></tr>
	    <c:forEach items="${pagersize.list}" var="size">
	    	<tr style="line-height: 35px">
	    	<td>${size.sizeId}</td><td>${size.sizeName}</td><td>${size.goodType.goodTypeName}</td><td>${size.sizeRemark}</td></tr>
	    </c:forEach>
     <tr><td colspan="5" align="center">
  		<form id="sizeForm"  method="post"></form>
 		 <div style="margin-left: 350px;height: 50px; margin-top: -20px" align="center">
	  			<button style="margin-right: 290px;margin-top: 7px" type="button" id="addGoodsSizeButton" class="btn btn-primary" data-toggle="modal"   data-target="#addSizeModel">新增尺码</button>
	  			<div style="margin-top: -40px" id="News-Pagination"  align="center"></div>
		</div></td></tr>
	</table>
	
	<div class="modal fade" id="addSizeModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">添加尺码</h4>
	         </div>
	         <form action="size/insertSize.action" method="post">
	         <div class="modal-body">
    				<table align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="green" width="350px">
	    				<CAPTION style="font-size: 4ex;line-height: 50px">新增尺寸信息</CAPTION>
	    				<tr><td>商品类型：</td><td>
							<select name="goodType.goodTypeId" id="sizes" style="width: 150px"></select>
						</td></tr>
						<tr><td>尺寸大小：</td><td><input class="form-control" name="sizeName" id="sizeNames"/></td></tr>
    					<tr><td>尺寸说明：</td><td><textarea name="sizeRemark" class="form-control"></textarea></td></tr>
    				</table>
	         </div>
	         <div class="modal-footer">
	            <button type="button" id="closeAddSize" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="submit" id="addGoodsSizeSubmit" class="btn btn-primary">添加</button>
	         </div></form>
	      </div>
		</div>
	</div>
  </body>
</html>