<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="home"><img src="resources/images/home/logo.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									USA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canada</a></li>
									<li><a href="#">UK</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									<li><a href="#">Pound</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div>${id} : ${name} : ${nicknm} : ${auth} : ${stcd} </div>
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								
								<li><a href="#"><i class="fa fa-star"></i> 버킷BOOK</a></li>
								<li><a href="cartList"><i class="fa fa-shopping-cart"></i>
									<c:if test="${cartCnt eq '0'}">
									Cart
									</c:if>
									<c:if test="${cartCnt != '0'}">
									Cart [ ${cartCnt} ]
									</c:if>
									</a></li>
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
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="home" class="active">Home</a></li>
								<li class="dropdown"><a href="#">e로운BOOK<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">BOOK검색</a></li>
										<li><a href="bestSeller">베스트셀러</a></li> 
										<li><a href="#">신간BOOK</a></li> 
                                    </ul>
                                </li> 
								<c:if test="${auth eq 'U'}">
								<li class="dropdown"><a href="#">나의서재<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">독서 루틴</a></li>
										<li><a href="#">버킷 BOOK</a></li>
										<li><a href="#">BOOK 캘린더</a></li>
                                    </ul>
                                </li>
                         		<li class="dropdown"><a href="#">마이페이지<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#">개인정보관리</a></li>
										<li><a href="#">대여관리</a></li>
										<li><a href="#">내글관리</a></li>
                                    </ul>
                                </li> 
                                </c:if>
                                <c:if test="${auth eq 'A'}">
                         		<li class="dropdown"><a href="#">회원관리<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="memberList">회원목록</a></li>
										<li><a href="managerList">매니저목록</a></li>
                                    </ul>
                                </li>
                         		<li class="dropdown"><a href="#">도서관리<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="ctgyList">카테고리</a></li>
										<li><a href="bcnfmList">BOOK승인</a></li>
                                    </ul>
                                </li>   
                                </c:if>
                                <c:if test="${auth eq 'M'}">
                         		<li class="dropdown"><a href="#">도서관리<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="bookInsertForm">BOOK등록</a></li>
										<li><a href="bookList">BOOK조회</a></li>
                                    </ul>
                                </li>   
                         		<li class="dropdown"><a href="#">마이페이지<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="bookInsertForm">나의정보관리</a></li>
										<li><a href="managerRegist">매니저신청</a></li>
										<li><a href="#">내글관리</a></li>
                                    </ul>
                                </li>  
                                </c:if>
                         		<li class="dropdown"><a href="#">커뮤니티<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="noticeList">공지사항</a></li>
										<li><a href="board">자유게시판</a></li>
										<li><a href="inquire">1 : 1 문의</a></li>
										<li><a href="faq">F A Q</a></li>
										<li><a href="review">Review</a></li>
                                    </ul>
                                </li>                                                                                                                                                               
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
