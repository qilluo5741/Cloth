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
    
    <title>empUpdateHigh.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width: 30%; text-align: center;}
		table tr{height: 35px;}
		select{width: 155px;}
	</style>
  </head>
  
  <body>
    <CENTER>
    	<form action="emp/updateOneHigh.action" method="post">
    		<input type="hidden" name="empId" value="${emp.empId }"/>
    		<center><h2>修改员工高级信息</h2></center>
	   		<table cellpadding="0" cellspacing="0" >
	   			<tr><th>工资：</th><td><input name="empSal" value="${emp.empSal }" required/></td></tr>
	   			<tr><th>职位:</th>
	   				<td>
		   				<select name="position.positionId">
		   					<c:forEach items="${posList}" var="pos">
		   						<c:if test="${emp.position.positionId == pos.positionId }">
		   							<option value="${pos.positionId }" selected="selected">${pos.positionName }</option>
		   						</c:if>
		   						<c:if test="${emp.position.positionId != pos.positionId }">
		   							<option value="${pos.positionId }">${pos.positionName }</option>
		   						</c:if>
		   					</c:forEach>
		   				</select>
		   			</td>
	   			</tr>
	   			<tr><th>就职状态:</th>
	   				<td>
		   				<select name="isServing">
		   					<c:choose>
		   						<c:when test="${emp.isServing == 0}">
		   							<option value="0" selected="selected">在职</option>
		   							<option value="1">离职</option>
		   							<option value="2">解雇</option>
		   						</c:when>
		   						<c:when test="${emp.isServing == 1}">
		   							<option value="0">在职</option>
		   							<option value="1" selected="selected">离职</option>
		   							<option value="2">解雇</option>
		   						</c:when>
		   						<c:otherwise>
		   							<option value="0">在职</option>
		   							<option value="1">离职</option>
		   							<option value="2" selected="selected">解雇</option>
		   						</c:otherwise>
		   					</c:choose>
		   				</select>
		   			</td>
	   			</tr>
				<tr><td colspan="2"><input value="确定修改" type="submit"/>&nbsp;&nbsp;<a href="emp/selectAllByPager.action">返回</a></td></tr>
	    	</table>
    	</form>
    </CENTER>
  </body>
</html>
