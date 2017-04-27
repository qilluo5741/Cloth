<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="../css/styles.css" type="text/css" rel="stylesheet" />
<script src="../js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="../js/function.js" type="text/javascript"></script>
<script src="../js/comm.js" type="text/javascript"></script>
<script src="../js/lang.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'../select/queryAllGoodTypeInfoToAjax.action',
			type:'post',
			dataType:'json',
			success:function(res){
				$.each(res, function(i,item) {
					$("#rootul_144").append("<li><a gtId="+item.goodTypeId+">"+item.goodTypeName+"</a></li>");
				});
			}
		});
		
		$(".nav_menu ul").on('click','li',function(){
			$("#module_200").hide();
			$.ajax({
				url:'../goods/queryAllByGoodsType.action',
				type:'post',
				dataType:'json',
				data:{ goodTypeId:$($(this).html()).attr("gtId") },
				success:function(res){
					if(res.length == 0){
						$(".prod_list").html("<li id='ssss'><font>敬请期待！！！</font></li>");
					} else {
						$(".prod_list").html("");
						$.each(res, function(i,item) {
							$(".prod_list").append("<li class='pro-left'>" +
								"<a href='../goods/selectBygoodsName.action?goodsId="+item.goodsId+"'><img height='240px' width='240px' src='../images/"+item.goodsImg+"'/></a>" +
								"<span class='pro-span-1'>"+item.goodsName+"</span>" +
								"<span style='color:red' class='pro-span-2'>￥"+item.goodsOutPrice+"</span>" +
								"<span class='pro-span-3'>"+item.goodsRemark+"</span>" +
								"</li>");
						});
					}
				}
			});
			$("#module_201").show();
		});
		$("#cuxiao").click(function(){
			$("#module_200").hide();
			$.ajax({
				url:'../goods/queryAllSaleGood.action',
				type:'post',
				dataType:'json',
				success:function(res){
					if(res.length == 0){
						$(".prod_list").html("<li id='ssss'><font>敬请期待！！！</font></li>");
					} else {
						$(".prod_list").html("");
						$.each(res, function(i,item) {
							$(".prod_list").append("<li class='pro-left'>" +
								"<img class=hotimages src=../images/new-ribbon.gif width=45px height=45px /><a href='../goods/selectBygoodsName.action?goodsId="+item.goodsId+"'><img height='240px' width='240px' src='../images/"+item.goodsImg+"'/></a>" +
								"<span class='pro-span-1'>"+item.goodsName+"</span>" +
								"<span style='color:red' class='pro-span-2'>￥"+item.goodsOutPrice+"</span>" +
								"<span class='pro-span-3'>"+item.goodsRemark+"</span>" +
								"</li>");
						});
					}
				}
			});
			$("#module_201").show();
		});
	});
</script>
<style type="text/css">
	#module_201{display: none;}
	#rootul_144 li{margin-top: 1px;}
	font{color: red;font-size: 25px;}
	#ssss{margin-left: 400px; }
	.hotimages{margin-top: 1px;position: absolute;}
</style>
</head>
<body>
<div class="page_style lanmupage page_l61">
<div class="top_box">
 <div class="top_box_inner">
   <div class="topcontent"></div><div class="clear"></div>
   <div class="logo"><a href=""><img src="../images/index/logo.jpg" border="0"></a></div>
   <div class="menu_box" id="Menu">
   	<ul>
		<li class="menu_style_homepage menu_current" id="MenuItem61" name="MenuItem"><a href="../index.jsp" class="menu">首页</a></li>
		<li class="menu_style" id="MenuItem93" name="MenuItem"><a href="company.jsp" class="menu">公司简介</a></li>
		<li class="menu_style" id="MenuItem94" name="MenuItem"><a href="joinMe.jsp" class="menu">加入我们</a></li>
		<li class="menu_style" id="MenuItem95" name="MenuItem"><a href="produceCenter.jsp" class="menu">产品中心</a></li>
		<li class="menu_style" id="MenuItem96" name="MenuItem"><a href="customer.jsp" class="menu">客户留言</a></li>
		<li class="menu_style" id="MenuItem97" name="MenuItem"><a href="contact.jsp" class="menu">联系我们</a></li>
	</ul>
   </div>
 </div>
