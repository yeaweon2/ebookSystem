<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top fadeInDown" data-wow-delay="0.5s">
            <div class="top-bar smoothie hidden-xs">
                <div class="container">
                    <div class="clearfix">
                        <ul class="list-inline social-links wow pull-left">
                            <li><a href="ticketList"><i class="fa fa-credit-card"></i> 월정액구매</a></li>
							<li><a href="bucketList"><i class="fa fa-star"></i> 버킷BOOK</a></li>
							<li><a href="cartList"><i class="fa fa-shopping-cart"></i>
								<c:if test="${empty cartCnt}">
								Cart
								</c:if>
								<c:if test="${not empty cartCnt}">
									<c:if test="${cartCnt eq '0'}">
									Cart
									</c:if>
									<c:if test="${cartCnt != '0'}">
									Cart [ ${cartCnt} ]
									</c:if>
								</c:if>
								</a>
							</li>
							<li><div>${id} : ${name} : ${nicknm} : ${auth} : ${stcd} </div></li>
                        </ul>
						
                        <div class="pull-right text-right">
                            <ul class="list-inline">
                                <c:if test="${empty id}">
									<li><a href="memberJoin"><i class="fa fa-user"></i>회원가입</a></li>
									<li><a href="login"><i class="fa fa-lock"></i>LOGIN</a></li>
								</c:if>
								<c:if test="${not empty id}">
									<li><a href="logout"><i class="fa fa-crosshairs"></i>로그아웃</a></li>
								</c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand smoothie logo logo-light" href="index.html"><img src="resources/assets/img/logo.png" alt="logo"></a>
                    <a class="navbar-brand smoothie logo logo-dark" href="index.html"><img src="resources/assets/img/logo_reverse.png" alt="logo"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="main-navigation">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="home" class="dropdown-toggle" data-toggle="dropdown">Home <span class="pe-7s-angle-down"></span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">e로운생활 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">BOOK검색</a></li>
                                <li><a href="bestSeller">BEST SELLER</a></li>
                                <li><a href="#">신간BOOK</a></li>
                            </ul>
                        </li>
					<c:if test="${auth eq 'U'}">                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">나의서재 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">독서루틴</a></li>
                                <li><a href="bucketList">버킷BOOK</a></li>
                                <li><a href="#">BOOK캘린더</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">마이페이지 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="myInfo">개인정보관리</a></li>
                                <li><a href="lendList">나의대여목록</a></li>
                                <li><a href="#">내글관리</a></li>
                            </ul>
                        </li>   
					</c:if>        
					<c:if test="${auth eq 'A'}">                
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">회원관리 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="memberList">회원목록</a></li>
                                <li><a href="managerList">매니저목록</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">BOOK관리 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="ctgyList">카테고리관리</a></li>
                                <li><a href="bcnfmList">BOOK승인목록</a></li>
                            </ul>
                        </li>
					</c:if>
					<c:if test="${auth eq 'M'}">                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">BOOK관리 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="bookInsertForm">BOOK등록</a></li>
                                <li><a href="bookList">BOOK조회</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">MY PAGE <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="myInfo">나의정보관리</a></li>
                                <li><a href="managerRegist">매니저신청</a></li>
                                <li><a href="#">내글관리</a></li>
                            </ul>
                        </li> 
					</c:if>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">커뮤니티 <span class="pe-7s-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="noticeList">공지사항</a></li>
                                <li><a href="boardList">자유게시판</a></li>
                                <li><a href="inquireList">1:1문의</a></li>
                                <li><a href="faqList">FAQ</a></li>
                                <li><a href="bookReviewList">REVIEW</a></li>
                            </ul>
                        </li>                                                                                                                                                     
                        <li><a href="#search"><i class="pe-7s-search"></i></a></li>
                        <li><a href="javascript:void(0);" class="side-menu-trigger hidden-xs"><i class="fa fa-bars"></i></a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        
        <div id="search-wrapper">
            <button type="button" class="close">×</button>
            <div class="vertical-center text-center">
                <form>
                    <input type="search" value="" placeholder="Enter Search Term" />
                    <button type="submit" class="btn btn-primary btn-white">Search</button>
                </form>
            </div>
        </div>        