<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服装分销后台登陆</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/cloud.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录服装后台管理平台</span>    
    <ul>
    <li><img src="images/help.png" title="帮助"  class="helpimg"/><a href="javascript:void(0);">帮助</a></li>
    <li><a href="javascript:void(0);">关于</a></li>
    </ul>    
    </div>
  
 <center>
 	 <div align="center" style="padding: 300px 200px 10px;width: 800px;" > 
      <div class="input-group input-group-lg">
         <span class="input-group-addon">账&nbsp;&nbsp;&nbsp;&nbsp;号</span>
         <input id="userName"  type="text" class="form-control" placeholder="请输入账户">
      </div><br>
 	<br><br>
 	<div class="input-group input-group-lg">
         <span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
         <input id="userPwd" type="password" class="form-control" placeholder="请输入密码">
      </div><br>
	</div>
 </center>
  <center>
 	<font id="msg_" ><strong id='msg' ></strong></font><br><br/><br/>
  	<button id='login' type="button" class="btn btn-success">登陆</button>&nbsp;&nbsp;&nbsp;&nbsp;
  	<button type="button" class="btn btn-success">注册</button>
  </center>
<script type="text/javascript">
	$(function(){
		//登陆
		$("#login").click(function(){
			//得到用户名账号密码
			var $name=$("#userName");
			var $pwd=$("#userPwd");
			if($name.val()==""){
				$name.css("borderColor","red");
				for(var i=0;i<=1;i++){
					$name.hide(50);
					$name.show(100);
				}
			}
			else if($pwd.val()==""){
				$pwd.css("borderColor","red");
				for(var i=0;i<=1;i++){
					$pwd.hide(50);
					$pwd.show(100);
				}
			}
			else{
				//登陆
				
				$.ajax({
					url:'user/login.action',
					data:{"userName":$name.val(),"userPwd":$pwd.val()},
					type:"post",
					success:function(res){
						if(res=="0"){
							$("#msg").html("登陆成功！");
							$("#msg_").attr("color","green");
							$pwd.val("");
							window.location.href='user/index.action';
						}
						else{
							$("#msg").html("登陆失败！请检查用户名密码是否错误！");
							$("#msg_").attr("color","red");
						}
					}
				});
			}
		});
		$("#userName").keyup(function(){
			  $("#userName").css("borderColor","#c0c0c0");
			  $("#userPwd").css("borderColor","#c0c0c0");
			  $("#msg").html("");
		})
		$("#userPwd").keyup(function(){
			 $("#userName").css("borderColor","#c0c0c0");
			  $("#userPwd").css("borderColor","#c0c0c0");
			  $("#msg").html("");
		})
	});	
</script>

    <div class="loginbm">版权所有归属  2016 个人版权所有</div>
</body>
</html>
	