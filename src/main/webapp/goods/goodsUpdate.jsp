<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>goodsUpdate.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
		table tr td{line-height: 30px;}
		.goo{text-align:left;margin-left:30px;}
	</style>
  </head>
  
  <body>
    <form action="goods/updateGoodsByid.action" method="post">
    	<input type="hidden" name="goodsId" value="${goods.goodsId}"/>
  		<center><h2>修改商品信息</h2></center>
    	<table border="1" cellpadding="0" cellspacing="0" width="540px" bordercolor="green" align="center">
    	<tr><td>商品名称：</td><td><input class="goo" name="goodsName" value="${goods.goodsName}"/></td></tr>
    	<tr><td>商品数量：</td><td><input class="goo" name="goodsNum" value="${goods.goodsNum}"/></td></tr>
    	<tr><td>商品条形码：</td><td><input class="goo" name="goodsCode" value="${goods.goodsCode}"/></td></tr>
    	<tr><td>商品售价：</td><td>&nbsp;&nbsp;&nbsp;￥<input name="goodsOutPrice" value="${goods.goodsOutPrice}" width="56px" style="width: 56px;text-align: center;"/>元</td></tr>
    	<tr><td>商品折扣：</td><td><input class="goo" name="goodsDiscount" value="${goods.goodsDiscount}"/></td></tr>
    	<tr><td>商品说明：</td><td><textarea rows="2" cols="50" name="goodsRemark">${goods.goodsRemark}</textarea></td></tr>
    	<tr><td colspan="2" align="center"><input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="window.history.go(-1);"/></td></tr>
    </table>
    </form>
  </body>
</html>
