<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

		<script type="text/javascript">
		$(document).ready(function() {
			
			$('#mvWriteBtn').focusin(function() {
				$(location).attr("href", "${root}/article/write");
			});
			
			$("#searchBtn").click(function() {
				
				if($("#sword").val() == "") {
					alert("모든 목록 조회!!");
				} 
				$("#searchform").attr("action", "${root}/article/list").submit();
			});
			
			$(".page-item").click(function() {
				$("#pg").val(($(this).attr("data-pg")));
				$("#pageform").attr("action", "${root}/article/list").submit();
			});
		});


		</script>
	</head>
	<body>	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
		<div class="col-lo-8" align="left">
			<a class="navbar-brand js-scroll-trigger" href="${root}">Yeewon Books</a>
		</div>
		<div class="col-lg-8" align="right">
			<strong>${userinfo.username}</strong>님 환영합니다.
			<a href="${root}/user/logout">LOGOUT</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>REVIEW</h2>
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" id="mvWriteBtn" class="btn btn-link">글쓰기</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="skey">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="articleno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
			  <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${articles.size() != 0}">
	  		<table style="text-align: center;">
		  		<tr>
					<th id="no">no</th>
					<th id="id">id</th>
					<th id="subject">review</th>
					<th id="content">content</th>
					<th id="score">score<th>
					<th id="regtime"></th>
					<th id="control"></th>
				</tr>

			  	<c:forEach var="article" items="${articles}">
				  <tr>
				  	<td id="no">${article.articleno}</td>
				  	<td id="id">${article.userid}</td>
				  	<td id="subject">${article.subject}</td>
				  	<td id="content">${article.content}</td>
				  	<td id="score">
				  		<c:forEach var="i" begin="1" end="${article.score}">
				  			<img src="${root}/resources/img/star-on.png" style="width:15px; margin: -1.5px;">
				  		</c:forEach>
				  
				  	</td>
				  	<td id="regtime">
				  		<c:set var="date" value="${fn:split(article.regtime, ' ')}"></c:set>
				  		<c:out value="${date[0]}"></c:out>
				  	</td>	  	
				  	<td id="control">
					  	<c:if test="${userinfo.userid == article.userid}">
					  		<a href="${root}/article/modify?articleno=${article.articleno}">수정</a>
							<a href="${root}/article/delete?articleno=${article.articleno}">삭제</a>
						</c:if>
					</td>
				  </tr>
			  	</c:forEach>
		  	</table>
		  	<table>
			  	<tr>
				  	<td>
				  	${navigation.navigator}
				  	</td>
			  	</tr>
		  	</table>
	  </c:if>
	  <c:if test="${articles.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	</body>
</html>
</c:if>