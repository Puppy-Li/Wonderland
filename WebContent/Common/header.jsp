<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="./Static/css/jquery-ui.css">
	<script src="./Static/js/jquery-3.1.1.min.js"></script>
	<script src="./Static/js/jquery-ui.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./Static/css/HomePageStyle.css">
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	 <link href="./Static/css/datatables.min.css" rel="stylesheet" />
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script src="./Static/js/angular.min.js"></script>
  <script src="./Static/js/datatables.min.js"></script>
 
</head>

<!--导航条-->
<nav>
<ul id="myTab" class="nav nav-pills" role="tablist">
 
  <li role="presentation" class="active"><a href="./index.jsp">Home</a></li>
  <li role="presentation"><a 
   <c:choose>
        <c:when  test="${empty sessionScope.username}">
             alert("Please login or register first！")
             href="./login.jsp"               
        </c:when>
        <c:otherwise>
        href="./profile.jsp"
        </c:otherwise>
    </c:choose>
   id="Profile">Profile</a></li>
  <li role="presentation"><a href="#">Music</a></li>
  <li role="presentation"><a href="./uploadFiles.jsp">Movie</a></li>
  <li role="presentation"><a 
  <c:choose>
        <c:when  test="${empty sessionScope.username}">
             alert("Please login or register first！")
             href="./login.jsp"               
        </c:when>
        <c:otherwise>
        href="./travel.jsp"
        </c:otherwise>
    </c:choose>
  href="./travel.jsp">Travel</a></li>
  <li role="presentation"><a href="./Articles.jsp">Article</a></li>
  
  
  
  <li role="presentation" class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
      More<span class="caret"></span>
    </a>
    <ul class="dropdown-menu" role="menu">
      <li><a href="#">Shopping</a></li>
	  <li><a href="#">Sports</a></li>
	  <li><a href="#">Message&nbsp;<span class="badge">3</span></a></li>
	  <li class="divider"></li>
	  <li><a href="#">Contact us</a></li>
    </ul>
  </li>
 
     
<li role="presentation" class="login">
<c:choose>
        <c:when  test="${empty sessionScope.username}">
            <span style="margin-left:700px"><a href="./login.jsp">Login</a></span>  
            <span>|</span>
            <span><a href="./register.jsp">Register</a></span>
        </c:when>
        <c:otherwise>
            <span style="margin-left:650px"><a href="./uploadFiles.jsp">Hello，${sessionScope.username}&nbsp;<span class="glyphicon glyphicon-user"></span></a></span>  
            <span> | </span>
            <span><a href="${basePath}/Controller/logoutController.jsp">Logout</a></span>
        </c:otherwise>
    </c:choose>
</li>
             
</ul>
        
</nav>

</html>