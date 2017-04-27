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
    
    <title>查询所有的商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<style type="text/css">
		table tr th{text-align: center}
	</style>
 	 <script type="text/javascript">

		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#goodsForm").attr("action", "goods/queryallBypager.action?pageIndex="+(new_page_index+1));
		    $("#goodsForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pagerGoods.totalRecords}, {
		        items_per_page:${pagerGoods.pageSize}, // 每页显示多少条记录
		        current_page:${pagerGoods.pageIndex}- 1, // 当前显示第几页数据
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
	  <c:if test="${empty pagerGoods}">
	  	<c:redirect url="/goods/queryallBypager.action"></c:redirect>
	  </c:if>
	  <center><h2>商品信息</h2></center>
	  <table cellpadding="0" cellspacing="0" width="100%" >
		<tr style="line-height: 35px">
			<th>商品编号</th><th>商品名称</th><th>商品尺寸</th><th>商品颜色</th><th>商品数量</th><th>条形码</th>
			<th>商品图片</th><th>商品进价</th><th>商品售价</th><th>商品折扣</th><th>商品说明</th><th>编辑</th>
		</tr>
	    <c:forEach items="${pagerGoods.list}" var="goods">
	    	<tr>
	    		<td>${goods.goodsNo}</td><!-- 商品编号 -->
	    		<td>${goods.goodsName}</td><!-- 商品名称 -->
	    		<td>${goods.size.sizeName}</td><!-- 商品尺寸 -->
	    		<td>${goods.color.colorName}</td><!-- 商品颜色 -->
	    		<td>${goods.goodsNum}</td><!-- 商品数量 -->
	    		<td>
	    			<img src="images/code/${goods.goodsCode}"/><!-- 条形码 -->
	    		</td>
	    		<td>
	    			<img src="images/${goods.goodsImg}" width="100" height="80"/><!-- 商品图片 -->
	    		</td>
	    		<td>${goods.goodsInPrice}</td><!-- 商品进价 -->
	    		<td>${goods.goodsOutPrice}</td><!-- 商品售价 -->
	    		<td>${goods.goodsDiscount}</td><!-- 商品折扣-->
	    		<td>${fn:substring(goods.goodsRemark,0,11)}...</td><!-- 商品说明 -->
	    		<td>
	    			<span class="updateGoods" goodsCode="${goods.goodsCode}" goodsId="${goods.goodsId}" goodsNo="${goods.goodsNo}" goodsName="${goods.goodsName}" goodsOutPrice="${goods.goodsOutPrice}" goodsDiscount="${goods.goodsDiscount}" goodsRemark="${goods.goodsRemark}"  style="cursor:pointer;">修改</span>
	    		</td><!-- 商品编辑 -->
	    	</tr>
	    </c:forEach>
     <tr><td colspan="12" align="center">
  		<form id="goodsForm"  method="post"></form>
 		 <div style="margin-left: -50px;height: 50px; margin-top: -20px" align="center">
	  			<div style="" id="News-Pagination"  align="center"></div>
		</div>
     </td></tr>
	</table>
	
	<!-- 修改商品 -->
	<script type="text/javascript">
  	$(function(){
  		$(".updateGoods").click(function(){
  			//设置修改的值
  			 $("#goodsId").val($(this).attr("goodsId"));//商品编号
  			 $("#goodsNo").val($(this).attr("goodsNo"));//商品编号
  			 $("#goodsName").val($(this).attr("goodsName"));//商品名称
  			 $("#goodsOutPrice").val($(this).attr("goodsOutPrice"));//商品售价
  			 $("#goodsDiscount").val($(this).attr("goodsDiscount"));//商品折扣
  			 $("#goodsRemark").val($(this).attr("goodsRemark"));//商品标记
  			 $("#goodsCode").attr("src","images/code/"+$(this).attr("goodsCode"));//商品标记
  			 $("#goodsCode").attr("class",$(this).attr("goodsCode"));//商品标记
  			 $("#updateGoodsModel").click();
  		});
  	})
  </script>
	
	
	<!-- 修改商品信息 -->
	
	<button style="display: none;" id="updateGoodsModel" class="btn btn-primary btn-lg" data-toggle="modal" 
   		data-target="#myModal">
	</button>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
	         </div>
	         <div class="modal-body">
	        	 <input type="hidden" id="goodsId">
	          		商品编号：<input type="text" class="form-control" id="goodsNo" readonly="readonly">
	          		<br/>
	          		商品名称：<input type="text" class="form-control" style="width: 150px" id="goodsName" readonly="readonly">
	          		<span style="margin-left: 230px;margin-top: -40px;position: absolute">商品条形码：<img id="goodsCode"/></span><br/>
	          		商品售价：<input type="text" class="form-control" id="goodsOutPrice" placeholder="请输入"><br/>
	          		商品折扣：<input type="text" class="form-control" id="goodsDiscount" placeholder="请输入"><br/>
	          		商品标记：<textarea type="text"  class="form-control" id="goodsRemark" placeholder="请输入"></textarea>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="button" id="updateGoodsSubmit" class="btn btn-primary"> 修改</button>
	         </div>
	      </div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#updateGoodsSubmit").click(function(){
				//验证内容是否为空
				var goodsId=$("#goodsId").val();
				var goodsNo=$("#goodsNo").val();//商品编号
  			    var goodsName=$("#goodsName").val();//商品名称
  			    var goodsOutPrice=$("#goodsOutPrice").val();//商品售价
  			    var goodsDiscount= $("#goodsDiscount").val();//商品折扣
  			    var goodsRemark=$("#goodsRemark").val();//商品标记
  			    var goodsCode=$("#goodsCode").attr("class");//商品标记
  			 	//执行修改
  			 	$.ajax({
					url:'goods/updateGoodsByid.action',
					data:{"goodsId":goodsId,"goodsNo":goodsNo,"goodsName":goodsName,"goodsOutPrice":goodsOutPrice,"goodsDiscount":goodsDiscount,"goodsRemark":goodsRemark,"goodsCode":goodsCode},
					type:"post",
					success:function(res){
						if(res=="0"){
							alert("修改成功！");	
						}
						else{
							alert("修改失败！");
						}
						//刷新
						window.location.href=window.location.href;
					}
				});
			});
		});
	</script>
  </body>
</html>
