<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-flex align-items-center">
	<div class="container d-flex justify-content-center justify-content-md-between">
		<div class="contact-info d-flex align-items-center">
			<i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
			<i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
		</div>
		<div class="d-none d-md-flex align-items-center">
			<c:if test="${empty id}">
				<a href="login" >로그인</a>
			</c:if>
			<c:if test="${not empty id}">
				<div>${id} : ${name} : ${nicknm} : ${auth} : ${stcd} </div>
				<a href="logout" >로그아웃</a>
			</c:if>
			
		</div>
	</div>
</section><!-- End Top Bar-->    
<!-- ======= Header ======= -->
<header id="header" class="d-flex align-items-center">
	<div class="container d-flex justify-content-between">

	<div id="logo">
		<h1><a href="home"><span>E</span>로운<span>생활</span></a></h1> 
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html"><img src="assets/img/logo.png" alt=""></a>-->
	</div>

		<nav id="navbar" class="navbar">  
			<ul>
				<li><a class="nav-link scrollto active" href="home">Home</a></li>
				<li><a class="nav-link scrollto" href="about">About</a></li>
				<li class="dropdown"><a href="#"><span>e로운BOOK</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#">BOOK검색</a></li>
						<li><a href="bestSeller">베스트셀러</a></li>
						<li><a href="#">신규BOOK</a></li>
					</ul>				
				</li>
				<li class="dropdown"><a href="#"><span>나의서재</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#">독서 루틴</a></li>
						<li><a href="#">버킷 BOOK</a></li>
						<li><a href="#">BOOK 캘린더</a></li>
					</ul>				
				</li>
				<li class="dropdown"><a href="#"><span>마이페이지</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="#">개인정보관리</a></li>
						<li><a href="#">대여관리</a></li>
						<li><a href="#">내글관리</a></li>
					</ul>				
				</li>
				<li class="dropdown"><a href="#"><span>커뮤니티</span><i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="noticeList">공지사항</a></li>
						<li><a href="board">자유게시판</a></li>
						<li><a href="inquire">1 : 1 문의</a></li>
						<li><a href="faq">F A Q</a></li>
						<li><a href="review">Review</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#"><span>도서관리</span><i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="bookInsertForm">BOOK등록</a></li>
						<li><a href="bookList">BOOK조회</a></li>
						<li><a href="ctgyList">카테고리관리</a></li>
						<li><a href="bcnfmList">BOOK승인관리</a></li>
					</ul>				
				</li>
				<li class="dropdown"><a href="#"><span>회원관리</span><i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="memberList">회원목록</a></li>
						<li><a href="managerRegist">업체등록신청</a></li>
					</ul>				
				</li>
				<li class="dropdown"><a href="#"><span>매니저관리</span><i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="managerList">매니저목록</a></li>
					</ul>				
				</li>						
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav><!-- .navbar -->
	</div>
</header><!-- End Header -->