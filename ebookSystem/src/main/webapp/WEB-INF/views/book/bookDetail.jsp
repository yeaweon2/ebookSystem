<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
  font-size: 20px;
  padding: 10px;
  width: 150px;
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
	background-color: red;
	border: none;
	color: white;
	padding: 12px 16px;
	font-size: 21px;
	cursor: pointer;
	border-radius: 50%;
}


.bucketBtn i {
	color: white;
}

.bucketBtn:hover {
	opacity: 0.6;
  	background-color: red;
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

.Ere_line {
    margin: 45px 0 40px 0;
    padding: 0;
    border-top: 1px solid #d5d5d5;
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
	 					alert("이미 카트에 담겨있는 BOOK입니다. ");
	 					return;
	 				}else{
	 					frm.action = "cartInsert";
	 					frm.submit();		
	 				}
	 			}
	 		}); 			
		});
		
		$(".likeItBtn").on("click", function(){
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
						alert("추천완료");
					}
				}
			});
			
		});
		
		// 버킷 클릭시
		$(".bucketBtn").on("click", function(){
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
						alert("해당 BOOK은 이미 버킷BOOK으로 등록되어있습니다.");
						return false;
					}else{
						alert("정상적으로 등록되었습니다.");
					}
				}
			});
		});
		
		// 버킷 클릭시
		$("#bookLendForm").on("click", function(){
			var bookId = $("#bookId").val();
			
			$.ajax({
				url : 'lendInsertOne' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					console.log(res);
					if(res.result == "03"){
						alert("해당 BOOK은 이미 버킷BOOK으로 등록되어있습니다.");
						return false;
					}else if(res.result == "04"){
						alert("세션종료되었습니다. 다시 로그인 후 진행해주세요.");
						return false;
					}else{
						alert("정상적으로 등록되었습니다.");
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
																				.append( $("<div class='stars'>")))
																	.append( $("<p>").html(res.breplyContents) )
																	.append( $("<div class='pull-right'>")
																					.append($("<a href='#' class='breplyChildInsert'>").html("댓글"))
																					.append($("<a href='#' class='breplyUpdate'>").html("수정"))
																					.append($("<a href='#' class='breplyDelete'>").html("삭제"))
																					.append($("<a href='#' class='breplySave hidden' >").html("저장"))
																					.append($("<a href='#' class='breplyCancel hidden'>").html("취소"))
																					
																	))));
 					for( var i = 1 ; i <= 5 ; i++ ){
						if(res.breplyStar  >= i ){
							$("#comments-list").last().find(".stars").append($("<i class='star fas fa-star' data-flag='true'>").data("no", i ) );	
						}else{
							$("#comments-list").last().find(".stars").append($("<i class='star far fa-star' data-flag='false'>").data("no", i ) );
						}
					} 
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
			
			var area = $(this).closest(".media-body").find("p");
			
			$.ajax({
				url : 'breplyUpdate' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId, breplyId : breplyId , breplyContents : breplyContents , breplyStar : breplyStar }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					area.html("");
					area.html(breplyContents);
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
			$(this).closest(".media").after( $("#childBox") );
		});
		
		// 자식댓글 작성중 취소 클릭시 
		$("#comments-list").on("click", function(){
			event.preventDefault();
			$("#childBox").addClass("hidden");			
		});
		
		// 자식댓글 저장 클릭시 
		$("#comments-list").on("click", function(){
			// breplyChildInsert
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
						<li><a href="bookReviewList">BOOK REVIEW</a></li>						
					</ul>
				</div>
				<div class="col-sm-9">
					<div class="row">
						<div class="col-sm-4" >
							<img width="240" height="270" style="margin-top:20px" src="/prj/fileUp${book.bookCoverPath}${book.bookCover}">
						</div>
						<div class="col-sm-8 bInfo">
							<div style="margin-left:20px">	
								<h1 class="display-5 fw-bold">${book.bookNm}</h1>
								<h3>${book.bookPublCo} ( ${book.bookWriter} )</h3>
							</div>
							<div>
							<br/>
							<br/>
							<br/>
							<br/>
							
							</div>	
							<c:if test="${auth eq 'U' || auth eq 'A'}">
								<div class="pull-right">
									<button type="button" class="button" id="bookCartForm"><span>카트담기 </span></button>
									<button type="button" class="button" id="bookLendForm"><span>BOOK대여 </span></button>
									<button class="bucketBtn" ><i class="	fa fa-bookmark-o"></i></button>
									<button class="bucketBtn" ><i class="fa fa-thumbs-o-up"></i></button>							
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
								<div class="col-md-3"><a id="breplyInsert" class="btn ebookBtn pull-right" href="#">&nbsp;&nbsp;등 록&nbsp;&nbsp; </a></div>
								<textarea name="breplyContentsNew" class="form-control" id="breplyContentsNew" placeholder="댓글을 남겨주세요 *" required data-validation-required-message="Please enter a message."></textarea>
							</form>
						</div>
					</div>			
				
					<h3>댓 글</h3>
					
					<div id="comments-list" class="col-sm-8 col-sm-offset-2 gap wow">
						<div class="mt60 mb50 single-section-title">
						    <h3>Comments</h3>
						</div>				
						<c:forEach var="reply" items="${replys}">
							<c:if test="${reply.breplyClass != '1'}">
								<div class="media">
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
												<a href="#" class="breplyChildInsert" data-breplyid="${reply.breplyId}">댓글쓰기</a>
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
													<div class="media" style="background-color: yellow;margin-left:50px">
														
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
																	<a href="#" class="breplyChildInsert" data-breplyid="${childReply.breplyId}">댓글쓰기</a>
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

<div id="childBox" class="media hidden ">
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
				<a href="#" class="breplySave" class="hidden">저장</a>
				<a href="#" class="breplyCancel" class="hidden">취소</a>
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