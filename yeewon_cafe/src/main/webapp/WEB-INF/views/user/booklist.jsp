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
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			//인기메뉴 얻기.
			$.ajax({
				url: '${root}/menu/popularList',
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				success: function(menus) {
					makeMenu(menus, ".popular_menu_ul");
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
				}
			});
			
			//신메뉴 얻기.
			$.ajax({
				url: '${root}/menu/list',
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				success: function(menus) {
					makeMenu(menus, ".new_menu_ul");
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
				}
			});
			
		
 			$(document).on("click", "li.view", function(){
 				let pid = $(this).attr("pid");
 				$.ajax({
 					url : '${root}/menu/list/' + pid,
 					type:'GET',
 					contentType:'application/json;charset=utf-8',
 					success:function(menu) {
 						$("#pid").text(menu.pid);
 						$("#pname").text(menu.pname);
 						$("#price").text(numberWithCommas(menu.price));
 						$("#count").text(menu.cnt);
 						$("#bookViewModal").modal();
 					},
 					error:function(xhr,status,msg){
 						console.log("상태값 : " + status + " Http에러메시지 : "+msg);
 					}
 				});
 			}); 
			
		
			function makeMenu(menus, classname) {
				var list = $(classname).empty();
				$(menus).each(function(i, menu) {
					var priceDiv = $("<div></div>").addClass("menu_price").text(numberWithCommas(menu.price)+"원");
					var nameDiv = $("<div></div>").addClass("menu_item_info").text(menu.pname);
					var img = $("<img/>").attr("src", "${root}/resources/img/book/" + menu.picture).attr("alt", menu.pname);
					var imgDiv = $("<div></div>").addClass("menu_item_img").append(img);
					var menuDiv = $("<div></div>").addClass("menu_item").attr("pname", menu.pname).append(imgDiv).append(nameDiv).append(priceDiv);
					var menuLi = $("<li></li>").addClass("view").attr("pid", menu.pid).append(menuDiv);
					$(list).append(menuLi);
				});
			}
			
			//가격에 콤마찍기 
			function numberWithCommas(price){
				return price.toString().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		
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
	
		        <!-- menu -->
		        <section class="page-section" id="bestseller">
		            <div class="container">
		                <div class="text-center">
		                    <h2 class="section-heading text-uppercase">Best Seller 4</h2>
		                    
							<section class="menu">
								<ul class="popular_menu_ul">
								
								</ul>
							</section>
							
		                </div>
		            </div>
		        </section>
		        
		        <section class="page-section" id="new">
		            <div class="container">
		                <div class="text-center">
		                    <h2 class="section-heading text-uppercase">NEW</h2>
		                    
							<section class="menu">
								<ul class="new_menu_ul">
								
								</ul>
							</section>
							
		                </div>
		            </div>
		        </section>
	</div>
	
	<!-- 회원 정보 모달창 -->
	<div class="modal" id="bookViewModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">DETAIL</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	       	<table class="table table-bordered">
	            <colgroup>
	                <col width="120">
	                <col width="*">
	                <col width="120">
	                <col width="*">
	            </colgroup>
	            <tbody>
		            <tr>
		                <th class="text-center">번호</th>
		                <td class="text-left" colspan="3" id="pid"></td>
		            </tr>
		            <tr>
		                <th class="text-center">책제목</th>
		                <td class="text-left" colspan="3" id="pname" style="font-weight: bold;"></td>
		            </tr>
		            <tr>
		                <th class="text-center">가격</th>
		                <td class="text-left" colspan="3" id="price"></td>
		            </tr>
		            <tr>
		                <th class="text-center">판매량</th>
		                <td class="text-left" colspan="3" id="count"></td>
		            </tr>
	<!--             <tr>
	                <th class="text-center">주소</th>
	                <td class="text-left" colspan="3" id="vaddress"></td>
	            </tr> -->
	            </tbody>
	        </table>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
</c:if>