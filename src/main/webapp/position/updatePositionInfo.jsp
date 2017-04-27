<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePositionInfo.jsp' starting page</title>
    
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
  		<center><h2>修改职位</h2></center>
  		<form action="select/updatePositionInfo.action" method="post">
  		<input type="hidden" name="positionId" value="${posi.positionId }"/>
  			商品名称:<input type="text" name="positionName" value="${posi.positionName}"/><br><br>
	    	商品备注:<input type="text" name="positionRemark"  value="${posi.positionRemark}"/><br><br>
			<input type="submit" value="修改"/>
			<input type="reset" value="重置"/>
    	</form>
    </center>
  </body>
</html>
