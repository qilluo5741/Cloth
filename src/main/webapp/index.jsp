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
    
    <title>服装首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/styles.css" type="text/css" rel="stylesheet" />
	<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
	<script src="js/function.js" type="text/javascript"></script>
   	<script src="js/comm.js" type="text/javascript"></script>
	<script src="js/lang.js" type="text/javascript"></script>
</head>
<body>
<div class="page_style lanmupage page_l61">
<div class="top_box">
 <div class="top_box_inner">
   <div class="topcontent"></div><div class="clear"></div>
   <div class="logo"><a href=""><img src="images/index/logo.jpg" border="0"></a></div>
   <div class="menu_box" id="Menu">
   	<ul>
		<li class="menu_style_homepage menu_current" id="MenuItem61" name="MenuItem"><a href="index.jsp" class="menu">首页</a></li>
		<li class="menu_style" id="MenuItem93" name="MenuItem"><a href="model/company.jsp" class="menu">公司简介</a></li>
		<li class="menu_style" id="MenuItem94" name="MenuItem"><a href="model/joinMe.jsp" class="menu">加入我们</a></li>
		<li class="menu_style" id="MenuItem95" name="MenuItem"><a href="model/produceCenter.jsp" class="menu">产品中心</a></li>
		<li class="menu_style" id="MenuItem96" name="MenuItem"><a href="model/customer.jsp" class="menu">客户留言</a></li>
		<li class="menu_style" id="MenuItem97" name="MenuItem"><a href="model/contact.jsp" class="menu">联系我们</a></li>
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
			var Pics="images/index/banner_tyww.jpg";
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
<div class="main_box main_box_style">
 <div class="main_box_inner">
 
<div id="module_195" class="module_box">
 <div class="module_box_inner">
   <div id="module_content_195" class="module_content module_content_introduct">
	<div class="w1100">
		<div class="Product-left">
			<a href="#"></a><div>
			<span class="span-1">春装新款韩</span>
			<span>版小清新甜美</span>
			<span>宽松套头毛衣女</span></div>
		</div>
		<div class="Product-left Product-center">
			<a href="#"></a><div>
			<span class="span-1">男人的品质</span>
			<span>帅气与时尚</span>
			<span>衬衫新选择</span></div>
		</div>
			<div class="Product-left Product-right">
				<a href="#"></a><div>
				<span class="span-1" style="text-align:left;margin-left:20px;">韩版酷炫</span>
				<span style="text-align:left;margin-left:10px;">休闲浅</span>
				<span style="text-align:left;">卡其休闲裤</span></div>
			</div>
	</div>
   </div>
   	<div class="module_footer"><span class="l"></span><span class="r"></span></div>
 </div>
</div>



<div id="module_196" class="module_box">
 <div class="module_box_inner">
   <div id="module_content_196" class="module_content module_content_introduct">

<div class="w1100">
<a href="#"><img style="float:left;" src="images/index/Company-profile.png"/></a>
<h2 class="home-gsjs"><font color="#E06666">-</font> 公司简介 <font color="#E06666">-</font><p class="home-gsjs-yy">introduction</p></h2>
<div class="home-gsjs-con">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	唯衣公司拥有各类先进制衣设备和优厚的基础设施，拥有一支数千人的精良队伍。公司按国际质量体系
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	保证了产品的高质量和骄人的市场业绩， <br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 随着公司关于 ISO—9001 国际质量体系认证和环境质量体系认证进入验收实施阶段，企业的产品品质 <br/> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	和服务质量将得到更大程度提升。公司自主研发设计生产的各类高中档西服、职业装、工装、校服、医疗服  <br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	装、广告 T 恤、文化衫及各行业服务用装，已服务于省内外众多著名企业集团，各类服饰产品为各大市场<br/> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
	畅销品。我们将进一步依托高素质的员工队伍，先进精良的生产设备，通过诚信创新的营销服务，争做中国服饰<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	第一品牌。我们这支团结而奋进的团队，在最大限度地张扬着年轻、激情、独特的个性，进步、发展、无不处处挥<br/>
	&nbsp;&nbsp;
	洒美泰来人永争第一的壮志与豪情。
	</div>
</div>

   </div>
   <div class="module_footer"><span class="l"></span><span class="r"></span></div>
 </div>
</div>



<div id="module_198" class="module_box">
 <div class="module_box_inner">
   <div id="module_content_198" class="module_content module_content_introduct">

<div class="home-ljgd-box">
<div class="home-ljgd-img"><img src="images/index/whyw.jpg"/></div>
<div class="home-ljgd-right">
<h2 class="home-ljgd-conz">我们专注美丽，<br/>所以我们更懂得美丽。<br/><span class="home-ljgd-cony">We focus on beauty, so<br/>&nbsp; know more beautiful. </span></h2>
<span class="home-ljgd"><a style="color:white;font-size:14px;" href="#">了解更多</a></span>
</div>
</div>

   </div>
   <div class="module_footer"><span class="l"></span><span class="r"></span></div>
 </div>
</div>


 </div>
	 <div class="clear main_box_inner_bottom"></div>
</div>
<div class="bottom_box"><div style="width:1000px;margin:0px auto;clear:both;overflow:hidden;">
	<div class="bottom-left">
		<span>重庆市沙坪坝区</span> <span>Chongqing city</span> <span> Nan tou Jin Wan Plaza, 16th</span> <span>联系电话：0760-22517081</span> 
	</div>
	<div class="bottom-right">
		<span>ICP备1xxx9XXX号&nbsp;公网安备1xxxxx0200XXXX号&nbsp;&copy;2014</span><span>网址：www.zuxia.com</span> 
	</div>
</div></div><div align='center' style='padding:5px'>Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>PageAdmin CMS</strong></a></div></div></body><script type="text/javascript">TongJi(1)</script>
</html>
