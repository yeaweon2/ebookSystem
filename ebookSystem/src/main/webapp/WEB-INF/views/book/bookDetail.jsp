<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='resources/bookDetail/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/bookDetail/style.css' type='text/css' media='all'/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style type="text/css">
body {
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
}

.ppDiv {
	padding : 20pt;
}

.button {
  border-radius: 4px;
  background-color: black;
  border: none;
  color: white;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 130px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 20px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}


.bucketBtn {
	background-color: white;
	border: none;
	color: black;
	padding: 8px 12px;
	font-size: 18px;
	cursor: pointer;
	border-radius: 50%;
	border : 1px solid black;	
}

.bucketBtn i {
	color: blue;
}

.bTitle {
    display: block;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0 0 0 0;
    padding-left : 20px;
    padding-right : 20px;
    padding-bottom : 20px;
    font-family: malgun, "Malgun Gothic", Dotum, 돋움, sans-serif;
    color: #222;
    font-size: 21px;
    line-height: 1.5;
    text-align: left;
    letter-spacing: -0.02em;
}


.bIntro {
	float: 'left';
	width: '800px';
	margin: '50px 0px 0 0px';
	padding-left : 20px;
    padding-right : 20px;
	fontFamily: 'malgun, "Malgun Gothic", Dotum, 돋움, sans-serif';
	fontSize: '15px';
	lineHeight: '1.8';
	letterSpacing: '-0.02em';
	textAlign: 'left';
	color: '#333';
}

.bInfo {
	padding-left: 30px;
	
}

.Ere_clear{
	clear:both;
	margin:0px;
	padding:0;
}

.comment-text{
	margin: 0 0 0 50px;
    border: 1px solid #e4e1e3;
    border-radius: 4px;
    padding: 1em 1em 1em 1em;
}

#childReply& {
	padding-left:25px;
}

.star {
	font-size: 16px;
	color : #f15e5e;
}

.comment-text {
	padding:20px;
}

ul.sidenav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
}

ul.sidenav li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
  font-size:19px;
  
}

/* Change the link color on hover */
ul.sidenav li a:hover {
  color: black;
  font-size:20px;
  font-weight:bold;
  text-decoration: underline;
   
}


