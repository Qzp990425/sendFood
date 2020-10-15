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
			<div class="row pt-5 pb-5">
			  <div class="col-3">
			    <div class="list-group" id="list-tab" role="tablist">
			      <a class="list-group-item list-group-item-action " id="list-home-list"  href="${pageContext.request.contextPath}/user/myAccount.jsp" >主页</a>
			      <a class="list-group-item list-group-item-action active" id="list-profile-list" href="${pageContext.request.contextPath}/orderRecord/getOrderByUid" >我的订单</a>
			      <a class="list-group-item list-group-item-action" id="list-messages-list" href="${pageContext.request.contextPath}/address/getAddress" >我的地址</a>
			      <a class="list-group-item list-group-item-action " id="list-settings-list" href="${pageContext.request.contextPath}/user/myMsg.jsp" >信息修改</a>
			      			      <a class="list-group-item list-group-item-action" id="list-settings-list" href="${pageContext.request.contextPath}/user/myMoney.jsp" >账户充值</a>
			    </div>
			  </div>
			  <div class="col-9">
			    <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      		<table class="table">
					<tr>

                      <th>订单编号</th>
                      <th>商品图片</th>
                      <th>商品名称</th>
                      <th>商品单价</th>
                      <th>购买数量</th>
                      <th>状态</th>
                      <th>生成订单时间</th>
                      <th>商品发货时间</th>
                      <th>收货时间</th>
                      <th>操作</th>
					</tr>
					
					<c:forEach items="${pageInfo.list}" var="order">
                            <tr>
                                <td>${order.uuid}</td>
                                <td><img src="${pageContext.request.contextPath}/foodImg/${order.food.uuid}.jpg" style="width:100px;" /></td>
                                <td>${order.food.name}</td>
                                <td>${order.food.price}</td>
                                <td>${order.number}</td>
                                <td><c:if test="${order.status==0}">等待卖家发货</c:if>
                                	<c:if test="${order.status==1}">等待用户收货</c:if>
                                	<c:if test="${order.status==2}">完成</c:if>
                                </td>
                                <td>${order.createTime}</td>
                                <td>${order.sendTime}</td>
                                <td>${order.doneTime}</td>
                                <td>
                                	<c:if test="${order.status==1}">
                                	<a href="${pageContext.request.contextPath}/orderRecord/doneOrder?oid=${order.oid}" class="btn btn-primary">收货</a>
                                	</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                         <tr><td colspan="10" id="btnClick" style="text-align:center;">
                        	<c:if test="${pageInfo.prePage!=0}">
                        		<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageInfo.prePage}" class="btn btn-primary">上一页</a>
                        	</c:if>
                        	<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
                        		<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageNum.index}" class="btn btn-primary">${pageNum.index}</a>					
							</c:forEach>
							<c:if test="${pageInfo.nextPage!=0}">
								<a href="${pageContext.request.contextPath}/orderRecord/getOrderByUid?pageNum=${pageInfo.nextPage}" class="btn btn-primary">下一页</a>			
                     		</c:if>
                        </td></tr>
				</table>
			      
			      
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
<script src="${pageContext.request.contextPath}/user/js/bootstrap.min.js"></script>
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