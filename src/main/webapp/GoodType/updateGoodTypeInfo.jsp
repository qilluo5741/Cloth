<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateGoodTypeInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
     	<center><h2>修改商品类型</h2></center>
  		<form action="select/updateGoodTypeInfo.action" method="post">
  		<input type="hidden" name="goodTypeId" value="${goodt.goodTypeId }"/>
  			商品名称:<input type="text" name="goodTypeName" value="${goodt.goodTypeName}"/><br><br>
	    	商品备注:<input type="text" name="goodTypeRemark"  value="${goodt.goodTypeRemark}"/><br><br>
			<input type="submit" value="修改"/>
			<input type="reset" value="重置"/>
    	</form>
    </center>
  </body>
</html>
