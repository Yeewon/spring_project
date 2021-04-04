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

	<!-- raty plugin -->
	<script type="text/javascript" src="${root}/resources/js/jquery.raty.min.js"></script>
	
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${root}/resources/css/styles.css" rel="stylesheet" />

        
  <script type="text/javascript">
  $(document).ready(function() {
	  $("#writeBtn").click(function() {
			if($("#subject").val() == "") {
				alert("제목을 입력하세요.");
				return;
			} else if($("#content").val() == "") {
				alert("내용을 입력하세요.");
				return;
			} else {
				$("#writeform").attr("action", "${root}/article/write").submit();
			}
		});
	  $('#star').raty();
	  
	});
  </script>
</head>
<body>

<div class="container" align="center">
	<div class="col-lo-8" align="left">
		<a class="navbar-brand js-scroll-trigger" href="${root}">Yeewon Books</a>
	</div>
	<div class="col-lg-8" align="right">
	<strong>${userinfo.username}</strong>님 환영합니다.
	<a href="${root}/user/logout">LOGOUT</a>
	</div>
	<div class="col-lg-6" align="center">
		<h2>REVIEW 작성</h2>
		<form id="writeform" method="post" action="">
			<div class="form-group" align="left">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" name="subject" maxlength="20" placeholder="20자 이내로 작성해 주세요.">
			</div>
			<div class="form-group" align="left">
				<label for="score">평점</label>
				<a id="star"></a>
			</div>
			<div class="form-group" align="left">
				<label for="content">리뷰</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" id="writeBtn"  class="btn btn-warning">글작성</button>
			<button type="reset" class="btn btn-primary">초기화</button>
		</form>
	</div>
</div>

</body>
</html>
</c:if>