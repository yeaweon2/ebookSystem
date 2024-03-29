<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버킷BOOK</title>
<style type="text/css">

input:-ms-input-placeholder { color:#a8a8a8; }
input:-webkit-input-placeholder { color:#a8a8a8; }
input:-moz-input-placeholder { color:#a8a8a8; }

#searchDiv {
	height:50px;
	width:400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
}

#searchInput {
	font-size:16px;
	width:325px;
	padding:10px;
	outline:none;
	float:left;
	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	margin-top:0px;
}

#searchBtn {
	width:50px;
	height:100%;
	boder:0px;
	background:#0c2e8a;
	outline:none;
	float:right;
	color:#ffffff;
}

#srchBookNm {

text-align: left;
font-size: 15px;
font-weight: bold;

}

#bucketList tr:nth-child(even) {
	<!--background-color: #e2e6f3; -->
}


#bucketList tr td {
    border-top-style: none;
    border-left-style: none;
    border-right-style: none;
    border-bottom-style: none;
    border:none;
    border-left:0px;
    border-right:0px;
    border-top:0px;
    border-bottom:0px;
    align-self: center;
    
}

</style>
<script type="text/javascript">
	$(function(){
		
		$("#searchInput").on("keyup", function(){
			
			if( $("#searchInput").val() != "" ){
				var txt = $("#searchInput").val();
				$.ajax({
					url : 'bucketSearchList' ,
					method : 'POST' ,
					data : JSON.stringify({ bookNm : txt }),
					contentType : 'application/json',					
					dataType : 'json',
					success : function(res){
						console.log(res);
						
						$("#bucketSrchList").empty();
						if( res.length < 1 ){
							if( $("#searchInput").val() != "" ){
								$("#bucketSrchList").append( $("<tr>").append( $("<td>").html("해당 자료가 존재하지 않습니다.")) );
								return false;
							}else{
								$("#bucketSrchList").empty();
								return false;
									
							}
						}
						
						$("#bucketSrchList").empty();
						$.each(res,function(idx,item){
							var tr = $("<tr id='srchTr' data-bookid='" + item.bookId + "'>").append( $("<td width='50px'>").append("<img width='40' height='60' src='/prj/fileUp" + item.bookCoverPath + item.bookCover + "'>") )
									 		  .append( $("<td width='300px' id='srchBookNm' style='vertical-align:middle'>").html(item.bookNm) )
									 		  .append( $("<td width='50px' id='srchInsert' >").append( $("<i  class='fa fa-plus-square-o' style='font-size:25px'>")));
							$("#bucketSrchList").append(tr);
						});
					}
				});	
			}else{
				$("#bucketSrchList").empty();
				return false;
			}
		});
		
		$("#searchBtn").on("click", function(){
			$("#searchInput").keyup();
		});
		
		
		//버킷삭제
		$("#bucketList").on("click", "#bucketDel", function(){
			event.stopPropagation();
			var item = $(this);
			var bucketId = $(this).closest("td").data("bucketid"); 
			var bookId = $(this).closest("td").data("bookid");
			
 			$.ajax({
				url : 'bucketDelete' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId , bucketId : bucketId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){
					item.closest("tr").empty();
				}
			});	 
		});
		
		// 버킷완료
		$("#bucketList").on("click", "#bucketDone",function(){
			event.stopPropagation();
			
			var item = $(this);
			var bucketId = item.closest("td").data("bucketid"); 
			var bookId = item.closest("td").data("bookid");
			
			$.ajax({
				url : 'bucketDone' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId , bucketId : bucketId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){					
					
					Swal.fire({ 
					   icon: 'success',  
					   title: '버킷완료!!',  
					   text: '정상적으로 등록되었습니다.',  
					});
					
					item.siblings(".doneYn").html("완료일자 : " + res.bucket.bucketDoneDt).css("color", "red");
					item.addClass("hidden");
					item.siblings("#bucketDoneCancel").removeClass("hidden");
					
					item.closest("tr").find("td:first")
							.append( $("<div style='position: relative;left:50px; top: -130px;height:50px;width:50px'>")
											.append($("<img height='150px' width='150px' src='resources/assets/img/buketDone.png'>")));
					
					
				}
			});	
		});
		
		// 버킷완료취소
		$("#bucketList").on("click", "#bucketDoneCancel",function(){
			event.stopPropagation();
			
			var item = $(this);
			var bucketId = item.closest("td").data("bucketid"); 
			var bookId = item.closest("td").data("bookid");
			
			$.ajax({
				url : 'bucketDoneCancel' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId , bucketId : bucketId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){					
					console.log(res);	
					item.siblings(".doneYn").html("");
					item.addClass("hidden");
					item.siblings("#bucketDone").removeClass("hidden");
					
					item.closest("tr").find("td:first").find("div:last").remove();
				}
			});	
		});		
		
		
		$("#bucketSrchList").on("click", "#srchInsert",function(){
			event.stopPropagation();
			
			var bookId = $(this).closest("tr").data("bookid");
			
			$.ajax({
				url : 'bucketInsert' ,
				method : 'POST' ,
				data : JSON.stringify({ bookId : bookId }),
				contentType : 'application/json',					
				dataType : 'json',
				success : function(res){					
					if(res.result == "중복"){
						Swal.fire({ 
						   icon: 'error',  
						   title: '버킷BOOK 중복',  
						   text: '이미 버킷BOOK으로 등록되어 있습니다.',  
						});
						
						return false;
					}else{
						Swal.fire({ 
							   icon: 'success',  
							   title: '버킷BOOK 등록',  
							   text: '정상적으로 처리되었습니다.',  
							});
						
						$("#bucketList").append(
								$("<tr>").append($("<td style='width:20%'>")
													.append( $("<div style='position: relative;'>")
																.append( $("<img class='media-object' height='210' width='160'>")
																			.attr("src", "/prj/fileUp" + res.bucket.bookCoverPath + res.bucket.bookCover) )))	
										 .append($("<td id='contentsTd" + res.bucket.bucketId + " '>")
												 	.append($("<div>").append($("<h4>").append($("<a href='#' class='bookClick'>").data("bookid", res.bucket.bookId).html(res.bucket.bucketOrd + ". " + res.bucket.bookNm)))
												 					  .append($("<h5>").html(res.bucket.bookPublCo + " / " + res.bucket.bookWriter ))
												 					  .append($("<button id='bucketDel' class='btn ebookBtn-sm pull-right'>").append($("<i class='fa fa-trash-o'>").html("지우기") ) )
												 					  .append($("<button id='bucketDone' class='btn ebookBtn-sm pull-right'>").append($("<i class='fa fa-check-square-o'>").html("버킷완료") ) )
												 					  .append($("<button id='bucketDone' class='btn ebookBtn-sm pull-right hidden'>").append($("<i class='fa fa-check-square-o'>").html("버킷취소") ) )
												 	
												 						))
							);
						
						
							
							$("#bucketList").find("#contentsTd" + res.bucket.bucketId ).data("bookid", res.bucket.bookId); 
							$("#bucketList").find("#contentsTd" + res.bucket.bucketId ).data("bucketid", res.bucket.bucketId);
							$("#bucketSrchList").empty();
					}
					 
					
					
				}
			});	
		});
		
		$("#bucketList").on("click", ".bookClick",function(){
			event.preventDefault();
			$("#frm").find("#bookId").val($(this).data("bookid"));
			frm.submit();
		});
	});
	
