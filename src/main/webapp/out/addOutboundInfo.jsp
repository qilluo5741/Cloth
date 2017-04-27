<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addOutboundInfo.jsp' starting page</title>
    
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
    <center><h2>添加出库记录</h2></center>
   <center>
   		<form action="select/insertOne.action" method="post">
   			请输入出库审核人:
				   			<select name="emp.empId">
					   			<c:forEach items="${emplist}" var="ept">
							   			<option value="${ept.empId}">${ept.empName}</option>
							   	</c:forEach>
						   	</select><br/>
   			请输入出库仓库:
				   			<select name="warehouse.warehouseId">
					   			<c:forEach items="${warlist}" var="wlt">
							   			<option value="${wlt.warehouseId}">${wlt.warehouseName}</option>
							   	</c:forEach>
						   	</select><br/>
   			请输入出库去向:
   							<select name="joiningTrader.joiningTraderId">
					   			<c:forEach items="${joinlist}" var="jit">
							   			<option value="${jit.joiningTraderId}">${jit.joiningTraderName}</option>
							   	</c:forEach>
					   		</select><br/>
   			请输入出库备注:<input type="text" name="outboundRemark"><br/>
   			<input type="submit" value="确定"><input type="reset" value="取消">
   		</form>
   </center>
  </body>
</html>
