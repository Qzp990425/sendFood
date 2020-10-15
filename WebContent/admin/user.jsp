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
        <th>用户id</th>
                      	<th>用户电话</th>
                      	<th>学号</th>
                      	<th>用户真实姓名</th>
    </tr>
    </thead>
	     
        <tr>
               <c:forEach items="${pageInfo.list}" var="user">
                      <tr>                     
                      	<td>${user.uid}</td>
                      	<td>${user.tel}</td>
                      	<td>${user.sno}</td>
                      	<td>${user.name}</td>
                      </tr>        
                    </c:forEach>             
               
        </tr>
              <tr >
                  	  	<td colspan="4" style="text-align:center">
         	  			   <c:if test="${pageInfo.prePage!=0}">
                               <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageInfo.prePage}">上一页</a>
                           </c:if>
                           <c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
                               <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageNum.index}">${pageNum.index}</a>							
					      </c:forEach>
					      <c:if test="${pageInfo.nextPage!=0}">
						       <a href="${pageContext.request.contextPath}/user/getAllUser?pageNum=${pageInfo.nextPage}">下一页</a>			
                          </c:if>
                  	  	</td>
                  	  </tr>
       
       </table>

</body>
</html>