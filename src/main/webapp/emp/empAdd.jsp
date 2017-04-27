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
    <title>empAdd.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width: 60%; text-align: center;}
		table tr{height: 35px;}
		select{width: 155px;}
		#tr_1{height: 80px;}
		#v_img{margin-top: 0px;margin-left: 0px;}
		ul{list-style: none;}
		#up_img_WU_FILE_0{margin-left: 50px;}
	</style>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/uploadPreview.js"></script>
  </head>
  
  <body>
    <CENTER>
    	<br/><br/>
    	<form action="emp/insertOne.action" method="post" enctype="multipart/form-data">
    		<center><h2>添加员工</h2></center>
	   		<table cellpadding="0" cellspacing="0" >
	   			<tr>
	   				<th>姓名：</th><td><input name="empName" requred/></td>
	   				<th>年龄：</th><td><input name="empAge" requred/></td>
	   			</tr>
	   			<tr id="tr_1">
	   				<th>性别：</th>
	   				<td>
	   					&nbsp;&nbsp;<input name="empGender" type="radio" checked="checked" value="男"/>男<br/>
	   					&nbsp;&nbsp;<input name="empGender" type="radio" value="女"/>女
	   				</td>
	   				<th>头像:</th>
					<td align="left">
						<ul id="warp">
							<li>
								<img style="margin-top: 20px;" id="imgShow_WU_FILE_0" name="empPhoto" src="images/noimg.gif" width="70" height="70"/>
								<input style="margin-left: -5px;margin-top: -30px;" type="file" id="up_img_WU_FILE_0" width="70px" name="imgEmp"/>
							</li>
						</ul>
	   				</td>
	   			</tr>
	   			<tr>
	   				<th>工资：</th><td><input name="empSal" requred/></td>
					<th>身份证号：</th><td><input name="empCardNo" requred/></td></tr>
				<tr>
					<th>电话:</th><td><input name="empTel" requred/></td>
					<th>职位:</th>
					<td>
						<select name="position.positionId">
							<option selected="selected">======请选择======</option>
		   					<c:forEach items="${posList}" var="pos">
		   						<option value="${pos.positionId }">${pos.positionName }</option>
		   					</c:forEach>
		   				</select>
					</td>
				</tr>
				<tr>
					<th>地址:</th><td><input name="empAddress" requred/></td>
					<th>备注:</th><td><input name="empRemark" requred/></td>
				</tr>
				<tr><td colspan="4"><input value="添加" type="submit"/>&nbsp;&nbsp;<a href="emp/selectAll.action">返回</a></td></tr>
	    	</table>
    	</form>
    </CENTER>
  </body>
</html>
