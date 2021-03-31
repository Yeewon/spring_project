<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>yeewon books</title>
	<link rel="icon" type="image/x-icon" href="${root}/resources/img/favicon.ico" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${root}/resources/css/join.css" rel="stylesheet" />

</head>

<!-- daum 도로명주소 찾기 api --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

function selectEmail(ele){
	var $ele = $(ele);
	var $emaildomain = $("input[name=emaildomain]");
	
	if($ele.val() == "1"){
		$emaildomain.attr("readonly", false);
		$emaildomain.val("");
	}else{
		$emaildomain.attr("readonly", true);
		$emaildomain.val($ele.val());
	}
}

$(document).ready(function() {

	$("#registerBtn").click(function() {
		//javascript object를 JSON으로 변경
		
		//정규식 판단 변수	
		var empJ = /\s/g; //공백 체크 정규식
		var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; //아이디 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; // 비밀번호 정규식
		var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;//이름 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 검사 정규식
	/* 	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰 번호 정규식 */
	
		const email = $("#emailid").val() + "@" + $("#emaildomain").val();
		const address = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val() + " " + $("#sample6_extraAddress").val();
		
		
		if(!nameJ.test($("#username").val())) {
			alert("이름을 확인하세요.");
			return;
		} else if(!idJ.test($("#userid").val())) {
			alert("아이디를 확인하세요.");
			return;
		} else if(($('#userpwd').val() != ($('#pwdcheck').val())) 
				|| !pwJ.test($('#userpwd').val()) 
				|| !pwJ.test($('#pwdcheck').val())){
			alert("비밀번호를 확인하세요.");
			return;
		}else {
			
			let registerinfo = JSON.stringify({
				"username" : $("#username").val(), 
				"userid" : $("#userid").val(), 
				"userpwd" : $("#userpwd").val(), 
				"email" : email,
				"address" : address,
			   });
			
			$.ajax({
				url:'${root}/admin/user',  
				type:'POST',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: registerinfo,
				success:function(users) { 
					alert("가입을 축하합니다.");
					location.href = "${root}";			    },
			 	error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		
		}
	});
	
});
</script>

<script>
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
</script>

<body>
<div class="container">
	<div class="col-lo-8" align="left">
		<a class="navbar-brand js-scroll-trigger" href="${root}">Yeewon Books</a>
	</div>

	
	<!-- wrapper -->
	<div id="wrapper">
	    <!-- content-->
	    <div id="content">
    		 <div class="col-lg-8" align="center" id="title">
				 <h1 style="font-family: sans-serif">JOIN</h1>
			 </div>
	        <form id="memberform" method="post" action="">
	            <!-- ID -->
	            <div>
	                <h3 class="join_title">
	                    <label for="id">아이디</label>
	                </h3>
	                <span class="box int_id">
                        <input type="text" id="userid" name ="userid" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
	            </div>
	
	            <!-- PW1 -->
	            <div>
	                <h3 class="join_title">
	                    <label for="pwd">비밀번호</label>
	                </h3>
	
	                <span class="box int_pass">
	                    <input type="password" id="userpwd" name="userpwd" class="int" maxlength="20" />
	                    <span id="alertTxt">사용불가</span>
	                    <%-- <img src="${root}/resources/img/join/m_icon_pass.png" id="pswd1_img1" class="pswdImg" /> --%>
	                </span>
	                <span class="error_next_box"></span>
	            </div>
	
	            <!-- PW2 -->
	            <div>
	                <h3 class="join_title">
	                    <label for="pwdcheck">비밀번호재입력</label>
	                </h3>
	                <span class="box int_pass_check">
	                    <input type="password" id="pwdcheck" name="pwdcheck" class="int" maxlength="20" />
	                    <%-- <img src="${root}/resources/img/join/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg" /> --%>
	                </span>
	                <span class="error_next_box"></span>
	            </div>
	
	            <!-- NAME -->
	            <div>
	                <h3 class="join_title">
	                    <label for="name">이름</label>
	                </h3>
	                <span class="box int_name">
	                    <input type="text" id="username" name="username" class="int" maxlength="20" />
	                </span>
	                <span class="error_next_box"></span>
	            </div>
	
	            <!-- EMAIL -->
	            <div>
	                <h3 class="join_title">
	                    <label for="email">본인확인 이메일<span class="optional">(선택)</span></label>
	                </h3>
	                <div>
	                	<div style="color: yellow">
	                	</div>
	                	<div style="color: blue">
	                	</div>
	                	<div style="color: green">
	                	</div>
	                </div>
	                <span class="box_email">
	                        <input type="text" class="int_email" id="emailid" name="emailid">@<input type="text" class="int_email" name="emaildomain"id="emaildomain">
	                        <select class="slect_email" onchange="selectEmail(this)">
	                        	<option value="" selected>선택하세요</option>
	                            <option value="naver.com">naver.com</option>
	                            <option value="google.com">google.com</option>
	                            <option value="daum.net">daum.net</option>
	                            <option value="nate.com">nate.com</option>
	                            <option value="hanmail.net">hanmail.net</option>
	                            <option value="1">직접입력</option>
	                        </select>
	                </span>
	                <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
	            </div>
	
	            <!-- ADDRESS -->
	            <div>
	                <h3 class="join_title">
	                    <label for="address">주소</label>
	                </h3>
	                    <div>
	                        <div id="addressdiv" class="custom-control-inline">
	                        <span class="box">
	                        	<input class="form-control" type="text" id="sample6_postcode" placeholder="우편번호" size="7" maxlength="5" readonly="readonly">
	                        </span>
	                        <input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                        </div>
	                        
	                        <span class="box int_address">
	                        	<input class="form-control" type="text" id="sample6_address" placeholder="주소"><br>
	                        </span>
	                        <span class="box int_detailAddress">
	                        	<input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
	                    	</span>
	                        <span class="box int_extraAddress">
	                        	<input class="form-control" type="text" id="sample6_extraAddress" placeholder="참고항목">
	                    	</span>	                    	
	                    	
	                    </div>
	              
	            </div>
	
	            <!-- JOIN BTN-->
	            <div class="btn_area">
	                <button type="button" class="btn btn-primary" id="registerBtn">
	                    <span>가입하기</span>
	                </button>
	                <button type="reset" class="btn btn-warning">
	                    <span>초기화</span>
	                </button>
	            </div>
	        </form>
	    </div>
	    <!-- content-->
	</div>

	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- Third party plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	
	<!-- Contact form JS-->
	<script src="${root}/resources/mail/jqBootstrapValidation.js"></script>
	<script src="${root}/resources/mail/contact_me.js"></script>
	
	<!-- Core theme JS-->
<%-- 	<script src="${root}/resources/js/scripts.js"></script> --%>
</div>
</body>
</html>