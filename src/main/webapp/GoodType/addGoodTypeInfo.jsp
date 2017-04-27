<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoodTypeInfo.jsp' starting page</title>
    
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
    <center><h2>添加商品类型</h2></center>
   <center>
   		<form action="select/addGoodTypeInfo.action" method="post">
   			请输入商品名称:<input type="text" name="goodTypeName"><br/>
   			请输入商品备注:<input type="text" name="goodTypeRemark"><br/>
   			<input type="submit" value="确定"><input type="reset" value="取消">
   		</form>
   </center>
  </body>
</html>
