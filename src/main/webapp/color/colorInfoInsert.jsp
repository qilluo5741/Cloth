<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'colorInfoupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta content="MSHTML 6.00.2900.5583" name=GENERATOR>
	<style type=text/css>
		td {FONT-SIZE: 12px; WORD-BREAK: break-all; FONT-FAMILY: "宋体"}
		body {SCROLLBAR-FACE-COLOR: #eeeaeb; SCROLLBAR-HIGHLIGHT-COLOR: #fbfdfc; SCROLLBAR-SHADOW-COLOR: #170708; COLOR: black; SCROLLBAR-3DLIGHT-COLOR: #170708;SCROLLBAR-ARROW-COLOR: #000000; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; SCROLLBAR-BASE-COLOR: #170708}
	</style>

	<SCRIPT language=JavaScript>
		function ChangeColor(form, ColorName)
			{ 
				  var ColorValue = " ";
				  if (ColorName == '艾利斯兰')       ColorValue = "#F0F8FF";
				  if (ColorName == '古董白')  ColorValue = "#FAEBD7";
				  if (ColorName == '浅绿色')       ColorValue = "#00FFFF";
				  if (ColorName == '碧绿色')  ColorValue = "#7FFFD4";
				  if (ColorName == '天蓝色')  ColorValue = "#F0FFFF";
				  if (ColorName == '米色')  ColorValue = "#F5F5DC";
				  if (ColorName == '桔黄色')  ColorValue = "#FFE4C4";
				  if (ColorName == '黑色')  ColorValue = "#000000";
				  if (ColorName == '白杏色')  ColorValue = "#FFEBCD";
				  if (ColorName == '蓝色')  ColorValue = "#0000FF";
				  if (ColorName == '紫罗兰色')  ColorValue = "#8A2BE2";
				  if (ColorName == '褐色')  ColorValue = "#A52A2A";
				  if (ColorName == '实木色')  ColorValue = "#DEB887";
				  if (ColorName == '军兰色')  ColorValue = "#5F9EA0";
				  if (ColorName == '黄绿色')  ColorValue = "#7FFF00";
				  if (ColorName == '巧可力色')  ColorValue = "#D2691E";
				  if (ColorName == '珊瑚色')  ColorValue = "#FF7F50";
				  if (ColorName == '菊兰色')  ColorValue = "#6495ED";
				  if (ColorName == '米绸色')  ColorValue = "#FFF8DC";
				  if (ColorName == '暗深红色')  ColorValue = "#DC143C";
				  if (ColorName == '青色')  ColorValue = "#00FFFF";
				  if (ColorName == '暗蓝色')  ColorValue = "#00008B";
				  if (ColorName == '暗青色')  ColorValue = "#008B8B";
				  if (ColorName == '暗金黄色')  ColorValue = "#B8860B";
				  if (ColorName == '暗灰色')  ColorValue = "#A9A9A9";
				  if (ColorName == '暗绿色')  ColorValue = "#006400";
				  if (ColorName == '暗黄褐色')  ColorValue = "#BDB76B";
				  if (ColorName == '暗洋红')  ColorValue = "#8B008B";
				  if (ColorName == '暗橄榄绿')  ColorValue = "#556B2F";
				  if (ColorName == '暗桔黄色')  ColorValue = "#FF8C00";
				  if (ColorName == '暗紫色')  ColorValue = "#9932CC";
				  if (ColorName == '暗红色')  ColorValue = "#8B0000";
				  if (ColorName == '暗肉色')  ColorValue = "#E9967A";
				  if (ColorName == '暗海兰色')  ColorValue = "#8FBC8F";
				  if (ColorName == '暗灰蓝色')  ColorValue = "#483D8B";
				  if (ColorName == '墨绿色')  ColorValue = "#2F4F4F";
				  if (ColorName == '暗宝石绿')  ColorValue = "#00CED1";
				  if (ColorName == '暗紫罗兰色')  ColorValue = "#9400D3";
				  if (ColorName == '深粉红色')  ColorValue = "#FF1493";
				  if (ColorName == '深天蓝色')  ColorValue = "#00BFFF";
				  if (ColorName == '暗灰色')  ColorValue = "#696969";
				  if (ColorName == '闪兰色')  ColorValue = "#1E90FF";
				  if (ColorName == '火砖色')  ColorValue = "#B22222";
				  if (ColorName == '花白色')  ColorValue = "#FFFAF0";
				  if (ColorName == '森林绿')  ColorValue = "#228B22";
				  if (ColorName == '紫红色')  ColorValue = "#FF00FF";
				  if (ColorName == '淡灰色')  ColorValue = "#DCDCDC";
				  if (ColorName == '幽灵白')  ColorValue = "#F8F8FF";
				  if (ColorName == '金色')  ColorValue = "#FFD700";
				  if (ColorName == '金麒麟色')  ColorValue = "#DAA520";
				  if (ColorName == '灰色')  ColorValue = "#808080";
				  if (ColorName == '绿色')  ColorValue = "#008000";
				  if (ColorName == '黄绿色')  ColorValue = "#ADFF2F";
				  if (ColorName == '蜜色')  ColorValue = "#F0FFF0";
				  if (ColorName == '热粉红色')  ColorValue = "#FF69B4";
				  if (ColorName == '印第安红')  ColorValue = "#CD5C5C";
				  if (ColorName == '靛青色')  ColorValue = "#4B0082";
				  if (ColorName == '象牙色')  ColorValue = "#FFFFF0";
				  if (ColorName == '黄褐色')  ColorValue = "#F0E68C";
				  if (ColorName == '淡紫色')  ColorValue = "#E6E6FA";
				  if (ColorName == '淡紫红')  ColorValue = "#FFF0F5";
				  if (ColorName == '草绿色')  ColorValue = "#7CFC00";
				  if (ColorName == '柠檬绸色')  ColorValue = "#FFFACD";
				  if (ColorName == '亮蓝色')  ColorValue = "#ADD8E6";
				  if (ColorName == '亮珊瑚色')  ColorValue = "#F08080";
				  if (ColorName == '亮青色')  ColorValue = "#E0FFFF";
				  if (ColorName == '亮金黄色')  ColorValue = "#FAFAD2";
				  if (ColorName == '亮绿色')  ColorValue = "#90EE90";
				  if (ColorName == '亮灰色')  ColorValue = "#D3D3D3";
				  if (ColorName == '亮粉红色')  ColorValue = "#FFB6C1";
				  if (ColorName == '亮肉色')  ColorValue = "#FFA07A";
				  if (ColorName == '亮海蓝色')  ColorValue = "#20B2AA";
				  if (ColorName == '亮天蓝色')  ColorValue = "#87CEFA";
				  if (ColorName == '亮蓝灰')  ColorValue = "#778899";
				  if (ColorName == '亮钢兰色')  ColorValue = "#B0C4DE";
				  if (ColorName == '亮黄色')  ColorValue = "#FFFFE0";
				  if (ColorName == '酸橙色')  ColorValue = "#00FF00";
				  if (ColorName == '橙绿以')  ColorValue = "#32CD32";
				  if (ColorName == '亚麻色')  ColorValue = "#FAF0E6";
				  if (ColorName == '红紫色')  ColorValue = "#FF00FF";
				  if (ColorName == '粟色')  ColorValue = "#800000";
				  if (ColorName == '间绿色')  ColorValue = "#66CDAA";
				  if (ColorName == '间兰色')  ColorValue = "#0000CD";
				  if (ColorName == '间紫色')  ColorValue = "#BA55D3";
				  if (ColorName == '间紫色')  ColorValue = "#9370DB";
				  if (ColorName == '间海蓝')  ColorValue = "#3CB371";
				  if (ColorName == '间暗蓝色')  ColorValue = "#7B68EE";
				  if (ColorName == '间春绿色')  ColorValue = "#00FA9A";
				  if (ColorName == '间绿宝石')  ColorValue = "#48D1CC";
				  if (ColorName == '间紫罗兰色')  ColorValue = "#C71585";
				  if (ColorName == '中灰兰色')  ColorValue = "#191970";
				  if (ColorName == '薄荷色')  ColorValue = "#F5FFFA";
				  if (ColorName == '浅玫瑰色')  ColorValue = "#FFE4E1";
				  if (ColorName == '鹿皮色')  ColorValue = "#FFE4B5";
				  if (ColorName == '纳瓦白')  ColorValue = "#FFDEAD";
				  if (ColorName == '海军色')  ColorValue = "#000080";
				  if (ColorName == '老花色')  ColorValue = "#FDF5E6";
				  if (ColorName == '橄榄色')  ColorValue = "#808000";
				  if (ColorName == '深绿褐色')  ColorValue = "#6B8E23";
				  if (ColorName == '橙色')  ColorValue = "#FFA500";
				  if (ColorName == '红橙色')  ColorValue = "#FF4500";
				  if (ColorName == '淡紫色')  ColorValue = "#DA70D6";
				  if (ColorName == '苍麒麟色')  ColorValue = "#EEE8AA";
				  if (ColorName == '苍绿色')  ColorValue = "#98FB98";
				  if (ColorName == '苍宝石绿')  ColorValue = "#AFEEEE";
				  if (ColorName == '苍紫罗兰色')  ColorValue = "#DB7093";
				  if (ColorName == '番木色')  ColorValue = "#FFEFD5";
				  if (ColorName == '桃色')  ColorValue = "#FFDAB9";
				  if (ColorName == '秘鲁色')  ColorValue = "#CD853F";
				  if (ColorName == '粉红色')  ColorValue = "#FFC0CB";
				  if (ColorName == '洋李色')  ColorValue = "#DDA0DD";
				  if (ColorName == '粉蓝色')  ColorValue = "#B0E0E6";
				  if (ColorName == '紫色')  ColorValue = "#800080";
				  if (ColorName == '红色')  ColorValue = "#FF0000";
				  if (ColorName == '褐玫瑰红')  ColorValue = "#BC8F8F";
				  if (ColorName == '皇家蓝')  ColorValue = "#4169E1";
				  if (ColorName == '重褐色')  ColorValue = "#8B4513";
				  if (ColorName == '鲜肉色')  ColorValue = "#FA8072";
				  if (ColorName == '沙褐色')  ColorValue = "#F4A460";
				  if (ColorName == '海绿色')  ColorValue = "#2E8B57";
				  if (ColorName == '海贝色')  ColorValue = "#FFF5EE";
				  if (ColorName == '赭色')  ColorValue = "#A0522D";
				  if (ColorName == '银色')  ColorValue = "#C0C0C0";
				  if (ColorName == '天蓝色')  ColorValue = "#87CEEB";
				  if (ColorName == '石蓝色')  ColorValue = "#6A5ACD";
				  if (ColorName == '灰石色')  ColorValue = "#708090";
				  if (ColorName == '雪白色')  ColorValue = "#FFFAFA";
				  if (ColorName == '春绿色')  ColorValue = "#00FF7F";
				  if (ColorName == '钢兰色')  ColorValue = "#4682B4";
				  if (ColorName == '茶色')  ColorValue = "#D2B48C";
				  if (ColorName == '水鸭色')  ColorValue = "#008080";
				  if (ColorName == '蓟色')  ColorValue = "#D8BFD8";
				  if (ColorName == '西红柿色')  ColorValue = "#FF6347";
				  if (ColorName == '青绿色')  ColorValue = "#40E0D0";
				  if (ColorName == '紫罗兰色')  ColorValue = "#EE82EE";
				  if (ColorName == '浅黄色')  ColorValue = "#F5DEB3";
				  if (ColorName == '白色')  ColorValue = "#FFFFFF";
				  if (ColorName == '烟白色')  ColorValue = "#F5F5F5";
				  if (ColorName == '黄色')  ColorValue = "#FFFF00";
				  if (ColorName == '黄绿色')  ColorValue = "#9ACD32";
				  document.bgColor = ColorValue;
				  form.colorNo.value = ColorValue;
				  form.colorName.value = ColorName;
			}
	</SCRIPT>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#color_bun").click(function(){
				var colorNo = $("#colorNo").val();
				var colorName = $("#colorName").val();
				var colorremark = $("#colorRemark").val();
				$.ajax({
					url:"color/selectColorNo.action",
					type:"post",
					data:{
						colorNo:colorNo
					},
					dataType:"text",
					success:function(ref){
						if(ref == "true" || ref == true){
							alert("该颜色已经存在，请选择其他颜色！");
							return false;
						}
						else{
							$("#bgcolor").submit();
						}
						
					},
					error:function(){alert("请求错误！");}
				});
			});
		});
		
	</script>

	
	
	</HEAD>
	<body leftMargin=0 topMargin=0>
		<center><h2>添加颜色</h2></center>
		<form id="bgcolor" method="post" action="color/insert.action">
			<table cellSpacing=1 cellPadding=1 width=770 align=center border=1>
				 <tbody>
					  	<tr>
							<td align="middle" colSpan=2><B>颜色名称:</B> <INPUT onmouseover=this.focus() 
							  	onfocus=this.select() size=15 value=snow name="colorName" id="colorName" ></td>
							<td align="middle" colSpan=2><B>颜色数值:</B> <INPUT onmouseover=this.focus() 
							  	onfocus=this.select() size=15 value=#FFFAFA name="colorNo" id="colorNo">
							<INPUT type="hidden" name="colorRemark" value="这家伙很懒，什么都没留下！" id="colorRemark"></td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '白色')" 
							  	type=radio name=bgcolor>白色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '烟白色')" 
							  	type=radio name=bgcolor> 烟白色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黄色')" 
							  	type=radio name=bgcolor> 黄色</td>
					  </tr>
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '艾利斯兰')" 
							  	type=radio name=bgcolor> 艾利斯兰 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '古董白')" 
							  	type=radio name=bgcolor> 古董白 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '浅绿色')" 
							  	type=radio name=bgcolor> 浅绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '碧绿色')" 
							  	type=radio name=bgcolor> 碧绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '天蓝色')" 
							  	type=radio name=bgcolor> 天蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '米色')" 
							  	type=radio name=bgcolor> 米色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '桔黄色')" 
							  	type=radio name=bgcolor> 桔黄色 </td>
					  </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '白杏色')" 
								type=radio name=bgcolor> 白杏色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '蓝色')" 
							  	type=radio name=bgcolor> 蓝色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '紫罗兰色')" 
							  	type=radio name=bgcolor> 紫罗兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '褐色')" 
							  	type=radio name=bgcolor> 褐色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '实木色')" 
							  	type=radio name=bgcolor> 实木色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '军兰色')" 
							  	type=radio name=bgcolor> 军兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黄绿色')" 
							  	type=radio name=bgcolor> 黄绿色</td>
					  </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '珊瑚色')" 
							  	type=radio name=bgcolor> 珊瑚色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '菊兰色')" 
								type=radio name=bgcolor> 菊兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '米绸色')" 
							  	type=radio name=bgcolor> 米绸色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗深红色')" 
							  	type=radio name=bgcolor> 暗深红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '青色')" 
							  	type=radio name=bgcolor> 青色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗蓝色')" 
							  	type=radio name=bgcolor> 暗蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗青色')" 
							  	type=radio name=bgcolor> 暗青色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗灰色')" 
								type=radio name=bgcolor> 暗灰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗绿色')" 
								type=radio name=bgcolor> 暗绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗黄褐色')" 
								type=radio name=bgcolor> 暗黄褐色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗洋红')" 
								type=radio name=bgcolor> 暗洋红 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗橄榄绿')" 
								type=radio name=bgcolor> 暗橄榄绿</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗桔黄色')" 
								type=radio name=bgcolor> 暗桔黄色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗紫色')" 
								type=radio name=bgcolor> 暗紫色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗肉色')" 
								type=radio name=bgcolor> 暗肉色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗海兰色')" 
								type=radio name=bgcolor> 暗海兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗灰蓝色')" 
								type=radio name=bgcolor> 暗灰蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '墨绿色')" 
								type=radio name=bgcolor> 墨绿色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗宝石绿')" 
								type=radio name=bgcolor> 暗宝石绿</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗紫罗兰色')" 
								type=radio name=bgcolor> 暗紫罗兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '深粉红色')" 
								type=radio name=bgcolor> 深粉红色</td>
					  </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗灰色')" 
								type=radio name=bgcolor> 暗灰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '闪兰色')" 
								type=radio name=bgcolor> 闪兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '火砖色')" 
								type=radio name=bgcolor> 火砖色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '花白色')" 
								type=radio name=bgcolor> 花白色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '森林绿')" 
								type=radio name=bgcolor> 森林绿 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '紫红色')" 
								type=radio name=bgcolor> 紫红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '淡灰色')" 
								type=radio name=bgcolor> 淡灰色</td>
					  </tr>
				  	  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '金色')" 
								type=radio name=bgcolor> 金色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '金麒麟色')" 
								type=radio name=bgcolor> 金麒麟色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '灰色')" 
								type=radio name=bgcolor> 灰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '绿色')" 
								type=radio name=bgcolor> 绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黄绿色')" 
								type=radio name=bgcolor> 黄绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '蜜色')" 
								type=radio name=bgcolor> 蜜色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '热粉红色')" 
								type=radio name=bgcolor> 热粉红色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '靛青色')" 
								type=radio name=bgcolor> 靛青色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '象牙色')" 
								type=radio name=bgcolor> 象牙色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黄褐色')" 
								type=radio name=bgcolor> 黄褐色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '淡紫色')" 
								type=radio name=bgcolor> 淡紫色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '淡紫红')" 
								type=radio name=bgcolor> 淡紫红</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '草绿色')" 
								type=radio name=bgcolor> 草绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '柠檬绸色')" 
								type=radio name=bgcolor> 柠檬绸色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮珊瑚色')" 
								type=radio name=bgcolor> 亮珊瑚色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮青色')" 
								type=radio name=bgcolor> 亮青色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮金黄色')" 
								type=radio name=bgcolor> 亮金黄色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮绿色')" 
								type=radio name=bgcolor> 亮绿色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮灰色')" 
								type=radio name=bgcolor> 亮灰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮粉红色')" 
								type=radio name=bgcolor> 亮粉红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮肉色')" 
								type=radio name=bgcolor> 亮肉色</td>
					  </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮天蓝色')" 
								type=radio name=bgcolor> 亮天蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮蓝灰')" 
								type=radio name=bgcolor> 亮蓝灰</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮钢兰色')" 
								type=radio name=bgcolor> 亮钢兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮黄色')" 
								type=radio name=bgcolor> 亮黄色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '酸橙色')" 
								type=radio name=bgcolor> 酸橙色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '橙绿以')" 
								type=radio name=bgcolor> 橙绿以</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亚麻色')" 
								type=radio name=bgcolor> 亚麻色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '粟色')" 
								type=radio name=bgcolor> 粟色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间绿色')" 
								type=radio name=bgcolor> 间绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间兰色')" 
								type=radio name=bgcolor> 间兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间紫色')" 
								type=radio name=bgcolor> 间紫色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间紫色')" 
								type=radio name=bgcolor> 间紫色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间海蓝')" 
								type=radio name=bgcolor> 间海蓝</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间暗蓝色')" 
								type=radio name=bgcolor> 间暗蓝色</td>
					 </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间绿宝石')" 
								type=radio name=bgcolor> 间绿宝石</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间紫罗兰色')" 
								type=radio name=bgcolor> 间紫罗兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '中灰兰色')" 
								type=radio name=bgcolor> 中灰兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '薄荷色')" 
								type=radio name=bgcolor> 薄荷色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '浅玫瑰色')" 
								type=radio name=bgcolor> 浅玫瑰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '鹿皮色')" 
								type=radio name=bgcolor> 鹿皮色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '纳瓦白')" 
								type=radio name=bgcolor> 纳瓦白</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '老花色')" 
								type=radio name=bgcolor> 老花色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '橄榄色')" 
								type=radio name=bgcolor> 橄榄色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '深绿褐色')" 
								type=radio name=bgcolor> 深绿褐色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '橙色')" 
								type=radio name=bgcolor> 橙色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '红橙色')" 
								type=radio name=bgcolor> 红橙色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '淡紫色')" 
								type=radio name=bgcolor> 淡紫色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '苍麒麟色')" 
								type=radio name=bgcolor> 苍麒麟色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '苍宝石绿')" 
								type=radio name=bgcolor> 苍宝石绿 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '苍紫罗兰色')" 
								type=radio name=bgcolor> 苍紫罗兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '番木色')" 
								type=radio name=bgcolor> 番木色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '桃色')" 
								type=radio name=bgcolor> 桃色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '秘鲁色')" 
								type=radio name=bgcolor> 秘鲁色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '粉红色')" 
								type=radio name=bgcolor> 粉红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '洋李色')" 
								type=radio name=bgcolor> 洋李色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '紫色')" 
								type=radio name=bgcolor> 紫色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '红色')" 
								type=radio name=bgcolor> 红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '褐玫瑰红')" 
								type=radio name=bgcolor> 褐玫瑰红</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '皇家蓝')" 
								type=radio name=bgcolor> 皇家蓝</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '重褐色')" 
								type=radio name=bgcolor> 重褐色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '鲜肉色')" 
								type=radio name=bgcolor> 鲜肉色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '沙褐色')" 
								type=radio name=bgcolor> 沙褐色</td>
					  </tr> 
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '海贝色')" 
								type=radio name=bgcolor> 海贝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '赭色')" 
								type=radio name=bgcolor> 赭色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '银色')" 
								type=radio name=bgcolor> 银色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '天蓝色')" 
								type=radio name=bgcolor> 天蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '石蓝色')" 
								type=radio name=bgcolor> 石蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '灰石色')" 
								type=radio name=bgcolor> 灰石色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '雪白色')" 
								type=radio CHECKED name=bgcolor> 雪白色</td>
					  </tr>  
					  <tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '钢兰色')" 
								type=radio name=bgcolor> 钢兰色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '茶色')" 
								type=radio name=bgcolor> 茶色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '水鸭色')" 
								type=radio name=bgcolor> 水鸭色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '蓟色')" 
								type=radio name=bgcolor> 蓟色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '西红柿色')" 
								type=radio name=bgcolor> 西红柿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '青绿色')" 
								type=radio name=bgcolor> 青绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '紫罗兰色')" 
								type=radio name=bgcolor> 紫罗兰色</td>
						</tr>
						<tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黄绿色')" 
								type=radio name=bgcolor> 黄绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '黑色')" 
							  type=radio name=bgcolor> 黑色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '巧可力色')" 
								type=radio name=bgcolor> 巧可力色 </td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗金黄色')" 
								type=radio name=bgcolor> 暗金黄色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '暗红色')" 
								type=radio name=bgcolor> 暗红色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '深天蓝色')" 
								type=radio name=bgcolor> 深天蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '幽灵白')" 
								type=radio name=bgcolor> 幽灵白</td>
						</tr>
						<tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '印第安红')" 
								type=radio name=bgcolor> 印第安红</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮蓝色')" 
								type=radio name=bgcolor> 亮蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '亮海蓝色')" 
								type=radio name=bgcolor> 亮海蓝色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '红紫色')" 
								type=radio name=bgcolor> 红紫色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '间春绿色')" 
								type=radio name=bgcolor> 间春绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '海军色')" 
								type=radio name=bgcolor> 海军色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '苍绿色')" 
								type=radio name=bgcolor> 苍绿色 </td>
						</tr>
						<tr>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '粉蓝色')" 
								type=radio name=bgcolor> 粉蓝色</td>
							 <td width="12.5%"><INPUT onClick="ChangeColor(this.form, '海绿色')" 
								type=radio name=bgcolor> 海绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '春绿色')" 
								type=radio name=bgcolor> 春绿色</td>
							<td width="12.5%"><INPUT onClick="ChangeColor(this.form, '浅黄色')" 
								type=radio name=bgcolor> 浅黄色</td>
							<td colspan="3" algin="center">
								<input type="button" value="确定" id="color_bun"/> 
								<input type="reset" value="重置"/> 
							</td>
						</tr>
			   	</tbody>
			</table>
		</form>
	</body>
</html>
