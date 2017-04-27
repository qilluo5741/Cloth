<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单分配</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
  </head>
  
  <body>
   <table class="table">
   <caption>角色信息</caption>
   <thead>
      <tr>
         <th>角色名称</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>${roleInfo.roleName}</td>
      </tr>
     
   </tbody>
</table>
		   <!-- 按钮触发模态框 -->
<button  id="showModel" name="${roleInfo.roleId}" class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal">给此用户分配菜单
</button>

  <table align="center" class="table">
		   <caption>用户菜单已分配</caption>
		 	 <tr>
		      		<th>菜单类型</th>
		      		<th>菜单名称</th>
		      		<th>菜单地址</th>
		      		<th>target</th>
		      		<th>操作</th>
		     </tr>
		   <tbody>
		   <c:if test="${empty roleInfo.menuRole}">
		   		<tr class="success">
		   			<td colspan="5" align="center" style="color: red">还没有分配权限哟！</td>
		   		</tr>
		   </c:if>
		      <c:forEach items="${roleInfo.menuRole}" var="mr">
		      <tr class="success">
		         <td class="">${mr.menu.menuType.menuTypeName}</td>
		         <td >${mr.menu.menuName}</td>
		         <td >${mr.menu.href}</td>
		         <td >${mr.menu.target}</td>
		          <td>
		          <img width="20px;" src="images/delete.jpg"/>&nbsp;&nbsp;
						<span class="delete" style="cursor:pointer;color: red"  id="${mr.rmid}" >删除管理菜单</span>
				  </td>
		      </tr>
		     </c:forEach>
		   </tbody>
		   </table>
		   <script type="text/javascript">
		   	$(function(){
		   		$(".delete").click(function(){
		   			if(confirm("确认删除吗？")){
		   				$.ajax({
						url:'jurisdiction/deleteRoleMenu.action',
						data:{"roleId":$(this).attr("id")},
						type:"post",
						success:function(res){
							if(res=="0"){
								alert("删除成功！");	
							}
							else{
								alert("删除失败！存在子类型！");
							}
							//刷新
							window.location.href=window.location.href;
						}
					});
		   			}
		   			
		   		});
		   		$("#showModel").click(function(){
		   			//加载未添加的菜单
		   			$.ajax({
						url:'jurisdiction/getMenuisNoadd.action',
						data:{"roleId":$(this).attr("name")},
						type:"post",
						dataType:'json',
						success:function(res){
							var $con=$("#tbodyContent");
							$con.html("");
							$.each(res,function(i,item){
								$con.append("<tr>"+
							        " <td>"+item.menuName+"</td>"+
							        " <td><span name="+item.menuId+" onclick=\"javascript:$.addMenuRole(this)\" style='color:green;cursor: pointer;'>添加</span></td>"+
							     	" </tr>");
						     });
						}
					});
		   		});
		   		$.addMenuRole=function(obj){
		   			 //添加
		   			 $.ajax({
						url:'jurisdiction/addMenuRole.action',
						data:{"role.roleId":"${param.roleId}","menu.menuId":$(obj).attr("name")},
						type:"post",
						dataType:'json',
						success:function(res){
							if(res=="0"){
								$("#msg").css("color","blue");
								$("#msg").html("添加成功");
								$(obj).parent().parent().remove();
								$("#msg").hide(2000);
							}
							else{
								$("#msg").css("color","red");
								$("#msg").html("添加失败！");
								$("#msg").hide(2000);
							}
						}
					}); 
		   			
		   		} 
		   	});
		   </script>
		   


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             		修改菜单类型
            </h4>
         </div>
         <div class="modal-body" style="height:400px; overflow:auto;">
         	 <table class="table">
			   <caption>给${roleInfo.roleName}角色添加菜单</caption>
			   <thead>
			      <tr>
			         <th>菜单名称</th>
			         <th>操作</th>
			      </tr>
			   </thead>
			   <tbody id="tbodyContent">
			   </tbody>
			</table>
         </div>
         <div class="modal-footer">
         	<span id="msg" style="font-size: 12px"></span>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
  </body>
</html>
