<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
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
			 
			 <nav class="navbar navbar-default menu" role="navigation">
			 	<h3 class="nav_right">
			 		<a href="#"><img src="images/logo.png" class="img-responsive" alt=""/></a>
			 	</h3>
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
            <div class="search">
            <form action="${pageContext.request.contextPath}/food/getFoodByName" method="post">
			  <input type="text" class="text" value="请输入关键字" name="name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入关键字';}">
			  <input type="submit" value="搜索">
			</form>
			</div>
		 </div>  
		</div>
	</div>

    <div class="main">
		<div class="container">
			<div class="banner">
			 	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath}/user/images/l1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/user/images/l2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/user/images/l3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
		   <div class="row content">
		   	<div class="col-md-3 content_top">
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
		   	    <ul class="feature">
		   	   	 <h3><i class="arrow"> </i><span>Popular products</span></h3>
		   	   </ul>
		   	   <div class="row content_bottom">
		   	   		<c:forEach var="food" items="${pageInfo.list}">
			   	   <div class="col-md-3">
			   	   	<div class="content_box"><a href="single.html">
			   	   	  	<div class="view view-fifth">
			   	   	     <img src="${pageContext.request.contextPath}/foodImg/${food.uuid}.jpg" class="img-responsive" alt="" style="width:190px;height:141px;"/>
				   	   	 <div class="content_box-grid">
				   	   	  <p class="m_1"><h5>${food.name}</h5></p>
				   	  		<p class="m_1">${food.introduction}</p>
				   	   	  <div class="price">原价:
						    <span class="actual">${food.price}元</span>
						  </div>
				   	   	  <div class="price">网上价钱:
						    <span class="actual">${food.nowPrice}元</span>
						  </div>
						  <div class="price">剩余数量:
						    <span class="actual">${food.number}份</span>
						  </div>
						  <ul class="product_but">
						  	<a href="${pageContext.request.contextPath}/shopCar/addFoodIndex?fid=${food.fid}"><li class="but3">加入购物车</li>	</a>					  
						  	<div class="clearfix"> </div>
						  </ul>
						  
						  <ul class="product_but">
						  	<a href="${pageContext.request.contextPath}/food/readyBuy?fid=${food.fid}"><li class="but3">下单</li></a>
						  	<div class="clearfix"> </div>
						  </ul>
						  
						   <div class="mask">
	                         <div class="info">Quick View</div>
			               </div>
			             </div>
			            
				   	   	</div>
			   	   	   </a>
			   	   	  </div>
			   	   </div>
			   	   </c:forEach>
			   </div>
			   <ul class="dc_pagination dc_paginationA dc_paginationA06">
<c:if test="${type!=null}">
	        	<c:if test="${pageInfo.prePage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSaleByType?pageNum=${pageInfo.prePage}&type=${type}">上一页</a>
				</c:if>
				<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSaleByType?pageNum=${pageNum.index}&type=${type}">${pageNum.index}</a>
				</c:forEach>
				<c:if test="${pageInfo.nextPage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSaleByType?pageNum=${pageInfo.nextPage}&type=${type}">下一页</a>
				</c:if>
			</c:if>
			<c:if test="${type==null&&name==null}">
				<c:if test="${pageInfo.prePage!=0}">
	           		  <a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSale?pageNum=${pageInfo.prePage}">上一页</a>
	       		 </c:if>
	        	<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
	        		<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSale?pageNum=${pageNum.index}">${pageNum.index}</a>                               
	        	 </c:forEach>
	        	<c:if test="${pageInfo.nextPage!=0}">
	        		<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodOnSale?pageNum=${pageInfo.nextPage}">下一页</a>       
	        	</c:if>
			</c:if>
			<c:if test="${type==null&&name!=null}">
				<c:if test="${pageInfo.prePage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodByName?pageNum=${pageInfo.prePage}&name=${name}">上一页</a>
				</c:if>
				<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodByName?pageNum=${pageNum.index}&name=${name}">${pageNum.index}</a>
				</c:forEach>
				<c:if test="${pageInfo.nextPage!=0}">
					<a class="grey-button" href="${pageContext.request.contextPath}/food/getFoodByName?pageNum=${pageInfo.nextPage}&name=${name}">下一页</a>
				</c:if>
			</c:if>
		       </ul>
		    </div>
		   </div>
		</div>
	</div>
	<div class="footer">
		
	</div>
	<input type="hidden" id="msg" value="${msg}">
<input type="hidden" id="uid" value="${user.uid}">

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
		$(".but3").click(function(){
			if($("#uid").val() == "") {			
				alert("您还未登录，请先登录");
				window.location.href="/sendFood/user/login.jsp";
				return false;			
			}
		})
	</script>
</html>