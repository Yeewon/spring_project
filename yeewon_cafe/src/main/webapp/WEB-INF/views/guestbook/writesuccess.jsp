<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>yeewon books</title>
	<link rel="icon" type="image/x-icon" href="${root}/resources/img/favicon.ico" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	   
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${root}/resources/css/styles.css" rel="stylesheet" />
	 
</head>
<body>
<div class="container" align="center">

	<div class="col-lo-8" align="left">
		<a class="navbar-brand js-scroll-trigger" href="${root}">Yeewon Books</a>
	</div>
	
	<div class="col-lg-6">
	  <div>
		<strong>${userinfo.username}</strong>님 환영합니다.
		<a href="${root}/user/logout">LOGOUT</a>
	    <h3>리뷰가 성공적으로 작성되었습니다.</h3>      
	  </div>  
	  <p><a href="${root}/article/list?pg=1&key=&word=">글목록</a></p>
	</div>
</div>
</body>
</html>
</c:if>