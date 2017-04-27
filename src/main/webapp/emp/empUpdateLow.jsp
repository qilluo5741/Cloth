<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>empUpdateLow.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/uploadPreview.js"></script>
    <link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table{width:39%; text-align: center;}
		table tr{height: 35px;}
		ul{list-style: none;}
		#tx{height: 75px;}
	</style>
  </head>
  
  <body>
    <CENTER>
    	<form action="emp/updateOneLow.action" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="empId" value="${emp.empId }"/>
    		<center><h2>修改员工基本信息</h2></center>
	   		<table cellpadding="0" cellspacing="0">
	   			<tr><th>姓名</th><td><input name="empName" value="${emp.empName }" requred/></td></tr>
	   			<tr id="tx"><th>头像</th>
	   				<td align="left">
		   				<ul id="warp">
							<li>
			   					<img style="margin-left: -30px;margin-top: 10px;" id="imgShow_WU_FILE_0" name="empPhoto" src="images/${emp.empPhoto}" width="70" height="70"/>
								<input style="margin-left: 50px;margin-top: -60px;" type="file" id="up_img_WU_FILE_0" width="70px" name="imgEmp"/>
		   				  	</li>
		   				 </ul>
	   				</td>
	   			</tr>
				<tr><th>电话</th><td><input name="empTel" value="${emp.empTel }" requred/></td></tr>
				<tr><th>地址</th><td><input name="empAddress" value="${emp.empAddress }" requred/></td></tr>
				<tr><th>备注</th><td><input name="empRemark" value="${emp.empRemark }" requred/></td></tr>
				<tr><td colspan="2"><input value="确定修改" type="submit"/>&nbsp;&nbsp;<a href="emp/selectAllByPager.action">返回</a></td></tr>
	    	</table>
    	</form>
    </CENTER>
  </body>
</html>
