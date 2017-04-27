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
    
    <title>goodsinsert.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		a{text-decoration: none;color: green;}
		.table_tr{text-align: center; width:100px;}
		table tr th{text-align: center;width:50px;}
		#th_tiao{width:200px;}
		ul{list-style: none;}
		#up_img_WU_FILE_0{margin-left: -30px;}
		input,select {height:30px; }
		select{ width: 155px;}
	</style>
	<script type="text/javascript" src="js/uploadPreview.js"></script>
  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript">
  		$(function(){
  			$.ajax({
					url:'size/selectAllToAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$.each(res, function(i, item) {
							$(".sizename").append(" <option value="+item.sizeId+">"+item.sizeName+"</option>")
						});
					}
				});
			$.ajax({
					url:'color/selectAllToAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$.each(res, function(i, item) {
							$(".colorname").append(" <option value="+item.colorId+">"+item.colorName+"</option>")
						});
					}
				});
			$(".code").click(function(){
				var count = $(".td_code").size();
				alert(count);
				var goodsNo=$(".goodsNo").val();
				var colorId=$(".colorname").val();
				var sizeId=$(".sizename").val();
				if(goodsNo==""||goodsNo==null){
					alert("请输入商品编号。。");
					return;
				}else{
					$.ajax({
						url:'code/produceCode.action?goodsNo='+goodsNo+'&colorId='+colorId+'&sizeId='+sizeId,
						type:'post',
						dataType:'text',
						success:function(res){
							$(".goodsCode").attr("src",'images/code/'+res);
							$(".hideCode").val(res);
							$(".code").hide();
						}
					});
				}
			});
			
			$(".sizename").one("click",function(){
				$.ajax({
					url:'size/selectAllToAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$.each(res, function(i, item) {
							$(".sizename").append(" <option value="+item.sizeId+">"+item.sizeName+"</option>")
						});
					},
					error:function(){alert("请求错误！")}
				});
				$.ajax({
					url:'color/selectAllToAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$.each(res, function(i, item) {
							$(".colorname").append("<option value="+item.colorId+">"+item.colorName+"</option>")
						});
					}
				});
			});
			$("#copy_tr").click(function(){
				$(".table_tr:last").after($($(".table_tr:last").clone(true)));
			});
  		});
  </script>
  </head>
  
  <body>
    	<form action="goods/insertGoods.action" method="post" enctype="multipart/form-data">
  			<center><h2>录入商品</h2>
  				
  			</center>
	   		<table border="1" cellpadding="0" cellspacing="0" bordercolor="green" align="center">
	   			<tr>
	   				<th>编号</th><th>名称</th><th>尺码</th><th>颜色</th><th id="th_tiao" >&nbsp;条&nbsp;&nbsp;形&nbsp;码</th><th>图片</th><th>进价</th><th>售价</th><th>数量</th><th>折扣</th><th>供应商</th><th>备注</th>
	   			</tr>
	   			<tr class='table_tr'>
	   				<td><input name="goodsNo" class="goodsNo" /></td><!-- 编号 -->
	   				<td><input name="goodsName"/></td><!-- 名称 -->
	   				<td><select name="sizeName" class="sizename"></select></td><!-- 尺码 -->
	   				<td><select name="colorName" class="colorname"></select></td><!-- 颜色 -->
	   				<td class="td_code">
	   					<span class="spans"> 
	   						<img class="goodsCode"/>
	   						<input type="hidden" name="goodsCode" class="hideCode"><!-- 条形码 -->
	   						<a class="code">生成条形码</a>
	   					</span>
	   				</td>
	   				<td style="text-align: left">
	   					<ul class="warp" style="width: 180px;">
	   						<li>
	   							<input type="file" id="up_img_WU_FILE_0" width="70px" name="imgGoods"/><!-- 商品图片 -->
	   						</li>
	   					</ul>
	   				</td>
	   				<td><input name="goodsInPrice"/></td><!-- 进价-->
	   				<td><input name="goodsOutPrice"/></td><!-- 售价 -->
	   				<td><input type="number" name="goodsNum"/></td><!-- 数量 -->
	   				<td><input name="goodsDiscount"/></td><!-- 折扣-->
	   				<td><input name="supplierName"/></td><!-- 供应商 -->
	   				<td>
						<textarea rows="1" cols="20" name="goodsRemark"></textarea><!-- 备注 -->
					</td>
	   			</tr>
				<tr>
					<td colspan="12" align="left">
						<input type="button" value="录入" title="点击添加所有信息" id="btn_enter" style="margin-left: 700px; margin-top: -35px;"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="images/xiangxia.jpg" title="点击向下添加一行" id="copy_tr" style="margin-top: 5px;"/>
					</td>
				</tr>
	    	</table>	
    	</form>
  </body>
</html>
