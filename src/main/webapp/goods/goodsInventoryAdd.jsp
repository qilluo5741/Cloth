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
    
    <title>goodsAdd.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width: 25%; text-align: center;}
		table tr{height: 35px;}
	</style>
  </head>
  
  <body>
    <center>
    	<c:if test="${!empty gi}">
    		<form action="goodsInventory/updateOneAdd.action" method="post">
		    	<input type="hidden" name="goodsInventoryId" value="${gi.goodsInventoryId }"/>
  				<center><h2>现有商品入库</h2></center>
		   		<table border="1" cellpadding="0" cellspacing="0" bordercolor="green">
		   			<tr><th>商品名称：</th><td><input readonly="readonly" name="goodsName" value="${gi.goodsName }"/></td></tr>
					<tr><th>颜色:</th><td><input readonly="readonly" name="colorName" value="${gi.colorName }"/></td></tr>
					<tr><th>尺码:</th><td><input readonly="readonly" name="sizeName" value="${gi.sizeName }"/></td></tr>
					<tr><th>所在仓库:</th><td><input readonly="readonly" name="warehouse.warehouseId" value="${gi.warehouse.warehouseName }"/></td></tr>
					<tr><th>进货数:</th><td><input name="num" requred/></td></tr>
					<tr><td colspan="2"><input value="进货" type="submit"/>&nbsp;&nbsp;<a href="goodsInventory/selectAllByPager.action">返回</a></td></tr>
		    	</table>
		    </form>
    	</c:if>
    </center>
  </body>
</html>
