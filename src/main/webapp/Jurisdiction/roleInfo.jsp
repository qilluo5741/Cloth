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
    
    <title>角色管理</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </head>
  	
  <body>
   		 
  		 <button type="button" id="addBtn" class="btn btn-success">添加角色</button>
  		  <button type="button" id="closeBtn" class="btn btn-success">取消操作</button>
  	 	<div id="add" align="center" style="width: 100%;display:none;">
  	 		<div class="input-group">
		         <input id="role_name" type="text" class="form-control">
		         <span class="input-group-addon" id="addSbm" style="cursor: pointer;">添加角色</span>
		         <span class="input-group-addon" id="quxiao" style="cursor: pointer;">取消</span>
		      </div>
  	 	</div>
  	 	<script type="text/javascript">
  	 		$(function(){
  	 			$("#closeBtn").click(function(){
  	 				//刷新
					location.reload();
  	 			});
  	 			$("#addBtn").click(function(){
  	 				$("#role_name").val("")
  	 				$("#add").show(1000);
  	 			});
  	 			$("#quxiao").click(function(){
  	 				$("#add").hide(1000);
  	 			})
  	 			$("#addSbm").click(function(){
  	 				//验证是否为空
  	 				var role_name=$("#role_name").val();
  	 				if(role_name!=""){
	  	 				//添加
	  	 				$.ajax({
								url:'jurisdiction/addReole.action',
								data:{"roleName":role_name},
								type:"post",
								success:function(res){
									if(res=="0"){
										alert("添加成功！");	
									}
									else{
										alert("添加失败！");
									}
									//刷新
									 location.reload();
								}
							});
  	 				}
  	 				else{
  	 					alert("不能为空哟！");
  	 				}
  	 			});
  	 		});	
  	 	</script>
  		<table align="center" class="table">
		   <caption>角色管理</caption>
		  
		   <tbody>
		      <c:forEach items="${role}" var="role">
		       <tr class="success">
		         <td class="roleName" id="${role.roleId }_update">${role.roleName }</td>
		         <td align="center">
		         	<img src="images/leftico03.png"/>&nbsp;&nbsp;
					<span style="cursor: pointer;color:green;" class="update" id="${role.roleId }">修改</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<img width="20px;" src="images/leftico01.png"/>&nbsp;&nbsp;
					<span style="cursor: pointer;color:blue;" class="roleMenu" id="${role.roleId }" >分配菜单</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<img width="20px;" src="images/delete.jpg"/>&nbsp;&nbsp;
					<span style="cursor: pointer;color:red;" class="delete" id="${role.roleId }" >删除</span>
		   		 </td>
		      </tr>
		     </c:forEach>
		   </tbody>
		</table>
  		<script type="text/javascript">
  			$(function(){
  			$(".roleMenu").click(function(){
  			window.location.href="jurisdiction/getRoleMenu.action?roleId="+$(this).attr("id");
  			});
  				//点击修改
  				$(".update").click(function(){
  					//alert($(this).attr("id"));
  					//取消一个正在编辑的文本
  					$(".roleName").each(function(){
  						$(this).html($(this).children("div").children("input").attr("placeholder"));
  					});
  					var $name=$("#"+$(this).attr("id")+"_update");
  					//添加一个文本框
  					$name.html(" <div  style='width:50%'  class=\"input-group\">"+
		               "<input type=\"text\" placeholder="+$name.html()+" class=\"form-control\">"+
		               "<span class=\"input-group-btn\">"+
		                 " <button class=\"btn btn-default\" id="+$(this).attr("id")+" onclick=\"javascript:$.update(this)\"  type=\"button\">修改</button>"+
		               "</span>"+
		           "</div>");
  				})
  				//点击删除
  				$(".delete").click(function(){
  					if(confirm("确认删除吗？")){
  						$.ajax({
								url:'jurisdiction/deleteReole.action',
								data:{"roleId":$(this).attr("id")},
								type:"post",
								success:function(res){
									if(res=="0"){
										alert("删除成功！");	
									}
									else{
										alert("删除失败！请先删除其他相关联数据！");
									}
									//刷新
									 location.reload();
								}
							});
  					 }
  				})
  				//修改
  				$.update=function(obj){
  					var text=$(obj).parent().parent().children("input").val();
  					 
  					 if(text!=""){
  						 if(confirm("确认修改吗？")){
	  						//执行修改
	  						$.ajax({
								url:'jurisdiction/updateReole.action',
								data:{"roleId":obj.id,"roleName":text},
								type:"post",
								success:function(res){
									if(res=="0"){
										alert("修改成功！");	
									}
									else{
										alert("修改失败！");
									}
									//刷新
									 location.reload();
								}
							});
  					}
  				}
				else{
					 alert("名字不能为空！");
				}
  				}
  			})
  		</script>
  </body>
</html>
