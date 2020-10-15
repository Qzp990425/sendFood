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
		font-size: 20px;
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
<body >
<form class="form-inline definewidth m20" action="#" method="get">
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>管理员id</th>
                      	<th>管理员账号</th>
                      	<th>管理员密码</th>
                      	<th>操作</th>
    </tr>
    </thead>
	     
        <tr>
               <c:forEach items="${pageInfo.list}" var="admin">
                      <tr>                     
                      	<td>${admin.id}</td>
                      	<td>${admin.username}</td>
                      	<td>${admin.password}</td>
                      	<td>
                      		<c:if test="${admin.username!='admin'}">
                      			<a href="${pageContext.request.contextPath}/admin/getAdmin?id=${admin.id}" class="btn btn-primary">编辑</a>
                      			<a href="${pageContext.request.contextPath}/admin/deleteAdmin?id=${admin.id}" class="btn btn-primary">删除</a>
                      		</c:if>
                      	</td>
                      </tr>        
                    </c:forEach>             
               
        </tr>
              <tr >
                  	  	<td colspan="4" style="text-align:center">
         	  			   <c:if test="${pageInfo.prePage!=0}">
                               <a href="${pageContext.request.contextPath}/admin/getAllAdmin?pageNum=${pageInfo.prePage}">上一页</a>
                           </c:if>
                           <c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
                               <a href="${pageContext.request.contextPath}/admin/getAllAdmin?pageNum=${pageNum.index}">${pageNum.index}</a>							
					      </c:forEach>
					      <c:if test="${pageInfo.nextPage!=0}">
						       <a href="${pageContext.request.contextPath}/admin/getAllAdmin?pageNum=${pageInfo.nextPage}">下一页</a>			
                          </c:if>
                  	  	</td>
                  	  </tr>
       
       </table>
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