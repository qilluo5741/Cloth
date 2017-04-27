<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script language="JavaScript" src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<link href="css/styles.css" rel="stylesheet">
	<script src="js/silder.js"></script>
	<script>
	function show(){
	;!function(){
		layer.config({
		    extend: 'extend/layer.ext.js'
	});
		    layer.open({
		    type: 2,
		    area: ['700px', '530px'],
		    fix: false, //不固定
		    maxmin: true,
		    content: 'User/selectUserAll.action?userName=${user.userName}'
		});
	  }();
	}
</script>
</head>
<body style="background:url(images/16.png) ;background-size:100%;">
    <div class="topleft">
    	<a href="main.jsp" target="_parent"><!--<img src="images/logo.png" title="系统首页" />--></a>
    </div>
    <div class="topright">    
	    <ul>
		    <li><span><!--<img src="images/help.png" title="帮助"  class="helpimg"/>--></span><a href="#">帮助</a></li>
		    <li><a href="javascript:void(0);"><i>消息</i></a></li>
		    <li><a href="javascript:void(0);"><b>36</b></a></li>
	    </ul>
	    <div class="user">
		    <span><a href="javascript:void(0);">${user.userName}</a></span>
		    <a href="javascript:void(0);">关于</a>&nbsp;&nbsp;
		    <a href="Exit.jsp" target="_parent">退出</a>
	    </div>
    </div>
    </body>
</html>
