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
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   <center>
  		<center><h2>修改用户</h2></center>
  		<form action="User/updateUserInfo.action" method="post">
  		<input type="hidden" name="userId" value="${user.userId}"/>
   			用户昵称：<input type="text" name="userName" value="${user.userName}"/><br><br>
   			用户密码：<input type="password" name="userPwd" value="${user.userPwd}"/><br><br>
   			权限审核：
   			<select name="userStatus" style="width:150">
				<option value="0">审核中</option>
				<option value="1">成功</option>
				<option value="2">失败</option>
		   	</select><br/><br>
   			用户备注：<input type="text" name="userRemark" value="${user.userRemark}"/><br><br>
   			角色昵称：
   			<select name="role.roleId" style="width:150">
   					<c:forEach items="${Ijur}" var="i">
   						<option value="${i.roleId}">${i.roleName}</option>
   					</c:forEach>
		   	</select><br/>
			<input type="submit" value="修改"/>
			<input type="reset" value="重置"/>
    	</form>
    </center>
  </body>
</html>
