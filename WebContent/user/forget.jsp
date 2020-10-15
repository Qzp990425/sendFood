<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link href="${pageContext.request.contextPath}/user/css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/user/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!----webfonts---->
<!---<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>--->
</head>
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
<body>
	<div class="header">
		<div class="container">
		  <div class="header_top">
			<ul class="phone">
				
			</ul>
			<ul class="social">
			</ul>
			<c:if test="${!empty user}">
				<ul class="account" style="margin-left:900px;">
					<li><a href="${pageContext.request.contextPath}/user/myAccount.jsp">我的账户</a></li>
				</ul>
				<ul class="shopping_cart">
				   <a href="${pageContext.request.contextPath}/shopCar/getShopCar"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
				   <div class="clearfix"> </div>
				</ul>
			</c:if>
			<div class="clearfix"></div>
		</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo" style="position: relative;top: 30px;">
				<h1><a href="${pageContext.request.contextPath}/food/getFoodOnSale">校园餐饮配送平台</a></h1>
				当前时间:<span id="mytime"></span>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="index.html"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
				<!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="display:inline-block;">
		          <ul class="login" style="position: relative;top: -50px;left:200px;">
		          	<a href="${pageContext.request.contextPath}/user/login.jsp"><li class="login_top"><i class="sign"> </i><span>登录</span></li></a>
		            <a href="${pageContext.request.contextPath}/user/register.jsp"><li class="login_bottom"><i class="register"> </i><span>注册</span></li></a>
		          </ul>
			      <div class="clearfix"></div>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
            <div class="clearfix"></div>
           </div>
		 </div>  
		</div>
	</div>
    <div class="main">
		<div class="container">
		  <div class="Product_top">
		  	  <form action="${pageContext.request.contextPath}/user/forget"> 
				 <div class="register-top-grid">
					<h3>个人信息</h3>

					 <div>
						<span>学号<label>*</label></span>
						<input type="text" name="sno"> 
					 </div>
					 <div>
						 <span>手机号<label>*</label></span>
						 <input type="text" name="tel"> 
					 </div>
					 <div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
						<div class="register-bottom-grid">
							<h3>登录凭证</h3>
							 <div>
								<span>更改后密码<label>*</label></span>
								<input type="text" name="password">
							 </div>
						  </div>
				  <div class="clearfix"> </div>
					<div class="register-but">
						 <input type="submit" value="提交">
						 <div class="clearfix"> </div>
						</form>
						
					</div>
			</div>
	  </div>
	</div>
    <div class="footer">
	</div>
	<input type="hidden" id="msg" value="${msg}">
</body>
		<script src="${pageContext.request.contextPath}/user/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
		        //jQuery代码
		       var msg = $("#msg").val();
		       if(!isEmpty(msg)){
		             alert(msg);
		       }
		});
		function isEmpty(value){
		    if(value == null || value == "" || value == "undefined" || value ==  undefined || value == "null"){
		        return true;
		    }
		    else{
		        value = value.replace(/\s/g,"");
		        if(value == ""){
		            return true;
		        }
		        return false;
		    }
		}
	</script>
	<script>

		function changeCode(){	

	         var src = "getVerifyCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
	 
	    		$('#security_code').attr("src",src);                  //jQuery写法
		     
		}
	</script>
</html>