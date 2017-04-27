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
    
    <title>goodsInventoryAddNew.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width: 25%; text-align: center;}
		table tr{height: 35px;}
		select{width: 155px;}
	</style>
  </head>
  
  <body>
    <center>
   		<form action="goodsInventory/insertOne.action" method="post">
  			<center><h2>添加新商品入库</h2></center>
	   		<table border="1" cellpadding="0" cellspacing="0" bordercolor="green">
	   			<tr>
	   				<th>商品名称：</th>
	   				<td>
		   				<select name="goodsName">
							<option selected="selected">=======请选择=======</option>
		   					<c:forEach items="${goodsList}" var="goods">
		   						<option value="${goods.goodsName }">${goods.goodsName }</option>
		   					</c:forEach>
			   			</select>
		   			</td>
	   			</tr>
				<tr>
					<th>颜色:</th>
					<td>
						<select name="colorName">
							<option selected="selected">=======请选择=======</option>
		   					<c:forEach items="${colorList}" var="color">
		   						<option value="${color.colorName }">${color.colorName }</option>
		   					</c:forEach>
		   				</select>
					</td>
				</tr>
				<tr><th>尺码:</th>
					<td>
						<select name="sizeName">
							<option selected="selected">=======请选择=======</option>
		   					<c:forEach items="${sizeList}" var="size">
		   						<option value="${size.sizeName }">${size.sizeName }</option>
		   					</c:forEach>
		   				</select>
					</td>
				</tr>
				<tr><th>所在仓库:</th>
					<td>
						<select name="warehouse.warehouseId">
							<option selected="selected">=======请选择=======</option>
		   					<c:forEach items="${whList}" var="wh">
		   						<option value="${wh.warehouseId }">${wh.warehouseName }</option>
		   					</c:forEach>
		   				</select>
					</td>
				</tr>
				<tr><th>进货数:</th><td><input name="goodsNum" requred/></td></tr>
				<tr><td colspan="2"><input value="进货" type="submit"/>&nbsp;&nbsp;<a href="goodsInventory/selectAllByPager.action">返回</a></td></tr>
	    	</table>
	    </form>
    </center>
  </body>
</html>
