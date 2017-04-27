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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	$(function(){	
		//导航切换
		$(".menuson li").click(function(){
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});
		
		$('.title').click(function(){
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if($ul.is(':visible')){
				$(this).next('ul').slideUp();
			}else{
				$(this).next('ul').slideDown();
			}
		});
	})	
</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>控制面板</div>
    <dl class="leftmenu">
    	<c:set var="i" value="1"></c:set>
	    <c:forEach items="${menutype}" var="mt">
	    	<dd>
			    <div class="title">
			    <span><img width="16" height="16" src="images/icon/icon_${i}.png"/></span>${mt.menuTypeName}<c:set var="i" value="${i+1}"></c:set>
			    </div><!--  class="active" -->
			    	<ul class="menuson">
			        	<c:forEach items="${mt.menu}" var="menu">
			        		<li><cite></cite><a href="${menu.href}" target="${menu.target}">${menu.menuName}</a><i></i></li>
			        	</c:forEach>
			        </ul>    
			    </dd>
	    </c:forEach>
   </dl>
 </body>
</html>

