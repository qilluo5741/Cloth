<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册加盟商</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
  </head>
  <body>
  	 <form action="" method="post">
  	 <br><br><br><br><br>
  	 <table align="center" cellpadding="0" cellspacing="0" width="600" height="400">
    		<tr>
    			<td align="center">加盟类型:</td>
    			<td align="center">
	    		<select name="">
						<option selected="selected" style="width: 120">======请选择======</option>
	   			</select>
				</td>
    		</tr>
    		<tr>
    			<td align="center">加盟期限:</td>
    			<td align="center">
	    			<select name="">
						<option selected="selected" style="width: 120">======请选择======</option>
		   			</select>
	   			</td>
    		</tr>
    		<tr>
    			<td align="center">加盟年限:</td>
    			<td align="center">
	    			<select name="">
						<option selected="selected" style="width: 120">======请选择======</option>
		   			</select>
	   			</td>
    		</tr>
    		<tr>
    			<td align="center">加盟名字:</td>
    			<td align="center"><input name="" value=""/></td>
    		</tr>
    		<tr>
    			<td align="center">加盟资金:</td>
    			<td align="center"><input name="" value=""/></td>
    		</tr>
    		<tr>
    			<td align="center">加盟资金:</td>
    			<td align="center"><input name="" value=""/></td>
    		</tr>
    		<tr>
    			<td align="center">加盟地点:</td>
    			<td align="center"><input name="" value=""/></td>
    		</tr>
    		<tr>
    			<td align="center">用户账号:</td>
    			<td align="center"><input name="" value=""/></td>
    		</tr>
    		<tr>
	    		<td align="center" colspan="2">
	    			<input type="submit" value="&nbsp;&nbsp;确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<input type="reset" value="&nbsp;&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;&nbsp;">
	    		</td>
    		</tr>
   		</table>
   	</form>
  </body>
</html>
