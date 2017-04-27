<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>菜单修改</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <center>
  		<center><h2>修改菜单</h2></center>
  		<form action="Menu/updateMenuInfo.action" method="post">
  		<input type="hidden" name="menuId" value="${m.menuId}"/>
  			菜单名称:<input type="text" name="menuName" value="${m.menuName}"/><br><br>
	    	菜单路径:<input type="text" name="href" value="${m.href}" style="width:320px; height:30"/><br><br>
	    	target:<input type="text" name="target" value="${m.target}"/><br><br>
			<input type="submit" value="修改"/>
			<input type="reset" value="重置"/>
    	</form>
    </center>
  </body>
</html>
