<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}

/* Slideshow container */
.slideshow-container {

  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: black;
  color:white;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

.over {
	text-decoration: underline;
	font-weight: bold;	
}

ul li {
	list-style-type: none; 
	float: left;
	margin-left:7px;
}


ul li img:hover {
	width:70px;
	height:70px;
}

figcaption {
	font-size: 12px;
	text-align: center;
}

</style>
<script type="text/javascript">
$(function(){
	
	$("#bestUl").on("click", "li", function(){
		$("#bookId").val($(this).data("id"));
		frm.submit();
	});
	
	$("#newUl").on("click", "li", function(){
		$("#bookId").val($(this).data("id"));
		frm.submit();
	});
	
	$("#likesUl").on("click", "li", function(){
		$("#bookId").val($(this).data("id"));
		frm.submit();
	});	
	
	$(".slideshow-container").on("click", ".mySlides", function(){
		var id = $(this).data("reviewid");
		$("#reviewId").val(id);
		frm.action = "reviewSelectList";
		frm.submit();
	});
	
	$(".bucketBook").on("mouseover", function(){
		$(this).find("h4").addClass("over");
		$(this).find("label").addClass("over");
	});
	
	$(".bucketBook").on("mouseout", function(){
		$(this).find("h4").removeClass("over");
		$(this).find("label").removeClass("over");
	});
	
	$(".bcnfmBook").on("mouseover", function(){
		$(this).find("h4").addClass("over");
		$(this).find("label").addClass("over");
	});
	
	$(".bcnfmBook").on("mouseout", function(){
		$(this).find("h4").removeClass("over");
		$(this).find("label").removeClass("over");
	});
	
	$(".cmmntyAsk").on("mouseover", function(){
		$(this).find("p").addClass("over");
	});
	
	$(".cmmntyAsk").on("mouseout", function(){
		$(this).find("p").removeClass("over");
	});
	
	$("#bestB").on("click", function(){
		event.preventDefault();
		$("#bestUl").removeClass("hidden");
		$("#newUl").addClass("hidden");
		$("#likesUl").addClass("hidden");
	});
	
	$("#newB").on("click", function(){
		event.preventDefault();
		$("#bestUl").addClass("hidden");
		$("#newUl").removeClass("hidden");
		$("#likesUl").addClass("hidden");
	});
	
	$("#likeB").on("click", function(){
		event.preventDefault();
		$("#bestUl").addClass("hidden");
		$("#newUl").addClass("hidden");
		$("#likesUl").removeClass("hidden");
	});	
	
});
</script>
<section class="white-bg">
	<div class="section-inner" id="dclick">
		<div class="container">
			<div class="row">
				<div class="col-md-4 box" style="padding-left:0px; padding-right:0px">
					<div class="row" style="padding:0; margin:0px">
						<ul>
							<li onclick="location.href='bestSeller'">
								<figure>
									<img src="resources/img/menuicon/menu1.png">
									<figcaption>베스트셀러</figcaption>
								</figure>
							</li>
							<li onclick="location.href='bookSrchList'">
								<figure>
									<img src="resources/img/menuicon/menu2.png">
									<figcaption>BOOK검색</figcaption>
								</figure>
							</li>
							<c:if test="${empty id }">
								<li onclick="location.href='ctgyBookList'">
									<figure>
										<img src="resources/img/menuicon/menu9.png">
										<figcaption>카테고리별조회</figcaption>
									</figure>
								</li>
							</c:if>
							<c:if test="${auth eq 'A' }">
								<li onclick="location.href='bcnfmList'">
									<figure>
										<img src="resources/img/menuicon/menu7.png">
										<figcaption>BOOK승인</figcaption>
									</figure>
								</li>
								<li onclick="location.href='myInfo'">
									<figure>
										<img src="resources/img/menuicon/menu8.png">
										<figcaption>마이페이지</figcaption>
									</figure>
								</li>
							</c:if>
							<c:if test="${auth eq 'M' }">
								<li onclick="location.href='bookInsertForm'">
									<figure>
										<img src="resources/img/menuicon/menu3.png">
										<figcaption>BOOK등록</figcaption>
									</figure>
								</li>
								<li onclick="location.href='bookInsertForm'">
									<figure>
										<img src="resources/img/menuicon/menu8.png">
										<figcaption>마이페이지</figcaption>
									</figure>
								</li>
							</c:if>
							<c:if test="${auth eq 'U' }">
								<li onclick="location.href='bookRutin'">
									<figure>
										<img src="resources/img/menuicon/menu4.png">
										<figcaption>독서루틴</figcaption>
									</figure>
								</li>
								<li onclick="location.href='bucketList'">
									<figure>
										<img src="resources/img/menuicon/menu5.png">
										<figcaption>버킷BOOK</figcaption>
									</figure>
								</li>								
								<li onclick="location.href='lendList'">
									<figure>
										<img src="resources/img/menuicon/menu6.png">
										<figcaption>BOOK리딩</figcaption>
									</figure>
								</li>
							</c:if>
						</ul>
					</div>
					<hr>
					<div class="row" style="margin-top:20px; padding-left:40px">
							<c:if test="${auth eq 'U'}">	<!-- 일반사용자 -->
								<div class="section-header">
							   		<h2>${nicknm}님의 버킷 TOP5</h2>
								</div>				   
								<c:forEach var="list" items="${lists}">
								   	<div class="row bucketBook pointer" onclick="location.href='bucketList'">
										<div class="col-sm-2">
											<img class="media-object" height="70" width="50" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">
										</div>
										<div class="col-sm-10">
											<h4>${list.rn}. ${list.bookNm}</h4>
											<label>${list.bookPublCo}(${list.bookWriter})</label>
										</div>
								   	</div>
							   	</c:forEach>
							</c:if>
							<c:if test="${auth eq 'M'}">	<!-- 매니저 -->
								<div class="section-header">
							   		<h2>${nicknm}님의 미처리 BOOK</h2>
								</div>				   
								<c:forEach var="list" items="${lists}">
								   	<div class="row bcnfmBook pointer" onclick="location.href='bookList'">
										<div class="col-sm-2">
											<img class="media-object" height="70" width="50" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">
										</div>
										<div class="col-sm-10">
											<h4>${list.rn}. ${list.bookNm}</h4>
											<label>${list.bookPublCo}(${list.bookWriter})</label>
										</div>
								   	</div>
							   	</c:forEach>
							</c:if>
							<c:if test="${auth eq 'A'}">	<!-- 관리자 -->
							   <div class="section-header">
							   		<h3>${nicknm}님의 미처리 1:1 문의</h3>
								</div>				   
								<c:forEach var="list" items="${lists}">
								   	<div class="row cmmntyAsk pointer" onclick="location.href='inquireList'">
										<div class="col-sm-12" style='padding:0px; margin-left:20px'>
											<p>${list.rn}. ${list.cmmntyTitle}<br/>&nbsp;&nbsp;&nbsp;&nbsp;${list.memberNm} ( ${list.insDt} )</p>
										</div>
								   	</div>
							   	</c:forEach>
							</c:if>
							<c:if test="${empty auth}">		<!-- 로그인전 미접속상태 -->
							   
							</c:if>
						</div>
						<div class="row" style="margin-top:30px;padding-left:40px">
							<img width="400px" height="280px" src="resources/img/banner1.png" onclick="location.href='bookReviewList'">
						</div>
				</div>
				<div class="col-md-8">	
					<div class="row srchBox">
						<div class="col-sm-12 match-height">
							<div class="row">
	                      		<div class="col-md-12" style="margin-bottom:10px">
									<ul class="mb30 list-inline wow">
										<li><a id="bestB" class="btn btn-primary" href="#" >베스트셀러</a></li>
										<li><a id="newB" class="btn btn-primary" href="#" >신작도서</a></li>
										<li><a id="likeB" class="btn btn-primary" href="#" >추천순</a></li>
									</ul>
								</div>
							</div> 
							<div class="row">
								<div class="col-xs-12">
									<ul id="bestUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="4" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
										<c:forEach var="bestbook" items="${bests}">
											<li data-id='${bestbook.bookId}'>
												<div class="row hover-item">
													<div class="col-xs-12">
														<img src="/prj/fileUp${bestbook.bookCoverPath}${bestbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
													</div>
													<div class="col-xs-12 hover-item-caption smoothie">
														<div class="vertical-center">
															<h5 class="smoothie"><a href="#" title="view project">${bestbook.bookNm}</a></h5>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
									<ul id="newUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled hidden" data-items="4" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
										<c:forEach var="newbook" items="${news}">
											<li data-id='${newbook.bookId}'>
												<div class="row hover-item">
													<div class="col-xs-12">
														<img src="/prj/fileUp${newbook.bookCoverPath}${newbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
													</div>
													<div class="col-xs-12 hover-item-caption smoothie">
														<div class="vertical-center">
															<h5 class="smoothie"><a href="#" title="view project">${newbook.bookNm}</a></h5>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>									
									<ul id="likesUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled hidden" data-items="4" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
										<c:forEach var="likesbook" items="${likes}">
											<li data-id='${likesbook.bookId}'>
												<div class="row hover-item">
													<div class="col-xs-12">
														<img src="/prj/fileUp${likesbook.bookCoverPath}${likesbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
													</div>
													<div class="col-xs-12 hover-item-caption smoothie">
														<div class="vertical-center">
															<h5 class="smoothie"><a href="#" title="view project">${likesbook.bookNm}</a></h5>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
	                              </div>
	                          </div>
	                      </div>
					</div>	
					<div class="row box">
						<div>
							<div class="slideshow-container">
								<c:forEach var="review" items="${reviewList}">
								<div class="mySlides" data-bookid='${review.bookId}' data-reviewid='${review.reviewId}'>
									<div class="row pointer" style="padding:20px" >
										<div class="col-md-3" >
											<img src="/prj/fileUp${review.bookCoverPath}${review.bookCover}"  width="220px" height="280px">
										</div>
										<div class="col-md-8 col-sm-offset-1" style="padding:20px" >
											<h2>${review.reviewTitle}</h2>
											<p>${review.reviewContents}  <a href="#" style="color:blue" >더보기</a></p>	
										</div>
									</div>
								</div>
								</c:forEach>
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
								
								</div>
								<br>
								
								<div style="text-align:center">
								  <span class="dot" onclick="currentSlide(1)"></span> 
								  <span class="dot" onclick="currentSlide(2)"></span> 
								  <span class="dot" onclick="currentSlide(3)"></span>
								  <span class="dot" onclick="currentSlide(4)"></span> 
								  <span class="dot" onclick="currentSlide(5)"></span>  
								</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="bookDetail" method="post" id="frm">
		<input type="hidden" id="bookId" name="bookId" >
		<input type="hidden" id="reviewId" name="reviewId">
	</form>
</section>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}


</script>    



