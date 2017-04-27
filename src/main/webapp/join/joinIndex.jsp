<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询所有的加盟商</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/01.css" type="text/css"></link>
	<link rel="stylesheet" href="css/pagination.css" type="text/css"></link>
	<link rel="stylesheet" href="join/css/pintuer.css">
    <script src="join/css/pintuer.js"></script>
	<style type="text/css">
		table tr th{text-align: center}
		.v_not td{color: red;}
		img{margin-left: -15px;margin-bottom: 10px}
		.joiningfont{letter-spacing:4px;}
		#joiningTraderNames{font-size: 21px;letter-spacing:6px;color: #743A3A;font-weight: bolder;}
		.joiningdata{font-size: 20px;}
		.btn-Noprimary{color:#4F4F4F;background-color:#FFDC35;border-color:#2e6da4}
	</style>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
 	 <script type="text/javascript">

		//点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#joiningForm").attr("action", "join/queryAllToJoining.action?pageIndex="+(new_page_index+1));
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
		});
</script>
  </head>
  
  <body style="background-image: url('images/hhhh.jpg'); background-size:100%; ">
  <c:if test="${empty pager}">
  	<c:redirect url="/join/queryAllToJoining.action"></c:redirect>
  </c:if>
  <div class="xm9" style="margin-left: 580px;width: 600px;margin-top: 10px;margin-right: 230px;margin-bottom: -39px" >
        <div class="alert alert-yellow" align="left" style="margin-left: -10px;margin-top: 10px"><span class="close"></span><strong>注意：</strong>行数据中红色的标记是加盟期限快到，请尽早联系对方是否继续加盟。</div>
     </div>
  <center><h2 style="margin-left: -210px">加盟商信息</h2><br></center>
  <table cellpadding="0" cellspacing="0" width="100%" height="300px">
  	<tr style="line-height: 35px"><th>加盟商类型</th><th>加盟商名称</th><th>加盟时间</th><th>加盟批次</th><th>加盟年限</th><th>加盟资金</th><th>联系方式</th><th>联系人</th><th>申请状态</th><th>加盟商所在地址</th><th>编辑</th></tr>
	    <c:forEach items="${pager.list}" var="jointrader">
	    	<c:if test="${jointrader.joiningWarning==1}">
	    		<tr class="v_not" style="line-height: 35px"><td><img src="images/icon/icon_warning.png"/>&nbsp;${jointrader.isSubsidiary==0?'加盟商':'子公司'}</td><td>${jointrader.joiningTraderName}</td><td>${fn:substring(jointrader.joiningTraderTime,0,11)}</td><td>第 ${jointrader.joiningTraderNo} 期加盟</td><td>${jointrader.joiningTraderYear}</td><td>${jointrader.joiningTraderMoney}</td><td>${jointrader.joiningTraderTel}</td><td>${jointrader.joiningTraderPeople}</td><td>
   				<c:if test="${jointrader.joiningTraderStatus==0}">
   				<span class="auditing"  joiningTraderId="${jointrader.joiningTraderId}" joiningTraderName="${jointrader.joiningTraderName}" joiningTraderTime="${fn:substring(jointrader.joiningTraderTime,0,11)}" joiningTraderYear="${jointrader.joiningTraderYear}" joiningTraderMoney="${jointrader.joiningTraderMoney}" style="cursor:pointer;">审核</span></c:if>
	    		<c:if test="${jointrader.joiningTraderStatus==1}">审核成功</c:if>
	    		<c:if test="${jointrader.joiningTraderStatus==2}">审核失败</c:if>
	    			</td>
	    		<td>${jointrader.joiningTraderAddress}</td><td>
				<span class="updatejoiningTrader" joiningTraderId="${jointrader.joiningTraderId}" joiningTraderName="${jointrader.joiningTraderName}" joiningTraderTel="${jointrader.joiningTraderTel}" joiningTraderPeople="${jointrader.joiningTraderPeople}" joiningTraderAddress="${jointrader.joiningTraderAddress}" style="cursor:pointer;">修改</span></td></tr>
		    </c:if>
		    <c:if test="${jointrader.joiningWarning==0}">
	    		<tr style="line-height: 35px"><td>${jointrader.isSubsidiary==0?'加盟商':'子公司'}</td><td>${jointrader.joiningTraderName}</td><td>${fn:substring(jointrader.joiningTraderTime,0,11)}</td><td>第 ${jointrader.joiningTraderNo} 期加盟</td><td>${jointrader.joiningTraderYear}</td><td>${jointrader.joiningTraderMoney}</td><td>${jointrader.joiningTraderTel}</td><td>${jointrader.joiningTraderPeople}</td><td>
   				<c:if test="${jointrader.joiningTraderStatus==0}">
   				<span class="auditing"  joiningTraderId="${jointrader.joiningTraderId}" joiningTraderName="${jointrader.joiningTraderName}" joiningTraderTime="${fn:substring(jointrader.joiningTraderTime,0,11)}" joiningTraderYear="${jointrader.joiningTraderYear}" joiningTraderMoney="${jointrader.joiningTraderMoney}" style="cursor:pointer;">审核</span></c:if>
	    		<c:if test="${jointrader.joiningTraderStatus==1}">审核成功</c:if>
	    		<c:if test="${jointrader.joiningTraderStatus==2}">审核失败</c:if>
	    			</td>
	    		<td>${jointrader.joiningTraderAddress}</td>
	    		<td><span class="updatejoiningTrader" joiningTraderId="${jointrader.joiningTraderId}" joiningTraderName="${jointrader.joiningTraderName}" joiningTraderTel="${jointrader.joiningTraderTel}" joiningTraderPeople="${jointrader.joiningTraderPeople}" joiningTraderAddress="${jointrader.joiningTraderAddress}" style="cursor:pointer;">修改</span></td></tr>
		    </c:if>
	    </c:forEach>
	    
     <tr><td colspan="12" align="center">
  		<form id="joiningForm"  method="post"></form>
 		 <div style="margin-left:-140px;" align="center">
	  			<div style="" id="News-Pagination"  align="center"></div>
		</div>
     </td></tr>
	</table>
	
	<!-- 修改加盟商信息 -->
	<script type="text/javascript">
  	$(function(){
  		$(".updatejoiningTrader").click(function(){
  			 $("#joiningTraderId").val($(this).attr("joiningTraderId"));//加盟商Id
  			 $("#joiningTraderName").val($(this).attr("joiningTraderName"));//加盟商名称
  			 $("#joiningTraderTel").val($(this).attr("joiningTraderTel"));//加盟商联系方式
  			 $("#joiningTraderPeople").val($(this).attr("joiningTraderPeople"));//加盟商联系人
  			 $("#joiningTraderAddress").val($(this).attr("joiningTraderAddress"));//加盟商所在地址
  			 $("#updateJoinModel").click();
  		});
  		//审核加盟商的请求
  		$(".auditing").click(function(){
  			$("#joiningTraderId").val($(this).attr("joiningTraderId"));//加盟商Id
  			 $("#joiningTraderNames").html($(this).attr("joiningTraderName"));//加盟商名称
  			 var time=$(this).attr("joiningTraderTime");//2016-01-08
  			 var t=time.substr(0,4)+"年"+time.substr(5,2)+"月"+time.substr(8,2)+"日";
  			 $("#joiningTraderTime").html(t);//加盟商申请时间
  			 $("#joiningTraderYear").html($(this).attr("joiningTraderYear"));//加盟商加盟年限
  			 $("#joiningTraderMoney").html($(this).attr("joiningTraderMoney"));//加盟商加盟资金
  			 $("#updateAuditing").click();
  		});
  	})
  </script>
	
	
	
	<!-- 修改商品信息 -->
	<button style="display: none;" id="updateJoinModel" class="btn btn-primary btn-lg" data-toggle="modal" 
   		data-target="#myModal">
	</button>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">修改加盟商信息</h4>
	         </div>
	         <div class="modal-body">
	        	 <input type="hidden" id="joiningTraderId">
	          		加盟商名称：<input type="text" class="form-control" id="joiningTraderName" readonly="readonly">
	          		<br/>
	          		加盟商联系人：<input type="text" class="form-control" id="joiningTraderPeople"><br/>
	          		加盟商联系人方式：<input type="text" class="form-control" id="joiningTraderTel" placeholder="请输入"><br/>
	          		加盟商所在位置：<input type="text" class="form-control" id="joiningTraderAddress" placeholder="请输入"><br/>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="button" id="updateJoinSubmit" class="btn btn-primary"> 修改</button>
	         </div>
	      </div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#updateJoinSubmit").click(function(){
				var joiningTraderId=$("#joiningTraderId").val();//加盟商Id
				var joiningTraderName=$("#joiningTraderName").val();//加盟商名称
  			    var joiningTraderTel=$("#joiningTraderTel").val();//加盟商联系方式
  			    var joiningTraderAddress=$("#joiningTraderAddress").val();//加盟商所在地址
  			    var joiningTraderPeople= $("#joiningTraderPeople").val();//加盟商联系人
  			 	$.ajax({
					url:'join/updateJoininfTraderByid.action',
					data:{"joiningTraderId":joiningTraderId,"joiningTraderName":joiningTraderName,"joiningTraderTel":joiningTraderTel,"joiningTraderAddress":joiningTraderAddress,"joiningTraderPeople":joiningTraderPeople},
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
			});
			//让加盟商通过审核
			$("#updateAuditingSure").click(function(){
				var joiningTraderId=$("#joiningTraderId").val();
				$.ajax({
					url:'join/passVerify.action?joiningTraderId='+joiningTraderId,
					type:"post",
					success:function(res){
						if(res=="0"){
							alert("批准成功！");	
						}
						else{
							alert("批准失败！");
						}
						//刷新
						window.location.href=window.location.href;
					}
				});
			});
			//不让加盟商通过审核
			$("#updateAuditingNoSure").click(function(){
				var joiningTraderId=$("#joiningTraderId").val();
				 if(confirm("确定不让该加盟商通过审核？")){
					$.ajax({
						url:'join/noPassVerify.action?joiningTraderId='+joiningTraderId,
						type:"post",
						success:function(res){
							if(res=="0"){
								alert("不让该加盟商通过审核成功！");	
							}
							else{
								alert("不让该加盟商通过审核失败！");
							}
							//刷新
							window.location.href=window.location.href;
						}
					}); 
   				}else{
   					$("#closeAuditing").click();
   				}
			});
		});
	</script>
	
	
	<!-- 审核加盟商 -->
	<button style="display: none;" id="updateAuditing" class="btn btn-primary btn-lg" data-toggle="modal" 
   		data-target="#myModalAuditing">
	</button>
	<div class="modal fade" id="myModalAuditing" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">审核加盟商的请求</h4>
	         </div>
	         <div class="modal-body">
	        	 <input type="hidden" id="joiningTraderId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          		<span class="joiningfont">申请加盟的加盟商名称为</span>“<font id="joiningTraderNames"></font>”
	          		<span class="joiningfont">，申请加盟时间是</span><font class="joiningdata" id="joiningTraderTime"></font>
	          		<span class="joiningfont">，加盟年限：</span><font class="joiningdata" id="joiningTraderYear"></font>&nbsp;&nbsp;年
	          		<span class="joiningfont">，加盟资金：</span><font class="joiningdata" id="joiningTraderMoney"></font>&nbsp;&nbsp;元。
	         </div>
	         <div class="modal-footer">
	            <button type="button" id="closeAuditing" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="button" id="updateAuditingSure" class="btn btn-primary">批准</button>
	            <button type="button" id="updateAuditingNoSure" class="btn btn-Noprimary">不批准</button>
	         </div>
	      </div>
		</div>
	</div>
  </body>
</html>
