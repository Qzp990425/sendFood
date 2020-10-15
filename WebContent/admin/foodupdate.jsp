<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery2.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/common.js"></script>
    
    <style type="text/css">
        body {font-size: 20px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/food/updateFood" method="post" class="definewidth m20">
	<input type="hidden" value="${food.fid}" name="fid">
	<input type="hidden" value="${food.uuid}" name="uuid">
<table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">
	
    <tr> 
        <td width="10%" class="tableleft">类别</td>
        <td>
            <select name="type">
            	<c:forEach var="type" items="${types}">
            		<c:if test="${food.type==type.tid}">
            		<option value="${type.tid}" selected>${type.tname}</option>
            		</c:if>
            		<c:if test="${food.type!=type.tid}">
            		<option value="${type.tid}">${type.tname}</option>
            		</c:if>
            	</c:forEach>
            </select>
        </td>
    </tr>
    
   
    <tr>
        <td class="tableleft">食物名称</td>
        <td><input type="text" name="name" value="${food.name}"/></td>
        <td class="tableleft">食物数量</td>
        <td><input type="text" name="number" value="${food.number}"/></td>
    </tr>
    <tr>
        <td class="tableleft">食物原价</td>
        <td><input type="text" name="price" value="${food.price}"/></td>
    <tr>
   <tr>
        <td class="tableleft">食物现价</td>
        <td><input type="text" name="nowPrice" value="${food.nowPrice}"/></td>
    <tr>
        <td class="tableleft">食物图片</td>
        <td class="tableleft" style="width: 196px;height:110px;"><img src="${pageContext.request.contextPath}/foodImg/${food.uuid}.jpg" /><td>

    </tr>
    <tr>
        <td class="tableleft">食物简介</td>
        <td><input type="text" name="introduction" style="height: 63px;" value="${food.introduction}"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button style="margin-left:5px;"type="submit" class="btn btn-primary">更改</button> &nbsp;&nbsp;
        </td>
    </tr>
</table>
</form>
		<input type="hidden" id="msg" value="${msg}">
	</body>
	
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