</div>
	<script type="text/javascript">
			var IsPageHome="1";var Lanmu_Id="61";var Sublanmu_Id="0";ShowSubMenu(Lanmu_Id);
		</script>
		<div class="banner">
			<script  type="text/javascript">var Show_Style=3;
				var Image_12=new Array();
				var Pics="../images/index/banner_tyww.jpg";
				var Links="";
				var Titles="";
				var Alts="";
				var Apic12=Pics.split('|');
				var ALink12=Links.split('|');
				var ATitle12=Titles.split('|');
				var AAlts12=Alts.split('|');
				var Show_Text=0;
				for(i=0;i<Apic12.length;i++)
				  {
				   Image_12.src = Apic12[i]; 
				  }
				  var FHTML='<div id="js_slide_focus_12" class="slide_focus focus_style3" style="height:466px">';
	  				FHTML+='<ul class="inner">';
	  			for(var i=0;i<Apic12.length;i++)
	   			{
	   			  if(ALink12.length<(i+1) || ALink12[i]=="")
	     			 {
	      				 ALink12[i]="javascript:void(0)";
	     			 }
	    		  if(AAlts12.length<(i+1))
	     			 {
	       				 AAlts12[i]="";
	      			 }
	    		  if(ATitle12.length<(i+1))
	      			 {
	       				ATitle12[i]="";
	      			 }
	    			FHTML+='<li><a href="'+ALink12[i]+'" target="_self" title="'+AAlts12[i]+'"><img src="'+Apic12[i]+'">';
	    			FHTML+='<em>'+ATitle12[i]+'</em>';
	   				 FHTML+='</a></li>';
	  			 }
	 			FHTML+='</ul>';
	 			FHTML+='</div>';
	 			document.write(FHTML);
				$(function(){Slide_Focus("js_slide_focus_12",1,5,1700,466,true);});
			</script>
		</div>
	<div class="main_box main_box_style1">
	 <div class="main_box_inner">
	   <div class="main_box_inner_left">
	<div id="nav_144"  class="nav_box nav_box_menu">
	
	<div  class="nav_title"><span  class="nav_sign">产品中心</span><span  class="nav_more"></span></div>
	<span class="nav-English">PRODUCTS CENTER</span><div id="nav_menu_144"  class="nav_menu">
		<ul id="rootul_144">
			<li><a id="cuxiao">广告促销</a></li>
		</ul>
	</div></div>
	<script type="text/javascript">
	shut_allsubnav("rootul_144");
	expand_subnav("sl0","");
	</script>
</div>
   <div class="main_box_inner_right"><div class="current_location" id="current_location"><ul><li class="current_location_1">当前位置：<a href=/>首页</a> &gt; &gt; <a href="/cpzx/">产品中心</a></li><li class="current_location_2">产品中心</li></ul></div>
	<div id="module_200" class="module_box">
	 <div class="module_box_inner">
		<div id="module_content_200" class="module_content">
			<ul class="prod_list">
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25165751.jpg"/></a>
				    <span class="pro-span-1">羽绒服01</span>
				    <span class="pro-span-2"><a href="/cpzx/dzxl">冬装</a></span>
				    <span class="pro-span-3">顶级羽绒服，全世界最前沿生产线...</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25165659.jpg"/></a>
				    <span class="pro-span-1">羽绒服02</span>
				    <span class="pro-span-2"><a href="/cpzx/dzxl">冬装</a></span>
				    <span class="pro-span-3">顶级羽绒服，全世界最前沿生产线...</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25165355.jpg"/></a>
				    <span class="pro-span-1">羽绒服03</span>
				    <span class="pro-span-2"><a href="/cpzx/dzxl">冬装</a></span>
				    <span class="pro-span-3">顶级羽绒服，全世界最前沿生产线...</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25165245.jpg"/></a>
				    <span class="pro-span-1">羽绒服04</span>
				    <span class="pro-span-2"><a href="/cpzx/dzxl">冬装</a></span>
				    <span class="pro-span-3">顶级羽绒服，全世界最前沿生产线...</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/t_25165122.jpg"/></a>
				    <span class="pro-span-1">蕾丝打底吊带背心</span>
				    <span class="pro-span-2"><a href="/cpzx/xxTx">T恤</a></span>
				    <span class="pro-span-3">性感蕾丝打底 春夏必备性感单品</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25165025.jpg"/></a>
				    <span class="pro-span-1">钉珠蕾丝背心</span>
				    <span class="pro-span-2"><a href="/cpzx/xxTx">T恤</a></span>
				    <span class="pro-span-3">性感蕾丝打底 春夏必备性感单品</span>
				</li>
				
				<li class="pro-left">
					<a href="#"><img src="../images/tpic_t_25164903.jpg"/></a>
				    <span class="pro-span-1">纯色内搭背心</span>
				    <span class="pro-span-2"><a href="/cpzx/xxTx">T恤</a></span>
				    <span class="pro-span-3">性感蕾丝打底 春夏必备性感单品</span>
				</li>
				<li class="pro-left">
					<a href="#"><img src="../images/t_25164702.jpg"/></a>
				    <span class="pro-span-1">中长款蕾丝背心裙</span>
				    <span class="pro-span-2"><a href="/cpzx/xxTx">T恤</a></span>
				    <span class="pro-span-3">性感蕾丝打底 春夏必备性感单品</span>
				</li>
			</ul>
		</div>
	   <div class="module_footer"><span class="l"></span><span class="r"></span></div>
	 </div>
	</div>
	<div id="module_201" class="module_box">
	 <div class="module_box_inner">
		<div id="module_content_200" class="module_content">
			<ul class="prod_list">
			</ul>
		</div>
	   <div class="module_footer"><span class="l"></span><span class="r"></span></div>
	 </div>
	</div>
  </div>
 </div>
 <div class="clear main_box_inner_bottom"></div>
</div>
<div class="bottom_box"><div style="width:1000px;margin:0px auto;clear:both;overflow:hidden;">
	<div class="bottom-left">
		<span>重庆市沙坪坝区微电园产业园区 </span> <span>Chong Qing city</span> <span> Wei Dian Yuan, 16th</span> <span>联系电话：023-64956871</span> 
	</div>
	<div class="bottom-right">
		<span>ICP备15629784号&nbsp;公网安备14562502003564号&nbsp;&copy;2016</span><span>网址：www.weiyi.net</span> 
	</div>
</div></div><div align='center' style='padding:5px'>Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>Wei Yi</strong></a>
</div>
</div>
</body>
<script type="text/javascript">TongJi(1)</script>
</html>

