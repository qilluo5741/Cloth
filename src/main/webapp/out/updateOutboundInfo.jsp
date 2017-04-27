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
    
    <title>My JSP 'updateOutboundInfo.jsp' starting page</title>
    
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
  		<center><h2>修改记录</h2></center>
 
    	<form action="select/updateOutboundInfo.action" method="post">
  			<input type="hidden" name="outboundId" value="${outb.outboundId }"/>
    		出库审核人:
				   	<select name="emp.empId">
		   					<c:forEach items="${emplist}" var="ept">
		   						<c:if test="${outb.emp.empId == ept.empId }">
		   							<option value="${ept.empId }" selected="selected">${ept.empName }</option>
		   						</c:if>
		   						<c:if test="${outb.emp.empId != ept.empId }">
		   							<option value="${ept.empId }">${ept.empName }</option>
		   						</c:if>
		   					</c:forEach>
		   				</select><br/>
   			出库仓库:
   						<select name="warehouse.warehouseId">
		   					<c:forEach items="${warlist}" var="wlt">
		   						<c:if test="${outb.warehouse.warehouseId == wlt.warehouseId }">
		   							<option value="${wlt.warehouseId }" selected="selected">${wlt.warehouseName }</option>
		   						</c:if>
		   						<c:if test="${outb.warehouse.warehouseId != wlt.warehouseId }">
		   							<option value="${wlt.warehouseId }">${wlt.warehouseName }</option>
		   						</c:if>
		   					</c:forEach>
		   				</select><br/>
   			出库去向:
   					<select name="joiningTrader.joiningTraderId">
		   					<c:forEach items="${joinlist}" var="jit">
		   						<c:if test="${outb.joiningTrader.joiningTraderId == jit.joiningTraderId }">
		   							<option value="${jit.joiningTraderId }" selected="selected">${jit.joiningTraderName }</option>
		   						</c:if>
		   						<c:if test="${outb.joiningTrader.joiningTraderId != jit.joiningTraderId }">
		   							<option value="${jit.joiningTraderId }">${jit.joiningTraderName }</option>
		   						</c:if>
		   					</c:forEach>
		   				</select><br/>
   			
    		出库备注:<input type="text" name="outboundRemark"  value="${outb.outboundRemark}"/><br>
			<input type="submit" value="修改"/>
			<input type="reset" value="重置"/>
    	</form>
    </center>
  </body>
</html>
