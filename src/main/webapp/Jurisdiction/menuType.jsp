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
    
    <title>菜单类型</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#returnForm").attr("action", "jurisdiction/getMenuType.action?pageIndex="+(new_page_index+1));
		    $("#returnForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pager.totalRecords}, {
		        items_per_page:${pager.pageSize}, // 每页显示多少条记录
		        current_page:${pager.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:5, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
		});
</script>
  </head>
  
  <body>
   <button type="button" id="addBtn" class="btn btn-success"  data-toggle="modal"   data-target="#myModal2">添加菜单分类</button>
   
  <table align="center" class="table">
		   <caption>菜单类型管理</caption>
		 	 <tr>
		      		<th>菜单类型名称</th>
		      		<th>菜单类型说明</th>
		      		<th>操作</th>
		     </tr>
		   <tbody>
		      <c:forEach items="${pager.list}" var="p">
		      <tr class="success">
		         <td class="">${p.menuTypeName}</td>
		         <td >${p.remark}</td>
		          <td>
						<span class="update" typeId="${p.menuTypeId}" typeName="${p.menuTypeName}" remark="${p.remark}" style="cursor:pointer;">修改</span>
						<span class="delete" style="cursor:pointer;"  typeId="${p.menuTypeId}" >删除</span>
				  </td>
		      </tr>
		     </c:forEach>
		   </tbody>
		</table>
  <script type="text/javascript">
  	$(function(){
  		$(".update").click(function(){
  			//设置修改的值
  			 $("#typeName").val($(this).attr("typeName"));//类型名称
  			 $("#typeRemark").val($(this).attr("remark"));//类型说明
  			 $("#typeId").val($(this).attr("typeId"));
  			 $("#showModel").click();
  		});
  		$(".delete").click(function(){
  			if(confirm("确认删除吗？")){
  				$.ajax({
						url:'jurisdiction/deleteMenuType.action',
						data:{"menuTypeId":$(this).attr("typeId")},
						type:"post",
						success:function(res){
							if(res=="0"){
								alert("删除成功！");	
							}
							else{
								alert("删除失败！");
							}
							//刷新
							window.location.href=window.location.href;
						}
					});
  			}
  		});
  	})
  </script>
 

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             		添加菜单类型
            </h4>
         </div>
         <div class="modal-body">
          		类型名称<input type="text" class="form-control" id="addtypeName" placeholder="请输入类型名称">
          		<br/>
          		类型说明<textarea type="text"  class="form-control" id="addtypeRemark" placeholder="请输入类型说明"></textarea>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" id="addSubmit" class="btn btn-primary">
            		  添加
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<script type="text/javascript">
	$(function(){
		$("#addSubmit").click(function(){
			//获取
			var addtypeName=$("#addtypeName").val();
			var addtypeRemark=$("#addtypeRemark").val();
			if(addtypeName!=""){
  			 	//执行修改
  			 	$.ajax({
						url:'jurisdiction/addMenuType.action',
						data:{"menuTypeName":addtypeName,"remark":addtypeRemark},
						type:"post",
						success:function(res){
							if(res=="0"){
								alert("添加成功！");	
							}
							else{
								alert("添加失败！");
							}
							//刷新
							window.location.href=window.location.href;
						}
					});
  			 }
  			 else{
  			 	alert("类型名称不能为空！");
  			 }
		});
	})
</script>
  
  <!-- 按钮触发模态框 -->
<button style="display: none;" id="showModel" class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal">
</button>

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
         <div class="modal-body">
        	 <input type="hidden" id="typeId">
          		类型名称<input type="text" class="form-control" id="typeName" placeholder="请输入">
          		<br/>
          		类型说明<textarea type="text"  class="form-control" id="typeRemark" placeholder="请输入"></textarea>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" id="updateSubmit" class="btn btn-primary">
            		   提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<script type="text/javascript">
	$(function(){
		$("#updateSubmit").click(function(){
			//验证内容是否为空
			var name= $("#typeName").val();//类型名称
			var id= $("#typeId").val(); //类型名称
  			 var remark=$("#typeRemark").val();//类型说明
  			 if(name!=""){
  			 	//执行修改
  			 	$.ajax({
						url:'jurisdiction/updateMenuType.action',
						data:{"menuTypeId":id,"menuTypeName":name,"remark":remark},
						type:"post",
						success:function(res){
							if(res=="0"){
								alert("修改成功！");	
							}
							else{
								alert("修改失败！");
							}
							//刷新
							window.location.href=window.location.href;
						}
					});
  			 }
  			 else{
  			 	alert("类型名称不能为空！");
  			 }
  			 
		});
	});
</script>
  		<form id="returnForm" method="post"></form>
	 			 <div align="center" style="margin-left:200">
		  			<div style="" id="News-Pagination"  align="center"></div>
</div>
		
  </body>
</html>
