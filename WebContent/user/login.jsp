<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
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
		   <div class="row content">
		   	<div class="col-md-3">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">菜品类型</h3>
		   	     <ul class="category">
		   	     	<c:forEach var="type" items="${types}">
			   	  		<li><a href="${pageContext.request.contextPath}/food/getFoodOnSaleByType?type=${type.tid}">${type.tname}</a></li>
			   	  	</c:forEach>
		   	     </ul>
		   	   </div>
		   	   <ul class="product_reviews">
		   	   </ul>
		   	 </div>
		     <div class="col-md-9">
		   	  <div class="breadcrumb">
				<a href="index.html">Home</a>  
				&gt;&gt;  <span class="last">Account/Login</span>
	          </div>
	          <div class="account_grid">
			   <div class="col-md-6 login-left">
				 <p>请通过一个账户访问此配送系统</p>				 
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>登录</h3>
				<p>如果你已经有一个账号 请进行登录</p>
				<form action="${pageContext.request.contextPath}/user/login" method="post">
				  <div>
					<span>学号<label>*</label></span>
					<input type="text" name="sno"> 
				  </div>
				  <div>
					<span>密码<label>*</label></span>
					<input type="text" name="password"> 
				  </div>
				 <div>
					<label>验证码</label>
                    <input type="text" name="captcha"  value="" />                            
                    <div class="captcha-image">
                    	<img id="security_code" onclick="changeCode()" src="getVerifyCode" style="margin-top:10px;">                       	
                    </div>
                   </div>
				  <a class="forgot" href="${pageContext.request.contextPath}/user/forget.jsp">忘记密码？</a>
				  <a class="acount-btn" href="${pageContext.request.contextPath}/user/register.jsp">创建新用户</a>
				  <input type="submit" value="登录">
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>	
		   </div>
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