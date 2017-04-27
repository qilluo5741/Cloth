<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>error.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
            body { font: 12px/22px \5fae\8f6f\96c5\9ed1, \5b8b\4f53, Arial, Sans-serif;
            color: #333;} a { color: #333; text-decoration:
            none; } a:hover { color: #00ab03; text-decoration: underline; } .pop{ border:5px
            solid #50bf52; border-radius:10px; background-color:#fff; width:430px;
            height:230px; position:absolute; left:50%; margin-left:-215px;top:50%;
            margin-top:-135px;} .pop .xy{background:url(images/xy.png)
            no-repeat; display:block; position:absolute; left:-60px; top:-70px; width:134px;
            height:181px;} .f18{ font-size:18px;} .mb20{ margin-bottom:20px;}.tc{ text-align:center;}.g
            {color: #00ab03;}
        </style>
	<link rel='stylesheet prefetch' href='http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css'>
	<link rel='stylesheet prefetch' href='Layer_out/css/animate.min.css'>
	<link rel="stylesheet" type="text/css" href="Layer_out/css/default.css">
	<link rel="stylesheet" type="text/css" href="Layer_out/css/styles.css">
  </head>
  
  <body>
  <div class="htmleaf-container">
	<div id='ss_menu'>
	  <div>
		<i class="fa fa-qq"></i>
	  </div>
	  <div>
		<i class="fa fa-weibo"></i>
	  </div>
	  <div>
		<i class="fa fa-weixin"></i>
	  </div>
	  <div>
		<i class="fa fa-renren"></i>
	  </div>
	  <div class='menu'>
		<div class='share' id='ss_toggle' data-rot='180'>
		  <div class='circle'></div>
		  <div class='bar'></div>
		</div>
	  </div>
	</div>
</div>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script>
$(document).ready(function (ev) {
	var toggle = $('#ss_toggle');
	var menu = $('#ss_menu');
	var rot;
	$('#ss_toggle').on('click', function (ev) {
		rot = parseInt($(this).data('rot')) - 180;
		menu.css('transform', 'rotate(' + rot + 'deg)');
		menu.css('webkitTransform', 'rotate(' + rot + 'deg)');
		if (rot / 180 % 2 == 0) {
			toggle.parent().addClass('ss_active');
			toggle.addClass('close');
		} else {
			toggle.parent().removeClass('ss_active');
			toggle.removeClass('close');
		}
		$(this).data('rot', rot);
	});
	menu.on('transitionend webkitTransitionEnd oTransitionEnd', function () {
		if (rot / 180 % 2 == 0) {
			$('#ss_menu div i').addClass('ss_animate');
		} else {
			$('#ss_menu div i').removeClass('ss_animate');
		}
	});
});
</script>
    <div class="pop">
            <i class="xy">
            </i>
            <h1>
                <p class="tc f18 g mb20" style="margin-top:100px;">
                    <font color="red" style="font-weight:bold">
                        /(ㄒoㄒ)/~~
                    </font>
                		  网站建设中...请等待！！！！！<a href="javascript:history.go(-1)" style="color:#00ab03">返回</a>
                </p>
            </h1>
        </div>
  </body>
</html>
