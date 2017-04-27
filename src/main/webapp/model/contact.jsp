<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>服装首页</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link href="../css/styles.css" type="text/css" rel="stylesheet" />
	<script src="../js/jquery-1.11.3.js" type="text/javascript"></script>
	<script src="../js/function.js" type="text/javascript"></script>
   	<script src="../js/comm.js" type="text/javascript"></script>
   	<script src="../js/lang.js" type="text/javascript"></script>
   	<style type="text/css">
    	html,body{margin:0;padding:0;}
    	.iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
   		.iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
	</style>
</head>
  <body>
	<div class="page_style lanmupage page_l61">
	<div class="top_box">
		 <div class="top_box_inner">
		   <div class="topcontent"></div><div class="clear"></div>
		   <div class="logo"><a href=""><img src="../images/index/logo.jpg" border="0"></a></div>
		   <div class="menu_box" id="Menu"><ul>
				<li class="menu_style_homepage menu_current" id="MenuItem61" name="MenuItem"><a href="../index.jsp" class="menu">首页</a></li>
				<li class="menu_style" id="MenuItem93" name="MenuItem"><a href="company.jsp" class="menu">公司简介</a></li>
				<li class="menu_style" id="MenuItem94" name="MenuItem"><a href="joinMe.jsp" class="menu">新闻资讯</a></li>
				<li class="menu_style" id="MenuItem95" name="MenuItem"><a href="produceCenter" class="menu">产品中心</a></li>
				<li class="menu_style" id="MenuItem96" name="MenuItem"><a href="customer.jsp" class="menu">客户留言</a></li>
				<li class="menu_style" id="MenuItem97" name="MenuItem"><a href="contact.jsp" class="menu">联系我们</a></li>
			</ul></div>
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
			<div id="nav_146"  class="nav_box nav_box_menu">
				<div  class="nav_title"><span  class="nav_sign">联系我们</span><span  class="nav_more"></span></div>
				<span class="nav-English">CONTACT US</span>
				<div id="nav_menu_146"  class="nav_menu">
					<ul id="rootul_146"><li id="sl700"><a href="#" class="sla700">联系我们</a></li></ul>
				</div>
			</div>
			<script type="text/javascript">
				shut_allsubnav("rootul_146");
				expand_subnav("sl700","0");
			</script>
		</div>
	   <div class="main_box_inner_right">
			<div class="current_location current_location_700"><ul><li class="current_location_1">当前位置：<a href=/>首页</a> &gt; <a href="/lxwm/">联系我们</a> &gt; <a href="/lxwm/lxwm">联系我们</a></li><li class="current_location_2">联系我们</li></ul></div>
			<div class="sublanmu_box sublanmu_box_700">
				<div class="sublanmu_content sublanmu_content_introduct">
					<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script> -->
	  				<!--百度地图容器-->
	  				<div style="width:600px;height:285px;border:#ccc solid 1px;float:left;" id="dituContent"></div>
					<div class="Contact-right">
						<span style="background:url(../images/index/tubiao01_8pef.png) no-repeat left center;">地址：重庆市沙坪坝区微电园产业园区  </span>
						<span style="background:url(../images/index/tubiao02_k7yp.png) no-repeat left center;">电话：023-64956871</span>
						<span style="background:url(../images/index/tubiao04_k3kc.png) no-repeat left center;">Email：15089982316@163.com</span>
						<span style="background:url(../images/index/tubiao05_uxos.png) no-repeat left center;">邮编：XXXXXX</span>
						<span style="background:url(../images/index/tubiao06_faut.png) no-repeat left center;">网址:www.weiyi.net</span>
					</div>
				</div>
			</div></div>
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
</div></div><div align='center' style='padding:5px'>Powered by <a href='#' target='_blank'><strong>WEIYI CMS</strong></a></div></div>
  </body>
</html>
