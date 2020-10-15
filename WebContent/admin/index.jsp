<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>外卖销售后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/admin/css/adminStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".div2").click(
						function() {
							$(this).next("div").slideToggle("slow").siblings(
									".div3:visible").slideUp("slow");
						});
			});
	function openurl(url) {
		var rframe = parent.document.getElementById("rightFrame");
		rframe.src = url;
	}
</script>
<style>
body {
	margin: 0;
	font-family: 微软雅黑;
	background-image: url(images/.jpg);
	background-repeat: no-repea;
	background-size: cover;
	background-attachment: fixed;
	background-color: #DDDDDD
	
}

.top1 {
	position: absolute;
	top: 0px;
	width: 100%;
	height: 20px;
	text-align: center;
	color: #FFFFFF;
	font-size: 17px;
	font-height: 20px;
	font-family: 楷体;
	background-color: #888888
}

.title {
float:left;
    margin:-32px 20px;
	font-size: 40px;
	color: #FFFFFF;
	font-height: 55px;
	font-family: 隶书;
}

.top2 {
	position: absolute;
	top: 20px;
	width: 100%;
	height: 77px;
	text-align: center;
	color: #ccffff;
	background-color: #888888
}

.left {
	position: absolute;
	left: 0px;
	top: 97px;
	width: 200px;
	height: 85%;
	border-right: 1px solid #9370DB;
	color: #000000;
	font-size: 20px;
	text-align: center;
	background-color: #B3B3B3
}

.right {
	position: absolute;
	left: 200px;
	top:97px;
	width: 85.2%;
	height: 85%;
	border-top: 0px solid #484860;
	font-size: 14px;
	text-align: center;
}

.end {
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 30px;
	text-align: center;
	color: #556B2F;
	font-size: 17px;
	font-height: 20px;
	font-family: 楷体;
	background-color: #C0C0C0
}

.div1 {
	text-align: center;
	width: 200px;
	padding-top: 10px;
}

.div2 {
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	font-size: 18px;
	position: relative;
	border-bottom: #ccc 0px dotted;
}

.spgl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/1.png);
}

.yhgl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/4.png);
}

.gggl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/4.png);
}

.zlgl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/4.png);
}

.pjgl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/4.png);
}

.tcht {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 40px;
	top: 10px;
	background: url(images/2.png);
}

.div3 {
	display: none;
	cursor: pointer;
	font-size: 15px;
}

.div3 ul {
	margin: 0;
	padding: 0;
}

.div3 li {
	height: 30px;
	line-height: 30px;
	list-style: none;
	border-bottom: #ccc 1px dotted;
	text-align: center;
}

.a {
	text-decoration: none;
	color: #000000;
	font-size: 15px;
}

.a1 {
	text-decoration: none;
	color: #000000;
	font-size: 18px;
}
</style>
</head>
<body>

	<div class="top2">
		<div class="logo">
			<img src="images/admin_logo.png" title="在哪儿" />
		</div>
		<div class="title" >
			<h3>外卖配送后台管理</h3>
		</div>
		<div class="fr top-link">
			<a href="admin_list.html" target="mainCont" title="${admin.username}"><i
				class="adminIcon"></i><span>管理员：${admin.username}</span></a> 
				当前时间:<span id="mytime"></span>
		</div>
	</div>

	<div class="left">
		<div class="div1">
			<div class="left_top">
			</div>
			
           <div class="div2">
				<div class="spgl"></div>
				用户管理
			</div>
			<div class="div3">
				<li><a class="a" href="javascript:void(0);"
					onClick="openurl('${pageContext.request.contextPath}/user/getAllUser');">查看普通用户</a></li>
			   <li><a class="a" href="javascript:void(0);"
					onClick="openurl('${pageContext.request.contextPath}/admin/getAllAdmin');">查看管理员</a></li>
				<li><a class="a" href="javascript:void(0);"
					onClick="openurl('${pageContext.request.contextPath}/admin/adminAdd.jsp');">新增管理员</a></li>
			</div>
			<div class="div2">
				<div class="spgl"></div>
				类型管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('${pageContext.request.contextPath}/type/getAllType');">查看所有类型</a></li>
					
				</ul>
			</div>
			
			<div class="div2">
				<div class="gggl"></div>
				餐品管理
			</div>
			<div class="div3">

				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('${pageContext.request.contextPath}/food/getAllFood');">餐品列表</a></li>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('${pageContext.request.contextPath}/admin/foodAdd.jsp');">餐品添加</a></li>
				</ul>

			</div>
			<div class="div2">
				<div class="pjgl"></div>
				订单管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('${pageContext.request.contextPath}/orderRecord/getAllOrder');">查看订单</a></li>
				</ul>
			</div>
			<div class="div2">
				<div class="pjgl"></div>
				信息修改
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);"
						onClick="openurl('${pageContext.request.contextPath}/admin/adminupdate.jsp');">密码修改</a></li>
				</ul>
			</div>
			<a class="a1" href="${pageContext.request.contextPath}/admin/login.jsp"><div class="div2">
					<div class="tcht"></div>
					退出后台
			</div></a>
		</div>
	</div>

	<div class="right">
		<iframe id="rightFrame" name="rightFrame" width="100%" height="100%"
			scrolling="auto" marginheight="0" marginwidth="0" align="center"
			style="border: 0px solid #CCC; margin: 0; padding: 0;"></iframe>
	</div>

	





</body>

	<script type="text/javascript">
	function showTime() {
		nowtime = new Date();
		year = nowtime.getFullYear();
		month = nowtime.getMonth() + 1;
		date = nowtime.getDate();
		document.getElementById("mytime").innerText = year + "年" + month + "月" + date + "日" + nowtime.toLocaleTimeString();
	}
	setInterval("showTime()", 1000);
</script>
</html>