</script>
</head>
<body>
<section>
	<div class="section-inner">		
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="section-header">
		          		<h2><i class="fa fa-search-plus" style="font-size:24px"></i> BOOK 검색</h2>
		          		<p class="lead">검색 후 <i class="fa fa-plus-square-o"></i> 버튼을 클릭하면 버킷완료!!</p>
		        	</div>					
					<div class="row" style='margin-bottom: 30px;'>
						<div id="searchDiv" > 
							<input id="searchInput" size="40px" type="text" placeholder="검색어 입력">
							<button id="searchBtn" ><i style="font-size:28px" class="fa">&#xf002;</i></button>
						</div>
						<div class="">
							<table id="bucketSrchList" class="searchDiv pointer table-hover">
							</table>
						</div>
					</div>	
				</div>
				<div class="box col-sm-6">
					<h2 class="title text-center"><i class="fa fa-quote-left" style="font-size:24px"></i>${nicknm}<i class="fa fa-quote-right" style="font-size:24px"></i> 님의 버킷 BOOK LIST</h2>
					<table id="bucketList" class="table">
						<c:forEach var="bucket" items="${lists}">	
							<tr>
								<td style="width:20%">
									<div style="position: relative;"> 
										<img class="media-object" height="190" width="140" src="/prj/fileUp${bucket.bookCoverPath}${bucket.bookCover}" alt="${bookNm}">
									</div>
									<c:if test="${ not empty bucket.bucketDoneDt }">
										<div style="position: relative;left:50px; top: -130px;height:50px;width:50px">
											<img height="150px" width="150px" src="resources/assets/img/buketDone.png">
										</div>
									</c:if>
								</td>
								<td id="contentsTd" data-bookid="${bucket.bookId}" data-bucketid="${bucket.bucketId}">
									<div>
										<h4><a href="#" class="bookClick" data-bookid="${bucket.bookId}">${bucket.bucketNo}. ${bucket.bookNm}</a></h4>
										<h5>${bucket.bookPublCo} / ${bucket.bookWriter}</h5>
										<div class="doneYn" style="color:red">
											<c:if test="${ not empty bucket.bucketDoneDt }">
												완료일자 : ${bucket.bucketDoneDt}
											</c:if>
										</div>
										<button id="bucketDel" class="btn ebookBtn-sm pull-right"><i class="fa fa-trash-o"></i> 지우기</button>
										<c:if test="${ not empty bucket.bucketDoneDt }">
											<button id="bucketDone" class="btn ebookBtn-sm pull-right hidden"><i class="fa fa-check-square-o"></i> 버킷완료</button>
											<button id="bucketDoneCancel" class="btn ebookBtn-sm pull-right "><i class="fa fa-check-square-o"></i> 버킷취소</button>
										</c:if>
										<c:if test="${ empty bucket.bucketDoneDt }">
											<button id="bucketDone" class="btn ebookBtn-sm pull-right"><i class="fa fa-check-square-o"></i> 버킷완료</button>
											<button id="bucketDoneCancel" class="btn ebookBtn-sm pull-right hidden"><i class="fa fa-check-square-o"></i> 버킷취소</button>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table> 				
				</div>
			</div>
		</div>
	</div>
<form action="bookDetail" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>	
</section>		
</body>
</html>