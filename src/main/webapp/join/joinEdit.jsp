<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>joinEdit.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table tr td{text-align: center;line-height: 30px;}
	</style>
  </head>
  
  <body>
    <form action="join/updateJoininfTraderByid.action" method="post">
     	<center><h2>添加加盟商</h2></center>
    	<input type="hidden" name="joiningTraderId" value="${joiningTrader.joiningTraderId}"/>
    	<table border="1" cellpadding="0" cellspacing="0" width="340px" bordercolor="green" align="center">
    	<tr><td>加盟商名称：</td><td><input name="joiningTraderName" value="${joiningTrader.joiningTraderName}" readonly="readonly"/></td></tr>
    	<tr><td>加盟商联系方式：</td><td><input name="joiningTraderTel" value="${joiningTrader.joiningTraderTel}"/></td></tr>
    	<tr><td>加盟商联系人：</td><td><input name="joiningTraderPeople" value="${joiningTrader.joiningTraderPeople}"/></td></tr>
    	<tr><td>加盟商所在地址：</td><td><input name="joiningTraderAddress" value="${joiningTrader.joiningTraderAddress}"/></td></tr>
    	<tr><td colspan="2"><input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick="window.history.go(-1);"/></td></tr>
    </table>
    </form>
  </body>
</html>
