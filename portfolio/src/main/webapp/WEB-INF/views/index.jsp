<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="admin" value="${userinfo.username}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>yeewon</title>
        <link rel="icon" type="image/x-icon" href="${root}/resources/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root}/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <!--<a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="${root}/resources/img/navbar-logo.svg" alt="" /></a>-->
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Yeewon Cafe</a>
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
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#todolist">TodoList</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">Cafe</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Our Cafe!</div>
                <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#todolist">Tell Me More</a>
            </div>
        </header>
        <!-- todolist-->
        <section class="page-section" id="todolist">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">TodoList</h2>
                    <div class="portfolio-caption-subheading text-muted">TodoList for Team</div>
                    <div>
                        <div class="todoList-item">
                            <a class="todoList-link" data-toggle="modal" href="#portfolioModal1">
                                <img class="img-fluid" src="${root}/resources/img/portfolio/todo.JPG" alt="" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- cafe Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">BOOKSTORE</h2>
                    <div class="section-subheading text-muted">library cafe using Spring Framework</div>
                    <div>
                        <div class="todoList-item">
                            <a class="todoList-link" data-toggle="modal" href="#portfolioModal2">
                                <img class="img-fluid" src="${root}/resources/img/portfolio/library.JPG" alt="" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About Me</h2>
                    <h3 class="section-subheading text-muted">A person who can't stand discomfort</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${root}/resources/img/team/1.jpg" alt="" />
                            <h4>Jung Yeewon</h4>
                            <p class="text-muted">Web Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://github.com/Yeewon"><i class="fab fa-github"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="https://www.notion.so/yeewon/a6d53eabca60409da72518bf54df38fa"><i class="fab fa-home"></i></a> -->
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
            </div>
        </section>
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
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-left">Copyright ?? Your Website 2020</div>
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
        <!-- Portfolio Modals-->
        <!-- Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="${root}/resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project Details Go Here-->
                                    <h2 class="text-uppercase">Make TodoList</h2>
                                    <p class="item-intro text-muted">for Team</p>
                                    <div class="todo-btn">
                                        <button class="look-btn" type="button" onclick="location.href='https://github.com/Yeewon/js-todo-list-step3/tree/yeewon'">look</button>
                                    </div>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/todo.JPG" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/todo_team.png" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/todo.gif" alt="" />
                                    <p>
                                        ???????????????????????? ????????????????????? ??????????????? ?????? ??? </br>
                                        Ajax??? ???????????? TodoList??? ?????? ??? ????????????
                                        ?????????????????? ??????????????? ????????????</br> ??????????????? ?????? ???????????? ????????? ??????
                                    </p>
                                    <ul class="list-inline">
                                        <li>Date: January 2021</li>
                                    </ul>
                                    <button class="btn btn-primary" data-dismiss="modal" type="button">
                                        <i class="fas fa-times mr-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal 2-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="${root}/resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project Details Go Here-->
                                    <h2 class="text-uppercase">Make Library</h2>
                                    <p class="item-intro text-muted">solitary</p>
                                    <div class="todo-btn">
                                        <button class="look-btn" type="button" onclick="location.href='https://github.com/Yeewon/js-todo-list-step3/tree/yeewon'">look</button>
                                    </div>
                                    <p>
                                        ????????? ??????????????? ????????????<br>
                                        ????????????????????? ?????? ?????? ???????????? css??? ???????????? ????????? ???????????????. <br>
                                        MySQL??? ???????????? DB??? ????????????<br>
                                        ??????????????? ????????? ???????????? ??????????????? ???????????????. <br>
                                        ?????? ???????????? ????????? ??? ?????? ????????? ????????? ?????? ????????? ????????? ??????????????? ???????????????. <br> 
                                    </p>

                                    <h3>MAIN PAGE</h3>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library.JPG" alt="" /><br><br><br>

                                    <h3>LOGIN</h3>
                                    <p>
                                        ???????????? ??????????????? ???????????? DB??? userid, userpwd??? ????????????<br>
                                        ???????????? ?????? ?????????????????? ?????? ???????????? ????????? ????????? ???????????? <br>
                                        ?????????????????? ????????? ???????????? ????????? ??? ?????? ???????????? ????????? ????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_login.JPG" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_afterLogin.JPG" alt="" /><br><br><br>

                                    <h3>JOIN</h3>
                                    <p>
                                        ???????????? ?????? ????????? ????????? ???????????? ?????? ?????? ?????? ????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_join1.JPG" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_join2.JPG" alt="" />
                                    <p>
                                        ???????????? ????????? <strong>DAUM</strong>??? API??? ????????? ???????????????????????? ???????????????<br>
                                        ??????????????? ???????????? ????????? ?????? ????????? ?????? ????????? ?????????????????? ??????<br>
                                        ???????????? ????????? ???????????? ????????? ??????????????? ???????????? <br>
                                        ?????? ????????? ???????????? ?????? ?????? ???????????? ????????????<br>
                                        ?????? ???????????? ????????????. <br> 
                                        
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_join3.JPG" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_join4.JPG" alt="" />
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_join5.JPG" alt="" /><br><br><br>

                                    <h3>BOOK LIST</h3>
                                    <p>
                                        yeewon library??? ????????? ???????????? ??????????????? ????????????. <br>
                                    </p>

                                    <h4>BEST SELLER</h4>
                                    <p>
                                        DB?????? ??? ???????????? ???????????? ?????????????????? ???????????? ?????? 4?????? ???????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_bestSeller.JPG" alt="" /><br>
                                    <h4>NEW BOOOKS</h4>
                                    <p>
                                        DB?????? ????????? ????????? ?????? ????????? ???????????? ??????????????? ????????????.<br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_newBook.JPG" alt="" /><br><br><br>
                                    
                                    <h4>BOOK DETAIL</h4>
                                    <p>
                                        ????????? ???????????? ?????? ????????? ????????? ??????????????? ????????????.<br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_bookDetail.JPG" alt="" /><br><br><br>

                                    <h3>REVIEW</h3>
                                    <p>
                                        ???????????? ????????? ???????????? <br>
                                        ?????? ????????? ?????? ????????? ???????????? ????????? ?????? ????????? ????????? ?????? ??????????????? ????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_write.JPG" alt="" />
                                    <p>
                                        ?????? ????????? ?????? ?????????????????? ?????? ?????? ?????? ???????????? ??????????????? ????????????<br>
                                        ????????? ????????? ??? ??? ????????? ?????? ???????????? ????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_writeSuccess.JPG" alt="" />
                                    <p>
                                        ?????? ???????????? ??? ??? ????????? ???????????? ?????????, ??????, ??????, ???????????? ???????????? <br>
                                        ????????? ??? ???????????? ????????? ???????????? ???????????? ?????? ??????????????? ???????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_reviewList.JPG" alt="" />
                                    <p>
                                        ?????? ????????? ????????? ?????? ????????? ?????? ??? ????????? ?????????<br>
                                        ??????????????? ???????????? ????????????.<br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_updateReview.JPG" alt="" /><br><br><br>

                                    <h3>ADMIN PAGE</h3>
                                    <p>
                                        ???????????? ??? ??? ?????? ???????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_adminPage.JPG" alt="" />
                                    <p>
                                        yeewon library??? ????????? ?????? ??????????????? ????????? ??? ?????? ???????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_memList.JPG" alt="" />
                                    <p>
                                        ??? ??????????????? ??????, ????????? ????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_memListUpdate.JPG" alt="" />
                                    <p>
                                        ????????? ?????????????????? ????????? ????????? ??????????????? ????????? ???????????? ???????????????. <br>
                                    </p>
                                    <img class="img-fluid d-block mx-auto" src="${root}/resources/img/portfolio/library_memListJoin.JPG" alt="" /><br><br><br>

                                    <ul class="list-inline">
                                        <li>Date: 2021</li>
                                    </ul>
                                    <button class="btn btn-primary" data-dismiss="modal" type="button">
                                        <i class="fas fa-times mr-1"></i>
                                        Close Project
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <script src="${root}/resources/js/scripts.js"></script>
    </body>
</html>
