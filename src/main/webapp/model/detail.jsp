<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
	<title>商品详情</title>
	<script type="text/javascript" src="../js/jquery-1.11.3.js"></script>
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<style type="text/css">
		.goodsimages{border: solid 2px black}
		#myModal{margin-top: 210px;margin-left: 420px;width: 450px}
		.modal-body{text-align: center;}
		.goodstitle{font-size: 24px;}
		.btn-success,.btn-info{background-color: #E0E0E0;color: black}
	</style>
	<script type="text/javascript">
		$(function(){
			$(".goodsimages").hover(function(){
				$("#showImg").attr("src","../images/"+$(this).attr("goodsImg"));
			});
			$("#addCart").click(function(){
			    $("#myModal").show();
			});
			$(".btn-info").click(function(){
				$("#sizeNames").val($(this).attr("sizeName"));
				$(".btn-info").css("background","#FCFCFC");
				$(this).css("background","#97CBFF");
			});
			$(".btn-success").click(function(){
				var sizeName= $("#sizeNames").val();
				var colorName=$(this).val();
				var goodsName=$("#goodsName").html();
				$.ajax({
					url:'../goodsInventory/selectGoodsNum.action',
					data:{"sizeName":sizeName,"colorName":colorName,"goodsName":goodsName},
					type:"post",
					dataType:'text',
					success:function(res){
						$("#goodsNum").html(res);
						arr=res.split(',');//注split可以用字符或字符串分割  
						for(var i=0;i<arr.length;i++)   
						{   
							alter(arr[i]);  
						} 
					}
				});
			});
		});
	</script>
</head>

<body>
<div align="center">
<p align="center">
	<img height="70" src="../images/index/goodsInformation.jpg" width="750" /></p>
<table align="center" bgcolor="#ffffff" class="" width="750">
	<tbody>
		<tr>
			<td align="center" rowspan="11" valign="top" width="267" bgcolor="black">
				<a href="../images/${goods.goodsImg}" class="jqzoom" rel='gal1'><img height="330" id="showImg" src="../images/${goods.goodsImg}" width="220px" /></a>
				</td>
			<td colspan="2" height="30" valign="top">
				<img height="23" src="../images/index/producemsg.jpg" width="310" /></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 品&nbsp; 名：</font></strong></td>
			<td height="30" width="230">
				<font color="#666666" face="微软雅黑">${goods.goodsName}</font></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 型&nbsp; 号：</font></strong></td>
			<td height="40" width="230">
				<font color="#666666" face="微软雅黑">${goods.goodsNo}</font></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 风&nbsp; 格：</font></strong></td>
			<td height="30" width="230">
				<font color="#666666" face="微软雅黑">时尚</font></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 颜&nbsp; 色：</font></strong></td>
			<td height="40" width="230">
				<font color="#666666" face="微软雅黑">
				<c:forEach items="${glist}" var="goods">
					${goods.color.colorName}&nbsp;
				</c:forEach></font></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 面&nbsp; 料：</font></strong></td>
			<td height="40" width="230">
				<font color="#666666" face="微软雅黑">100%Lamb Wool</font></td>
		</tr>
		<tr>
			<td height="40" width="80">
				<strong><font color="#8cd3c3" face="微软雅黑">&nbsp; 尺&nbsp; 寸：</font></strong></td>
			<td height="40" width="230">
				<font color="#666666" face="微软雅黑">
					<c:forEach items="${glist}" var="goods">
					${goods.size.sizeName}&nbsp;
				</c:forEach>
				</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<img id="addCart" src="../images/index/addcart.gif" data-toggle="modal"   data-target="#myModal"/>&nbsp;&nbsp;&nbsp;<img src="../images/index/nowbuy.gif"/>
			</td>
		</tr>
		<tr height="90px" style="margin-left: -350px;position: absolute;">
			<td colspan="2" valign="top" width="100%" bgcolor="gray">
				<c:forEach var="goods" items="${glist}">
					<img class="goodsimages" goodsImg="${goods.goodsImg}" width="60px" height="80px" src="../images/${goods.goodsImg}"/>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
<table align="center" bgcolor="#ffffff" border="0" cellspacing="0" class="" width="750" style="margin-top: 70px">
	<tbody>
		<tr>
			<td colspan="4" height="14" width="750">&nbsp;
		  </td>
		</tr>
		<tr>
			<td height="40" width="25">
			</td>
			<td height="40" width="90">
				<font color="#8cd3c3" face="微软雅黑"><strong><img height="10" src="" style="margin: 0px; width: 10px; height: 25px; float: none;" width="10" />设计理念</strong></font></td>
			<td align="left" height="40" width="605">
				<font color="#666666" face="微软雅黑">超赞韩版风格设计，上身效果服帖自然，如量身定做般服帖合体.美观大方，魅力十足</font></td>
			<td align="left" height="40" width="30">
			</td>
		</tr>
		<tr>
			<td colspan="4" height="24">
				<img height="24" src="../images/index/bottom.jpg" style="margin: 0px; width: 750px; height: 24px; float: none;" width="750" /></td>
		</tr>
		<tr>
			<td colspan="4" height="24">&nbsp;
		  </td>
		</tr>
	</tbody>
</table>

	<div class="modal fade" align="right" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" style="margin-right: 156px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 align="left" class="modal-title" id="myModalLabel">加入购物车</h4>
	         </div>
	         <div class="modal-body">	         
	      	        <input type="hidden" id="goodsId">
	        	 	<table style="margin-left: 60px;line-height: 45px">
	        	 		<tr><td rowspan="6">
	        	 			<img id="detailgoods"/>
	        	 		</td></tr>
	        	 		<tr>
	        	 			<td>名称：</td><td><font size="5px" id="goodsName">${goods.goodsName}</font></td>
	        	 		</tr>
	        	 		<tr>
	        	 			<td>库存：</td><td><font id="goodsNum"></font></td>
	        	 		</tr>
	        	 		<tr>
	        	 			<td>尺寸：</td><td>
	        	 				<input type="hidden" id="sizeNames">
	        	 				<div class="btn-group">
	        	 					<c:forEach items="${glist}" var="goods">
									<input type="button" sizeName="${goods.size.sizeName}" class="btn btn-info" value="${goods.size.sizeName}">
						  		</c:forEach>
	        	 				</div>
	        	 			</td>
	        	 		</tr>
	        	 		<tr>
	        	 			<td>颜色：</td><td>
	        	 				<c:forEach items="${glist}" var="goods">
									<input type="button" class="btn btn-success" value="${goods.color.colorName}">
						  		</c:forEach>
	        	 			</td>
	        	 		</tr>
	        	 		<tr><td>数量：</td>
	        	 			<td><input type="number" style="height: 30px;width:75px;text-align: center" width="75px"/></td>
	        	 		</tr>
	        	 	</table>
	         </div>
	         <div class="modal-footer" style="margin-right: 156px">
	            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	            <button type="button" id="updateGoodsSubmit" class="btn btn-primary"> 加入购物车</button>
	         </div>
	      </div>
		</div>
	</div>
</body>
</html>

