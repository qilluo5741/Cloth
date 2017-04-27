<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'supplierInsert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#supplier_btn_add").click(function(){
				var supplierName = $("#supplierName").val();
				var supplierPeople = $("#supplierPeople").val();
				var supplierAddress = $("#supplierAddress").val();
				$.ajax({
					url:"supplier/selectOne.action",
					type:"post",
					data:{
						supplierName:supplierName,
						supplierPeople:supplierPeople,
						supplierAddress:supplierAddress
						
					},
					dataType:"text",
					success:function(ref){
						if(ref == "true" || ref == true){
							alert("该供应商已经存在！");
							return false;
						}
						else{
							$("#myForm").submit();
						}
					}
				});
			});
		});
	</script>
  </head>
  
  <body>
    <form name="myForm" id="myForm" action="supplier/insert.action"  method="post" >
    	<center><h2>新增供应商</h2></center>
    	<table align="center" cellpadding="0" cellspacing="0" width="400" height="300">
    		<tr>
    			<td align="center">供应商名称：</td>
    			<td align="center"><input name="supplierName" id="supplierName" style="width: 230px;" /></td>
    		</tr>
    		<tr>
    			<td align="center">供联系人姓名：</td>
    			<td align="center"><input name="supplierPeople" id="supplierPeople" style="width: 230px;" /></td>
    		</tr>
    		<tr>
    			<td align="center">供应商地址：</td>
    			<td align="center"><input name="supplierAddress" id="supplierAddress" style="width: 230px;"/></td>
    		</tr>
    		<tr>
    			<td align="center">供应商电话：</td>
    			<td align="center"><input name="supplierTel" id="supplierTel" style="width: 230px;" /></td>
    		</tr>
    		<tr>
    			<td align="center">供应商备注：</td>
    			<td align="center"><textarea name="supplierRemark" id="supplierRemark" cols="25" rows="2">这家伙很懒,什么都没留下！</textarea></td>
    		</tr>
    		<tr>
    			<td align="center" colspan="2">
    				<input type="button" id="supplier_btn_add" value="添加"/>
    				&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
