<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<c:if test="${cookie.yeewon_id.value ne null}">
	<c:set var="saveid" value="${cookie.yeewon_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>yeewon books</title>
        <link rel="icon" type="image/x-icon" href="resources/img/favicon.ico" />
		<script type="text/javascript">
		$(document).ready(function() {
			
			$('#loginButton').click(function() {
				if($("#userid").val() == "") {
					alert("아이디를 입력하세요.");
					return;
				} else if($("#userpwd").val() == "") {
					alert("비밀번호를 입력하세요.");
					return;
				} else {
					$("#loginform").attr("action", "${root}/user/login").submit();
				}
			});
			 
			$('#mvRegisterBtn').focusin(function() {
				$(location).attr("href", "${root}/user/join");
			});
			
			
			$('.form-control').keydown(function (e) {
			    if (e.keyCode == 13) {
					if($("#userid").val() == "") {
						alert("아이디를 입력하세요.");
						return;
					} else if($("#userpwd").val() == "") {
						alert("비밀번호를 입력하세요.");
						return;
					} else {
						$("#loginform").attr("action", "${root}/user/login").submit();
					}
			    }
			});
		});
		</script>
	</head>
	
<body>

	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="loginform" method="post" action="">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${saveid}">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
				</div>
				<div class="form-group form-check" align="right">
				    <label class="form-check-label">
				      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장 
				    </label>
				</div>
				<div class="form-group" align="center">
					<button type="button" id="loginButton" class="btn btn-warning">로그인</button>
					<button type="button" id="mvRegisterBtn" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>
	
</body>
