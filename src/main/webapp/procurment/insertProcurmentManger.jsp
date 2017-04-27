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
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
  </head>
  <body style="background-image: url('images/img/Redocn_2012040202565239.jpg'); background-size:100%; ">
  	<center><h3>添加采购</h3></center>
  <form action="Procure/addprocurment.action" method="post">
  	 <table align="center" cellpadding="0" cellspacing="0" width="400" height="300">
    		<tr>
    			<td align="center">供应人员:</td>
    			<td align="center">
	    			<select name="supplier.supplierId">
						<option selected="selected" style="width: 120">======请选择======</option>
	   					<c:forEach items="${suppList}" var="supp">
	   						<option value="${supp.supplierId}" style="width: 120">${supp.supplierName}</option>
	   					</c:forEach>
			   		</select>
				</td>
    		</tr>
    		<tr>
    			<td align="center">采购人员：</td>
    			<td align="center">
					<select name="emp.empId">
						<option selected="selected" style="width: 120">======请选择======</option>
	   					<c:forEach items="${empList}" var="e">
	   						<option value="${e.empId}" style="width: 120">${e.empName}</option>
	   					</c:forEach>
		   			</select>
				</td>
    		</tr>
    		<tr>
    			<td align="center">采购备注:</td>
    			<td align="center"><textarea name="procuremenRemark" cols="20" rows="2">这家伙很懒,什么都没留下！</textarea></td>
    		</tr>
    		<tr>
	    		<td align="center" colspan="2">
	    			<input type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消">
	    		</td>
    		</tr>
   		</table>
   	</form>
  </body>
</html>
