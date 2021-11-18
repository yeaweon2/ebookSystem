<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트셀러</title>
<style type="text/css">
#bookNm {
	font-weight: bold;
}

img {
	margin : 5px;
}

</style>
<script type="text/javascript">

	$(function(){
		$(".column").on("click", function(){
			$("#bookId").val($(this).find("#bookKey").val());
			frm.submit();
		});   
		  
		
		
		
		$("#bestUl").on("click", "li", function(){
			$("#bookId").val($(this).data("id"));
			frm.submit();
		});

		$("#newUl").on("click", "li", function(){
			$("#bookId").val($(this).data("id"));
			frm.submit();
		});
		
		$("#likeUl").on("click", "li", function(){
			$("#bookId").val($(this).data("id"));
			frm.submit();
		});
	});

</script>
</head>
<body>
<section>
	<div class="section-inner nopadding-bottom">
              <div class="container">
                  <div class="row">
                      <div class="col-sm-9 match-height">
                          <div class="row">
                              <div class="col-xs-12">
                                  <ul id="bestUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="5" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
                                  <c:forEach var="bestbook" items="${bests}">
                                      <li data-id='${bestbook.bookId}'>
                                          <div class="row hover-item">
                                              <div class="col-xs-12">
                                                  <img src="/prj/fileUp${bestbook.bookCoverPath}${bestbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
                                              </div>
                                              <div class="col-xs-12 hover-item-caption smoothie">
                                                  <div class="vertical-center">
                                                      <h5 class="smoothie"><a href="single-portfolio.html" title="view project">${bestbook.bookNm}</a></h5>
                                                      <br/><span style="color:blue">${bestbook.lendCnt}</span>명이 읽는중
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
                  
				<div class="row">
                      <div class="col-sm-9 match-height">
                          <div class="row">
                              <div class="col-xs-12">
                                  <ul id="newUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="5" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
                                  <c:forEach var="newbook" items="${news}">
                                      <li data-id='${newbook.bookId}'>
                                          <div class="row hover-item">
                                              <div class="col-xs-12">
                                                  <img src="/prj/fileUp${newbook.bookCoverPath}${newbook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
                                              </div>
                                              <div class="col-xs-12 hover-item-caption smoothie">
                                                  <div class="vertical-center">
                                                      <h5 class="smoothie"><a href="single-portfolio.html" title="view project">${newbook.bookNm}</a></h5>
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
                              <h2 class="section-heading">신간BOOK</h2>
                              <h3 class="section-subheading secondary-font">Please Read Me ..</h3>
                          </div>
                      </div>
                  </div>		                    

				<div class="row">
                    <div class="col-sm-9 match-height">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul id="likeUl" class="owl-carousel-paged testimonial-owl wow fadeIn list-unstyled" data-items="5" data-items-tablet="[768,2]" data-items-mobile="[479,1]">
                                <c:forEach var="likebook" items="${likes}">
                                    <li data-id='${likebook.bookId}'>
                                        <div class="row hover-item">
                                            <div class="col-xs-12">
                                                <img src="/prj/fileUp${likebook.bookCoverPath}${likebook.bookCover}" width="180" height="210" class="img-responsive smoothie" alt="">
                                            </div>
                                            <div class="col-xs-12 hover-item-caption smoothie">
                                                <div class="vertical-center">
                                                    <h5 class="smoothie"><a href="single-portfolio.html" title="view project">${likebook.bookNm}</a></h5>
                                                    <br/><span>${likebook.bookLikeit}</span>명이 추천
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
                            <h2 class="section-heading">추천BOOK</h2>
                            <h3 class="section-subheading secondary-font">Please Read Me ..</h3>
                        </div>
                    </div>
                </div>		                    
              </div>
          </div>
          
</section> 

	
		
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>

</body>
</html>