</style>
<script type="text/javascript">
	$(function(){
		
		var bookAvg = parseFloat(`${book.bookAvg}`);
		console.log(`${book.bookAvg}`);
		console.log(bookAvg);
		for( var i = 1; i <= 5 ; i++){
			if( i <= bookAvg ){
				$("#bookAvg").append($("<i class='star fas fa-star' style='font-size: 20px'>"));		
			}else{
				if( i > bookAvg && i-1 < bookAvg ){
					$("#bookAvg").append($("<i class='star fas fa-star-half-alt' style='font-size: 20px'>"));
				}else{
					$("#bookAvg").append($("<i class='star far fa-star' style='font-size: 20px'>"));
				}
			}
		}
		
		
		// 장바구니 클릭시 
		$("#bookCartForm").on("click", function(){
			var bookId = $("#bookId").val();
	 		 $.ajax({
	 			url : 'cartDuplCheck' ,
	 			data : JSON.stringify({ bookId : bookId }) ,
	 			contentType : 'application/json',
	 			method : 'POST' ,
	 			dataType : 'json' ,
	 			success : function(data){
	 				console.log(data);
	 				if(data.result == "01"){
	 					Swal.fire({ 
		    				   icon: 'error',  
		    				   title: '카트중복',  
		    				   text: '이미 카트에 담겨있는 BOOK입니다. ',  
		    			});	 					
	 					return;
	 				}else{
	 					frm.action = "cartInsert";
	 					frm.submit();		
	 				}
	 			}
	 		}); 			
		});
		
		$("#likeItBtn").on("click", function(){
			var bookId = $("#bookId").val();
			
			$.ajax({
				url : 'bookLikeItUpdate' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					if(res.result=="01"){
						Swal.fire({ 
		    				   icon: 'success',  
		    				   title: '추천완료',  
		    				   text: '정상적으로 추천되었습니다.',  
		    			});						
						var likeItCnt = $("#likeIt").html();
						$("#likeIt").html(parseInt(likeItCnt)+1);						
					}
				}
			});
		});
		
		// 버킷 클릭시
		$("#bucketBtn").on("click", function(){
			var bookId = $("#bookId").val();
			
			$.ajax({
				url : 'bucketInsert' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					if(res.result == "중복"){
						Swal.fire({ 
						   icon: 'error',  
						   title: '버킷 중복',  
						   text: '이미 버킷BOOK으로 등록되어있습니다.',  
						});
						return false;
					}else{
						Swal.fire({ 
						   icon: 'success',  
						   title: '버킷완료!!',  
						   text: '정상적으로 등록되었습니다.',  
						});
					}
				}
			});
		});
		
		// 대여 클릭시
		$("#bookLendForm").on("click", function(){
			var bookId = $("#bookId").val();
			
			var subYn = `${subYn}`;
			if( subYn == 'N'){
				Swal.fire({ 
				   icon: 'error',  
				   title: '월정액 미가입',  
				   text: '월정액 구매 후 대여가능합니다.',  
				});
				return false;
			}

			$.ajax({
				url : 'lendInsertOne' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					if(res.result == "03"){
						Swal.fire({ 
						   icon: 'error',  
						   title: '대여중복',  
						   text: '이미 대여한 BOOK입니다.',  
						});
						return false;
					}else if(res.result == "04"){
						alert("세션종료되었습니다. 다시 로그인 후 진행해주세요.");
						return false;
					}else{
						
						Swal.fire({ 
						   icon: 'success',  
						   title: '대여완료!!',  
						   text: '정상적으로 등록되었습니다.',  
						});
					}
				}
			});
		});	
		
		// 별 클릭시
		$("#newStars").on("click", ".star", function(){
			
			var starNo = $(this).data("no");
			
			$(this).removeClass("far");
			$(this).addClass("fas");
			
			$(this).prevAll().removeClass("far");
			$(this).prevAll().addClass("fas");
			
			$(this).nextAll().removeClass("fas");
			$(this).nextAll().addClass("far");
			
			$("#breplyStar").val($(this).data("no"));
		});		
		
		// 댓글 삭제 클릭시 
		$("#comments-list").on("click",".breplyDelete", function(){
			event.preventDefault();
			
			var bookId = $("#bookId").val();
			var breplyId = $(this).data("breplyid");
			var target = $(this).closest(".media");
			
			$.ajax({
				url : 'breplyDelete' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId, breplyId : breplyId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					console.log( target );
					target.remove();
				}
			});			
		});
		
		// 부모댓글 등록시 
		$("#breplyInsert").on("click", function(){
			event.preventDefault();
			
			if( `${id}` == '' ){
				alert("로그인 후 등록해주세요.");
				return false;
			}
			
			var bookId = $("#bookId").val();
			var breplyContents = $("#breplyContentsNew").val();  
			var breplyStar = $("#breplyStar").val();
			
			if( $("#breplyStar").val() == null || $("#breplyStar").val() == ""){
				breplyStar = 0;
			}
			
			$.ajax({
				url : 'breplyInsert' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId, breplyContents : breplyContents , breplyStar : breplyStar }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					
					$("#breplyContentsNew").val("");
					
					$("#comments-list")
						.append( $("<div class='media'>")
										.append($("<div class='pull-left'>")
														.append($("<img>")))
										.append( $("<div class='media-body'>")
														.append($("<div class='well'>")
																	.append($("<div class='media-heading'>")
																				.append($("<span class='heading-font'>").html(" " + res.breplyWriterNm))
																				.append($("<small>").html(res.insDt))
																				.append( $("<div id='stars' class='stars pStar'>")))
																	.append( $("<p>").html(res.breplyContents) )
																	.append( $("<div class='pull-right'>")
																					.append($("<a href='#' class='breplyChildInsert'>").data("breplygr", res.breplyGr ).data("breplyid", res.breplyId ).html("댓글쓰기") )
																					.append($("<a href='#' class='breplyUpdate'>").html("수정"))
																					.append($("<a href='#' class='breplyDelete'>").html("삭제"))
																					.append($("<a href='#' class='breplySave hidden' >").html("저장"))
																					.append($("<a href='#' class='breplyCancel hidden'>").html("취소"))
																					
																	))));
					
					
					
 					for( var i = 1 ; i <= 5 ; i++ ){
						if(res.breplyStar  >= i ){
							$("#comments-list").last().find(".pStar").append($("<i class='star fas fa-star' data-flag='true'>").data("no", i ) );	
						}else{
							$("#comments-list").last().find(".pStar").append($("<i class='star far fa-star' data-flag='false'>").data("no", i ) );
						}
					}
 					
 					$("#newStars").find(".star").removeClass("fas");
					$("#newStars").find(".star").addClass("far"); 					
 					
				}
			});
		});
		
		var oldContents = "";
		
		// 댓글 수정 클릭시 
		$("#comments-list").on("click",".breplyUpdate", function(){
			event.preventDefault();
			oldContents = $(this).closest(".media-body").find("p").html();
			
			$(this).closest(".media-body").find("p").html("");
			$(this).closest(".media-body").find("p").append($("<textarea class='form-control'>").val(oldContents));
			
			$(this).addClass("hidden");
			
			$(this).siblings(".breplySave").removeClass("hidden");
			$(this).siblings(".breplyCancel").removeClass("hidden");
			$(this).siblings(".breplyDelete").addClass("hidden");
			$(this).siblings(".breplyChildInsert").addClass("hidden");	
			
			
			$("#stars").on("click", ".star", function(){
				
				var starNo = $(this).data("no");
				
				$(this).removeClass("far");
				$(this).addClass("fas");
				
				$(this).prevAll().removeClass("far");
				$(this).prevAll().addClass("fas");
				
				$(this).nextAll().removeClass("fas");
				$(this).nextAll().addClass("far");
				
				$("#breplyStar").val($(this).data("no"));
				
			});	
			
		});
		
		// 댓글취소 클릭시 
		$("#comments-list").on("click", '.breplyCancel' , function(){
			event.preventDefault();
			
			$(this).closest(".media-body").find("p").html("");
			$(this).closest(".media-body").find("p").html(oldContents);
			
			$(this).addClass("hidden");
			$(this).siblings(".breplySave").addClass("hidden");
			$(this).siblings(".breplyUpdate").removeClass("hidden");
			$(this).siblings(".breplyDelete").removeClass("hidden");
			$(this).siblings(".breplyChildInsert").removeClass("hidden");
			
		});		
		
		// 댓글저장 클릭시 
		$("#comments-list").on("click", '.breplySave' , function(){
			event.preventDefault();
			
			var breplyId = $(this).data("breplyid");
			var bookId = $("#bookId").val();
			var breplyContents = $(this).closest(".media-body").find("textarea").val();
			var breplyStar = $("#breplyStar").val();
			var breplyClass = "0";
			var area = $(this).closest(".media-body").find("p");
			
			$.ajax({
				url : 'breplyUpdate' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId, breplyId : breplyId , breplyClass : breplyClass, breplyContents : breplyContents , breplyStar : breplyStar }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					area.html("");
					area.html(breplyContents);
					console.log(res);
				}
			});	
			
			$(this).addClass("hidden");
			$(this).siblings(".breplyCancel").addClass("hidden");
			$(this).siblings(".breplyUpdate").removeClass("hidden");
			$(this).siblings(".breplyDelete").removeClass("hidden");
			$(this).siblings(".breplyChildInsert").removeClass("hidden");
			$("#stars").off("click");
		});	
		
		 
		// 자식댓글 쓰기 클릭시  
		$("#comments-list").on("click", '.breplyChildInsert' , function(){
			event.preventDefault();
			
			$("#childBox").removeClass("hidden");
			
			console.log($("#childBox"));
			console.log($(this).closest(".media-body"));
			$(this).closest(".media-body").after( $("#childBox") );
			
			$("#childBox").find(".breplyChildSave").data("breplygr" , $(this).data("breplygr"));
		});
		
 		// 자식댓글 저장 클릭시 
		$("#comments-list").on("click", ".breplyChildSave",function(){
			event.preventDefault();
			
			var bookId = $("#bookId").val();
			var breplyContents = $(this).closest(".well").find("#breplyContentsNew").val();  
			var breplyStar = '0';
			var breplyClass = "1";
			var breplyGr = $(this).data("breplygr");
			
			var target = $(this);
			
			$.ajax({
				url : 'breplyInsert' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId, breplyContents : breplyContents , breplyStar : breplyStar, breplyClass : breplyClass , breplyGr : breplyGr }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					console.log(target);
					$("#childBox").addClass("hidden");
					$("#childBox").find("textarea").val("");
					
					target.closest(".parentReply").find(".media-body:first").append(
							$("<div class='media' style='margin-left:50px'>")
								.append($("<div class='pull-left'>")
											.append( $("<i class='material-icons'>").html("subdirectory_arrow_right") )
											.append( $("<img class='avatar comment-avatar'>").attr('src','resources/img/profile.png') )
										)
								.append($("<div class='media-body'>") 
											.append( $("<div class='well'>")	
														.append( $("<div class='media-heading'>")
																.append( $("<span class='heading-font'>").html( res.breplyWriterNm )) 
																.append( $("<small>").html( res.insDt ) )
																)
														.append( $("<p>").html(res.breplyContents) )
														.append( $("<div class='pull-right'>")
																	.append( $("<a href='#' class='breplyChildInsert'>").data("breplygr", res.breplyGr ).data("breplyid", res.breplyId ).html("댓글쓰기"))
																	.append( $("<a href='#' class='breplyUpdate'>").data("breplyid", res.breplyId ).html("수정"))
																	.append( $("<a href='#' class='breplyDelete'>").data("breplyid", res.breplyId ).html("삭제"))
																	.append( $("<a href='#' class='breplySave hidden'>").data("breplyid", res.breplyId ).html("저장"))
																	.append( $("<a href='#' class='breplyCancel hidden'>").data("breplyid", res.breplyId ).html("취소"))

																)
													)
										)
								)

				}
			});
		});
		
		// 자식댓글 취소 클릭시 
		$("#comments-list").on("click", ".breplyChildCancel", function(){
			event.preventDefault();
			$("#childBox").addClass("hidden");
		});	 
		
	});
	
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row">
				<div class="col-sm-3">			
					<ul class="sidenav">
						<li><a href="bestSeller">BEST SELLER</a></li>
						<li><a href="bookSrchList">BOOK 검색</a></li>
						<li><a href="ctgyBookList">카테고리별 조회</a></li>
						<li><a href="bookReviewList">BOOK REVIEW</a></li>							
					</ul>
				</div>
				<div class="col-sm-9" style="margin-left:0">
					<div class="row">
						<div class="col-sm-4" >
							<img width="240" height="270" style="margin-top:20px" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
						</div>
						<div class="col-sm-8 bInfo">
							<div class="row">
								<c:if test="${book.bookFlCd == 'E'}">
									<h4 style="color:blue">eBOOK</h4>
								</c:if>
								<c:if test="${book.bookFlCd == 'A'}">
									<h4 style="color:blue">오디오북</h4>
								</c:if>
								
								<h1 class="display-5 fw-bold">${book.bookNm}</h1>
								<h3>${book.bookPublCo} ( ${book.bookWriter} )</h3>
							</div>
							<c:if test="${not empty book.bookPublDt }">
								<div class="row" style="margin-top:10px">
								   출간일 : ${book.bookPublDt}
								</div>							
							</c:if>
							<c:if test="${book.lendCnt > 0 }">
							<div class="row" style="margin-top:10px">
								<span style="color:blue">${book.lendCnt}</span>명이 읽는중
							</div>
							</c:if>
							<div class="row" style="margin-top:10px">
								추 천 : <span id="likeIt">${book.bookLikeit}</span>
							</div>
							<c:if test="${not empty book.bookAvg }">
							<div class="row" id="bookAvg" style="margin-top:10px">
								BOOK 평 점 :   ${book.bookAvg}
							</div>
							</c:if>
							<c:if test="${auth eq 'U' || auth eq 'A'}">
								<div class="pull-right" style="margin-top:70px;padding-left:0">
									<button type="button" class="button" id="bookCartForm"><span>카트담기 </span></button>
									<button type="button" class="button" id="bookLendForm"><span>BOOK대여 </span></button>
									<img id="bucketBtn" class="pointer" width="60px" height="60px" src="resources/img/bucketbtn.png">
									<img id="likeItBtn" class="pointer" width="60px" height="60px" src="resources/img/likeitbook.png">							
								</div>
							</c:if>
						</div>
					</div>
					<div class="Ere_line"></div>
					
					<div class="wpcmsdev-tabs">
					
						<c:if test="${not empty book.bookIntro}">
							<div class="tab">
								<h3 class="tab-title" data-tab-id="bookIntro">책소개</h3>
								<div id="tab-bookIntro" class="tab-content">
									<p>
										${book.bookIntro}
									</p>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty book.bookContent}">
							<div class="tab">
								<h3 class="tab-title" data-tab-id="bookContent">목차</h3>
								<div id="tab-bookContent" class="tab-content">
									<p>
										${book.bookContent}
									</p>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty book.bookWriterIntro}">
							<div class="tab">
								<h3 class="tab-title" data-tab-id="bookWriter">저자소개</h3>
								<div id="tab-bookWriter" class="tab-content">
									<p>
										${book.bookWriterIntro}
									</p>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty book.bookDesc}">
							<div class="tab">
								<h3 class="tab-title" data-tab-id="bookDesc">책설명</h3>
								<div id="tab-bookDesc" class="tab-content">
									<p>
										${book.bookDesc}
									</p>
								</div>
							</div>
						</c:if>	
					</div>
					<input type="hidden" id="bookId" value="${book.bookId}">
					<input type="hidden" id="breplyStar">
					<div class="Ere_line"></div>
					<div id="comments-list" class="row gap wow">
						<div class="mt30 mb30 single-section-title">
						    <h3>Comments</h3>
						</div>
						<c:if test="${not empty id }">
							<div id="comments-form" class="row box" >
								<div class="col-md-12">
									<div id="comment_message"></div>
									<form method="post" id="commentform" class="comment-form">
										<div class="col-md-3 ">
											<label class="title">${nicknm}</label>
										</div>
										<div id="newStars" class="col-md-3 stars" style="padding-left:0"> 		
											<i class="star far fa-star" data-flag="false" data-no="1"></i>
											<i class="star far fa-star" data-flag="false" data-no="2"></i>
											<i class="star far fa-star" data-flag="false" data-no="3"></i>
											<i class="star far fa-star" data-flag="false" data-no="4"></i>
											<i class="star far fa-star" data-flag="false" data-no="5"></i>
										</div>
										<div class="col-md-3"></div>
										<div class="col-md-3"><a id="breplyInsert" class="btn ebookBtn-sm pull-right" href="#">등록</a></div>
										<textarea name="breplyContentsNew" class="form-control" id="breplyContentsNew" placeholder="댓글을 남겨주세요 *" required data-validation-required-message="Please enter a message."></textarea>
									</form>
								</div>
							</div>		
						</c:if>				
						<c:forEach var="reply" items="${replys}">
							<c:if test="${reply.breplyClass != '1'}">
								<div class="media parentReply">
									<div class="pull-left">
										<img class="avatar comment-avatar" src="resources/img/profile.png" alt="">
									</div>
									<div class="media-body">
										<div class="well">
											<div class="media-heading">
												<span class="heading-font">${reply.breplyWriterNm}</span>&nbsp; <small>${reply.insDt}</small>
												<div id="stars" class="stars">
													<c:forEach var="starVal" begin="1" end="5" step="1" >
														<c:choose>
															<c:when test="${starVal <= reply.breplyStar}">
																<i class="star fas fa-star" data-flag="true" data-no="${starVal}"></i>
															</c:when>
															<c:otherwise>
																<i class="star far fa-star" data-flag="false" data-no="${starVal}"></i>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</div>							
											</div>
											<p>${reply.breplyContents}</p>
											<div class="pull-right">
												<a href="#" class="breplyChildInsert" data-breplyid="${reply.breplyId}" data-breplygr="${reply.breplyGr}">댓글쓰기</a>
												<c:if test="${reply.breplyWriter eq id }">
													<a href="#" class="breplyUpdate" data-breplyid="${reply.breplyId}">수정</a>
													<a href="#" class="breplyDelete" data-breplyid="${reply.breplyId}">삭제</a>
													<a href="#" class="breplySave hidden" data-breplyid="${reply.breplyId}">저장</a>
													<a href="#" class="breplyCancel hidden" data-breplyid="${reply.breplyId}">취소</a>
												</c:if>
											</div>
										</div>
										<c:forEach var="childReply" items="${replys}">			
											<c:if test="${childReply.breplyClass eq '1'}">
												<c:if test="${childReply.breplyGr eq reply.breplyId}">
													<div class="media" style="margin-left:50px">
														
														<div class="pull-left">
															<i class="material-icons">subdirectory_arrow_right</i>	
															<img class="avatar comment-avatar" src="resources/img/profile.png" alt="">
														</div>
														<div class="media-body">
															<div class="well">
																<div class="media-heading">
																	<span class="heading-font">${childReply.breplyWriterNm}</span>&nbsp; <small>${childReply.insDt}</small>
																</div>
																<p>${childReply.breplyContents}</p>
																<div class="pull-right">
																	<a href="#" class="breplyChildInsert" data-breplyid="${childReply.breplyId}" data-breplygr="${reply.breplyGr}">댓글쓰기</a>
																	<c:if test="${childReply.breplyWriter eq id }">
																		<a href="#" class="breplyUpdate" data-breplyid="${childReply.breplyId}">수정</a>
																		<a href="#" class="breplyDelete" data-breplyid="${childReply.breplyId}">삭제</a>
																		<a href="#" class="breplySave hidden"  data-breplyid="${childReply.breplyId}">저장</a>
																		<a href="#" class="breplyCancel hidden"  data-breplyid="${childReply.breplyId}">취소</a>
																	</c:if>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:if>	
										</c:forEach>			
									</div>
								</div>
							</c:if>	
						</c:forEach>
					</div>			
				</div>
			</div>
		</div>
	</div>
</section>

<div id="childBox" class="media hidden">
    <div class="pull-left">
        <img class="avatar comment-avatar" src="resources/assets/img/users/3.jpg" alt="">
    </div>
    <div class="media-body">
        <div class="well">
            <div class="media-heading">
                <span class="heading-font">${nickNm}</span>&nbsp; <small></small>
            </div>
            <textarea name="breplyContentsNew" class="form-control" id="breplyContentsNew" placeholder="댓글을 입력해주세요 *" required data-validation-required-message="Please enter a message."></textarea>
			<div class="pull-right">
				<a href="#" class="breplyChildSave">저장</a>
				<a href="#" class="breplyChildCancel">취소</a>
			</div>            
        </div>
    </div>
</div>



<form action="#" method="post" id="frm" name="frm">
	<input type="hidden" id="bookId" name="bookId" value="${book.bookId}">
</form>
<script src='resources/bookDetail/tabs.js'></script>
</body>
</html>