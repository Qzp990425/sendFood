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
			    <c:if test="${empty user}">
		          <ul class="login" style="position: relative;top: -50px;left:200px;">
		          	<a href="${pageContext.request.contextPath}/user/login.jsp"><li class="login_top"><i class="sign"> </i><span>登录</span></li></a>
		            <a href="${pageContext.request.contextPath}/user/register.jsp"><li class="login_bottom"><i class="register"> </i><span>注册</span></li></a>
		          </ul>
		          </c:if>
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
		   	  	<form action="${pageContext.request.contextPath}/orderRecord/insertOrder">
					<table class="table">
						<tr>
							<th>商品名称</th>
							<th>商品图片</th>
							<th>原价</th>
							<th>现价</th>
							<th>购买数量</th>
							<th>库存数量</th>
							<th>总计</th>
							<th>操作</th>
						</tr>
						
						<c:forEach var="shopCar" items="${shopCars}">
							<input type="hidden" value="${shopCar.sid}" name="sid">
							<input type="hidden" value="${shopCar.food.fid}" name="fid">
							<tr>					
								<td>${shopCar.food.name}</td>
								<td><img src="${pageContext.request.contextPath}/foodImg/${shopCar.food.uuid}.jpg" style="width:100px;height:100px;"/></td>
								<td>${shopCar.food.price}元</td>
								<td>${shopCar.food.nowPrice}元</td>
								<td><input type="hidden" value="${shopCar.food.number}"><input type="hidden" value="${shopCar.food.nowPrice}"><input class="myNum" type="number" value="1" name="number" style="width:50px;">份</td>
								<td>${shopCar.food.number}份</td>
								<td>${shopCar.food.nowPrice}元</td>
								<td><a href="${pageContext.request.contextPath}/shopCar/deleteById?sid=${shopCar.sid}">移除</a></td>
							</tr>
							<input type="hidden" value="${shopCar.food.nowPrice}" name="price">
						</c:forEach>
					</table>
			       
			    	<c:if test="${empty addresses}">
			  			<script>
			  				alert("您还没有填入收货地址，请到个人中心填写");
							window.location.href="/sendFood/address/getAddress";
			  			</script>
			  		</c:if>
			    	<p style="padding-left:700px;">
			  		选择收货地址
			  		<select name="name">
				  		<c:forEach var="address" items="${addresses}">
				  			<option value="${address.name}">${address.name}</option>
				  		</c:forEach>
			  		</select>
			  		</p>
			
			  		<input type="submit" class="blue-button" style="width:78px;float:right;" value="立即支付">
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
	
	<script>
		$(".myNum").change(function(){
			var num = $(this).val();
			var allNum = $(this).prev().prev().val();
			if(allNum*1 >= num*1) {
				var price = $(this).prev().val();
				var total = price*1*num*1;
				$(this).parent().next().next().text(total+"元");
				$(this).parent().parent().next().val(total);
			} else {
				alert("超出库存");
				$(this).val(1);
				var price = $(this).prev().val();
				$(this).parent().next().next().text(price+"元");
				$(this).parent().parent().next().val(price);
			}
		})
		
	</script>
</html>