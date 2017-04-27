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
    
    <title>empIndex.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="js/uploadPreview.js"></script>
	
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/uniform.default.css" type="text/css"></link>
	
 	<script type="text/javascript">
		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#joiningForm").attr("action", "emp/selectAllByPager.action?pageIndex="+(new_page_index+1));
		    $("#joiningForm").submit();
		    return false;
		}
		$(function(){
			$("#News-Pagination").pagination(${pager.totalRecords}, {
		        items_per_page:${pager.pageSize}, // 每页显示多少条记录
		        current_page:${pager.pageIndex}- 1, // 当前显示第几页数据
		        num_display_entries:2, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:3, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
			$("#showModel").click(function(){
				$.ajax({
					url:'emp/selectPostionAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$("#id_pos").html("");
						$.each(res, function(i,item) {
							$("#id_pos").append("<option value="+item.positionId+">"+item.positionName+"</option>");
						});
					}
				});
				$("#empSal").val($(this).attr("salary"));
				$("#empId").val($(this).attr("empIds"));
			});
			$("#showModel1").click(function(){
				$.ajax({
					url:'emp/selectPostionAjax.action',
					type:'post',
					dataType:'json',
					success:function(res){
						$("#id_pos1").html("");
						$.each(res, function(i,item) {
							$("#id_pos1").append("<option value="+item.positionId+">"+item.positionName+"</option>");
						});
					}
				});
			});
			$("#selectselectId").change(function(){
				if($(this).val() == 2) {
					$("#empSal").val("0");
					$("#empSal").attr("readonly","readonly");
					$("#id_pos").html("");
				}
			});
		});
	</script>
	<style type="text/css">
		a{text-decoration: none;color: green;}
		table tr{height: 45px;}
		table tr th{text-align: center;}
		table{text-align: center;}
		img {  
		    -moz-border-radius: 50%;  
		    -webkit-border-radius: 50%;  
		    border-radius: 50%;  
			}  
		#tr_1{height: 80px;}
		#v_img{margin-top: 0px;margin-left: 0px;}
		ul{list-style: none;}
		#up_img_WU_FILE_0{margin-left: 50px;margin-top: -50px;}
		#imgShow_WU_FILE_0{margin-left: -300px;margin-top: -10px;}
		.v_not td{color: gray;}
	</style>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
  	<CENTER>
  		<c:if test="${empty pager}">
    		<p>暂没有任何数据</p>
    	</c:if>
	    <c:if test="${!empty pager}">
	    	<center><h2>员工信息</h2></center>
    		<table  cellpadding="0" cellspacing="0"  width="100%" height="300px">
    			<tr>
    				<th>头像</th>
    				<th>姓名</th>
    				<th>性别</th>
    				<th>年龄</th>
    				<th>电话</th>
    				<th>工资</th>
    				<th>身份证号</th>
    				<th>地址</th>
    				<th>职位</th>
    				<th>登录账户</th>
    				<th>状态</th>
    				<th>备注</th>
    				<th>操作</th>
    			</tr>
		    	<c:forEach items="${pager.list}" var="emp">
		    		<c:if test="${emp.isServing != 0 && emp.isServing != 1}">
			    		<tr class="v_not">
			    			<td><img height="30px" width="30px" src="images/${emp.empPhoto}"></td>
			    			<td>${emp.empName }</td>
			    			<td>${emp.empGender }</td>
			    			<td>${emp.empAge }</td>
			    			<td>${emp.empTel }</td>
			    			<td>${emp.empSal }</td>
			    			<td>${emp.empCardNo }</td>
			    			<td>${emp.empAddress }</td>
			    			<td>${emp.position.positionName }</td>
			    			<td>${emp.user.userName }</td>
			    			<td>
			    				<c:choose>
			   						<c:when test="${emp.isServing == 0}">
			   							在职
			   						</c:when>
			   						<c:when test="${emp.isServing == 1}">
			   							离职
			   						</c:when>
			   						<c:otherwise>
			   							已解雇
			   						</c:otherwise>
			   					</c:choose>
			    			</td>
			    			<td>${emp.empRemark }</td>
			    			<td>
			    				<!--
			    				&nbsp;<a href="emp/selectOne.action?empId=${emp.empId }&a=1">基本</a>
			    				&nbsp;<a href="emp/selectOne.action?empId=${emp.empId }&a=2">高级</a>
			    				&nbsp;<button empId="${emp.empId}" salary="${emp.empSal}" id="showModel" class="btn" data-toggle="modal" data-target="#updateHigh">高级2</button>
			    				-->
			    			</td>
			    		</tr>
		    		</c:if>
		    		<c:if test="${emp.isServing == 0 || emp.isServing == 1}">
			    		<tr>
			    			<td><img height="30px" width="30px" src="images/${emp.empPhoto}"></td>
			    			<td>${emp.empName }</td>
			    			<td>${emp.empGender }</td>
			    			<td>${emp.empAge }</td>
			    			<td>${emp.empTel }</td>
			    			<td>${emp.empSal }</td>
			    			<td>${emp.empCardNo }</td>
			    			<td>${emp.empAddress }</td>
			    			<td>${emp.position.positionName }</td>
			    			<td>${emp.user.userName }</td>
			    			<td>
			    				<c:choose>
			   						<c:when test="${emp.isServing == 0}">
			   							在职
			   						</c:when>
			   						<c:when test="${emp.isServing == 1}">
			   							离职
			   						</c:when>
			   						<c:otherwise>
			   							已解雇
			   						</c:otherwise>
			   					</c:choose>
			    			</td>
			    			<td>${emp.empRemark }</td>
			    			<td>
			    				&nbsp;<a href="emp/selectOne.action?empId=${emp.empId }&a=1">基本</a>
			    				<!-- &nbsp;<a href="emp/selectOne.action?empId=${emp.empId }&a=2">高级</a> -->
			    				&nbsp;<button empIds="${emp.empId}" salary="${emp.empSal}" id="showModel" class="btn" data-toggle="modal" data-target="#updateHigh">高级2</button>
			    			</td>
			    		</tr>
		    		</c:if>
		    	</c:forEach>
		    	<tr>
		    		<td colspan="13">
		    			<a href="emp/insertOneBefore.action">基本添加</a>
		    			<button id="showModel1" class="btn" data-toggle="modal" data-target="#addOne">高级添加</button>
		    		</td>z
		    	</tr>
		    	<tr><td colspan="13" align="center">
			  		<form id="joiningForm"  method="post"></form>
			 		 <div style="margin-left:-85px;" align="center">
				  		<div style="" id="News-Pagination" align="center"></div>
					</div>
			     </td></tr>
	    	</table>
	    </c:if>
    </CENTER>
    
	<div class="modal fade" id="updateHigh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="myModalLabel">
	             		修改员工高级资料
	            </h4>
	         </div>
	         <div class="modal-body" style="height:auto; overflow:auto;">
	         <CENTER>
		    	<form action="emp/updateOneHigh.action" method="post">
		    		<input type="hidden" name="empId" id="empId" value="${emp.empId }"/>
			   		<table class="table table-bordered">
			   			<tr><th>工资：</th><td><input name="empSal" id="empSal" value="${emp.empSal }" required/></td></tr>
			   			<tr><th>职位:</th>
			   				<td>
				   				<select id="id_pos" name="position.positionId">
				   				</select>
				   			</td>
			   			</tr>
			   			<tr><th>就职状态:</th>
			   				<td>
				   				<select id="selectselectId" name="isServing">
			   						<option value="0" selected="selected">在职</option>
		   							<option value="1">离职</option>
		   							<option value="2">解雇</option>
				   				</select>
				   			</td>
			   			</tr>
						<tr><td colspan="2"><input value="确定修改" type="submit"/>&nbsp;&nbsp;</td></tr>
			    	</table>
		    	</form>
		    </CENTER>
		    </div>
	         <div class="modal-footer">
	         	<span id="msg" style="font-size: 12px"></span>
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>
	         </div>
	      </div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
	
	<div class="modal fade" id="addOne" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="myModalLabel">
	             		添加新员工
	            </h4>
	         </div>
	         <div class="modal-body" style="height:auto; overflow:auto;">
	         <CENTER>
		    	<form action="emp/insertOne.action" method="post" enctype="multipart/form-data">
			   		<table class="table table-bordered">
			   			<tr>
			   				<td><input name="empName" requred placeholder="姓名"/></td>
			   				<td><input name="empAge" requred placeholder="年龄"/></td>
			   			</tr>
			   			<tr>
			   				<td>
			   					&nbsp;&nbsp;<input name="empGender" type="radio" checked="checked" value="男"/>男<br/>
			   					&nbsp;&nbsp;<input name="empGender" type="radio" value="女"/>女
			   				</td>
							<td align="left">
								<ul id="warp">
									<li>
										<img id="imgShow_WU_FILE_0" name="empPhoto" src="images/noimg.gif" width="70" height="70"/>
										<input type="file" id="up_img_WU_FILE_0" width="70px" name="imgEmp"/>
									</li>
								</ul>
			   				</td>
			   			</tr>
			   			<tr>
			   				<td><input name="empSal" requred placeholder="月薪"/></td>
							<td><input name="empCardNo" requred placeholder="身份证号"/></td></tr>
						<tr>
							<td><input name="empTel" requred placeholder="联系电话"/></td>
							<td>
								<select id="id_pos1" name="position.positionId">
									<option selected="selected">====请选择职位====</option>
				   				</select>
							</td>
						</tr>
						<tr>
							<td><input name="empAddress" requred placeholder="地址"/></td>
							<td><input name="empRemark" requred placeholder="备注"/></td>
						</tr>
						<tr><td colspan="4"><input value="添加" type="submit"/>&nbsp;&nbsp;</td></tr>
			    	</table>
		    	</form>
		    </CENTER>
		    </div>
	         <div class="modal-footer">
	         	<span id="msg" style="font-size: 12px"></span>
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>
	         </div>
	      </div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
	
  </body>
</html>
