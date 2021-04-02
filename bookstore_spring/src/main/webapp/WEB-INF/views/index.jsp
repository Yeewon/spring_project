<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="admin" value="${userinfo.username}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>yeewon books</title>
        <link rel="icon" type="image/x-icon" href="${root}/resources/img/favicon.ico" />
        
       <!-- Font Awesome icons (free version)-->
       <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
       
       <!-- Google fonts-->
       <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
       <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
       <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
       
       <!-- Core theme CSS (includes Bootstrap)-->
       <link href="${root}/resources/css/styles.css" rel="stylesheet" />
        
        <!-- rest  -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <!--<a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="" /></a>-->
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Yeewon Books</a>
                
                <c:if test="${userinfo != null}">

	                <button
	                    class="navbar-toggler navbar-toggler-right"
	                    type="button"
	                    data-toggle="collapse"
	                    data-target="#navbarResponsive"
	                    aria-controls="navbarResponsive"
	                    aria-expanded="false"
	                    aria-label="Toggle navigation"
	                >
	                    Menu
	                    <i class="fas fa-bars ml-1"></i>
	                </button>
	                <div class="collapse navbar-collapse" id="navbarResponsive">
	                    <ul class="navbar-nav text-uppercase ml-auto">
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#menu">Books</a></li>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#review">Review</a></li>
	                        <c:if test="${userinfo.userid eq 'admin' }">
	                 	       <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#member">MEMBER LIST</a></li>
	                        </c:if>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
	                    </ul>
	                </div>
                </c:if>
            </div>
        </nav>
        
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <c:if test="${userinfo == null}">
           	   	    <div class="masthead-subheading">Welcome To Our Library!</div>
                	<div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
                	<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#loginSection">LOGIN</a>
                </c:if>
                
          
                <c:if test="${userinfo != null}">
                	<div class="masthead-heading text-uppercase">Hello <strong>${userinfo.userid}</strong></div>
                	<div>
              	  		<a href="${root}/user/logout">LOGOUT</a>
   					</div>
   					<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#menu">Tell Me More</a>
                </c:if>
        

            </div>
        </header>
        

		<c:if test="${userinfo == null}">
	        <section class="page-section" id="loginSection">
	            <div class="container">
	                <div class="text-center">
		                    <h2 class="section-heading text-uppercase">LOGIN</h2>
	                     		<div align="center">
										<h3>${msg}</h3>
										<%@ include file="/WEB-INF/views/user/login.jsp" %>
								</div>
	                </div>
	            </div>
	        </section>
        </c:if>
        
        <c:if test="${userinfo != null}">
	        <!-- menu -->
	        <section class="page-section" id="menu">
	            <div class="container">
	                <div class="text-center">
	                    <h2 class="section-heading text-uppercase">Books</h2>
	                    <a href="${root}/user/booklist" class="section-subheading text-muted">
	                    	<img src="${root}/resources/img/section_1.JPG"/>
	                    </a><br>
	                </div>
	            </div>
	        </section>
	        
	        <!-- best review-->
	        <section class="page-section bg-light" id="review">
	            <div class="container">
	                <div class="text-center">
	                    <h2 class="section-heading text-uppercase">REVIEW</h2>
	                    <a href="${root}/article/write" class="section-subheading text-muted">write</a><br>
	                    <a href="${root}/article/list?pg=1&key=&word=" class="section-subheading text-muted">review</a><br>
	                </div>
	               
	            </div>
	        </section>
	        
	        <c:if test="${userinfo.userid eq 'admin'}">     
		       	<!-- new review-->
		        <section class="page-section bg-light" id="member">
		            <div class="container">
		                <div class="text-center">
		                    <h2 class="section-heading text-uppercase">MEMBER LIST</h2>
		                    <a class="section-subheading text-muted" href="${root}/user/list">member list</a>
		                </div>
		               
		            </div>
		        </section>
	        </c:if>
	
	        <!-- Contact-->
	        <section class="page-section" id="contact">
	            <div class="container">
	                <div class="text-center">
	                    <h2 class="section-heading text-uppercase">Contact Me</h2>
	                    <h3 class="section-subheading text-muted">send message</h3>
	                </div>
	                <form id="contactForm" name="sentMessage" novalidate="novalidate">
	                    <div class="row align-items-stretch mb-5">
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <input
	                                    class="form-control"
	                                    id="name"
	                                    type="text"
	                                    placeholder="Your Name *"
	                                    required="required"
	                                    data-validation-required-message="Please enter your name."
	                                />
	                                <p class="help-block text-danger"></p>
	                            </div>
	                            <div class="form-group">
	                                <input
	                                    class="form-control"
	                                    id="email"
	                                    type="email"
	                                    placeholder="Your Email *"
	                                    required="required"
	                                    data-validation-required-message="Please enter your email address."
	                                />
	                                <p class="help-block text-danger"></p>
	                            </div>
	                            <div class="form-group mb-md-0">
	                                <input
	                                    class="form-control"
	                                    id="phone"
	                                    type="tel"
	                                    placeholder="Your Phone *"
	                                    required="required"
	                                    data-validation-required-message="Please enter your phone number."
	                                />
	                                <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group form-group-textarea mb-md-0">
	                                <textarea
	                                    class="form-control"
	                                    id="message"
	                                    placeholder="Your Message *"
	                                    required="required"
	                                    data-validation-required-message="Please enter a message."
	                                ></textarea>
	                                <p class="help-block text-danger"></p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="text-center">
	                        <div id="success"></div>
	                        <button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit">Send Message</button>
	                    </div>
	                </form>
	            </div>
	        </section>
        </c:if>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-left">Copyright © Your Website 2020</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-instagram"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="https://github.com/Yeewon"><i class="fab fa-github"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-right">
                        <a class="mr-3" href="#!">Privacy Policy</a>
                        <a href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
 
		
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        
        <!-- Contact form JS-->
        <script src="${root}/resources/mail/jqBootstrapValidation.js"></script>
        <script src="${root}/resources/mail/contact_me.js"></script>
        
        <!-- Core theme JS-->
        <script src="${root}/resources/js/scripts.js"></script>
        
        <!-- Load books JS -->
        <%-- <script src="${root}/resources/js/book.js"></script> --%>
    </body>
</html>