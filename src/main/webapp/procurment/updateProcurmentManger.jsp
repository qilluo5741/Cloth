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
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<center><h2>修改采购消息</h2></center>
   <center>
   		<form action="Procure/updateprocurment.action" method="post">
   		<input type="hidden" name="procurementId" value="${p.procurementId}"/>
   				供应人员:
    			<select name="supplier.supplierId">
							<option selected="selected">======请选择======</option>
		   					<c:forEach items="${suppList}" var="supp">
		   						<option value="${supp.supplierId}">${supp.supplierName}</option>
		   					</c:forEach>
		   		</select><br/>
    			采购人员:
    			<select name="emp.empId">
							<option selected="selected">======请选择======</option>
		   					<c:forEach items="${empList}" var="e">
		   						<option value="${e.empId}">${e.empName}</option>
		   					</c:forEach>
		   		</select><br/>
  				采购备注:<input type="text" name="procuremenRemark" value="${p.procuremenRemark}"/><br><br>
   			<input type="submit" value="确定"><input type="reset" value="取消">
   		</form>
   </center>
  </body>
</html>
