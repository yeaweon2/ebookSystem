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
</style>
<<script type="text/javascript">
$(function(){
	
	$("#bestUl").on("click", "li", function(){
		$("#bookId").val($(this).data("id"));
		frm.submit();
	});
	
	$(".slideshow-container").on("click", "#mySlides", function(){
		alert("책리뷰 완성되면 넘어가도록 수정예정");
	});

	
});
</script>
<section class="white-bg">
	<div class="section-inner" id="dclick">
		<div class="row">
			<div class="col-md-5 box">
				<c:if test="${auth eq 'U'}">	<!-- 일반사용자 -->
					<div class="section-header">
				   		<h2>${nicknm}님의 버킷 TOP5</h2>
					</div>				   
					<c:forEach var="list" items="${lists}">
					   	<div class="row">
							<div class="col-sm-2">
								<label>${list.rn}</label>
							</div>
							<div class="col-sm-3">
								<img class="media-object" height="70" width="50" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">
							</div>
							<div class="col-sm-7">
								<h2>${list.bookNm}</h2>
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
					   	<div class="row">
							<div class="col-sm-2">
								<label>${list.rn}</label>
							</div>
							<div class="col-sm-3">
								<img class="media-object" height="70" width="50" src="/prj/fileUp${list.bookCoverPath}${list.bookCover}">
							</div>
							<div class="col-sm-7">
								<h2>${list.bookNm}</h2>
								<label>${list.bookPublCo}(${list.bookWriter})</label>
							</div>
					   	</div>
				   	</c:forEach>
				</c:if>
				<c:if test="${auth eq 'A'}">	<!-- 관리자 -->
				   <div class="section-header">
				   		<h2>${nicknm}님의 미처리 1:1 문의</h2>
					</div>				   
					<c:forEach var="list" items="${lists}">
					   	<div class="row">
							<div class="col-sm-2">
								<label>${list.rn}</label>
							</div>
							<div class="col-sm-5">
								<label>${list.cmmntyTitle}</label>
							</div>
							<div class="col-sm-2">
								<label>${list.memberNm}</label>
							</div>
							<div class="col-sm-3">
								<label>${list.insDt}</label>
							</div>
					   	</div>
				   	</c:forEach>
				</c:if>
				<c:if test="${empty auth}">		<!-- 로그인전 미접속상태 -->
				   
				</c:if>
			</div>
			<div class="col-md-6">			
				<div class="row box">
                      <div class="col-sm-9 match-height">
                          <div class="row">
                              <div class="col-xs-12">
                                  <ul id="bestUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="3" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
                                  <c:forEach var="bestbook" items="${bests}">
                                      <li data-id='${bestbook.bookId}'>
                                          <div class="row hover-item">
                                              <div class="col-xs-12">
                                                  <img src="/prj/fileUp${bestbook.bookCoverPath}${bestbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
                                              </div>
                                              <div class="col-xs-12 hover-item-caption smoothie">
                                                  <div class="vertical-center">
                                                      <h3 class="smoothie"><a href="single-portfolio.html" title="view project">${bestbook.bookNm}</a></h3>
                                                      <ul class="smoothie list-inline social-links wow">
                                                          <li>
                                                              <a href="#"><i class="fa fa-twitter"></i></a>
                                                          </li>
                                                          <li>
                                                              <a href="#"><i class="fa fa-pinterest"></i></a>
                                                          </li>
                                                          <li>
                                                              <a href="#"><i class="fa fa-dribbble"></i></a>
                                                          </li>
                                                          <li>
                                                              <a href="#"><i class="fa fa-facebook"></i></a>
                                                          </li>
                                                          <li>
                                                              <a href="#"><i class="fa fa-behance"></i></a>
                                                          </li>
                                                          <li>
                                                              <a href="#"><i class="fa fa-linkedin"></i></a>
                                                          </li>
                                                      </ul>
                                                  </div>
                                              </div>
                                          </div>
                                      </li>
                                      
                                  </c:forEach> 
                                      
                                  </ul>
                              </div>
                          </div>
                      </div>
                      <div class="col-sm-3 match-height">
                          <div class="vertical-center">
                              <h2 class="section-heading">BEST SELLER</h2>
                              <h3 class="section-subheading secondary-font">Please Read Me ..</h3>
                          </div>
                      </div>
                  </div>	
				<div class="row box">
					<div>
						<div class="slideshow-container">
							<c:forEach var="review" items="${reviewList}">
							<div class="mySlides">
								<div class="row pointer" style="padding:30px">
									<div class="col-md-3" >
										<img src="/prj/fileUp${review.bookCoverPath}${review.bookCover}"  width="250px" height="280px">
									</div>
									<div class="col-md-8 col-sm-offset-1" style="padding:20px" >
										<h2>${review.reviewTitle}</h2>
										<p>${review.reviewContents}</p>	
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
	<form action="bookDetail" method="post" id="frm">
		<input type="hidden" id="bookId" name="bookId" >
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


