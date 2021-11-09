<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.modal-backdrop {
	z-index: -1;
}
</style>
<style>

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 600px;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script>
	$(function() {
		//대여리스트 가져오기
		var modal = document.getElementById("myModal");
		var span = document.getElementsByClassName("close")[0];
			
		$(".myBtn").on("click", function() {
			modal.style.display = "block";
			
			//대여리스트가져오기
			$.ajax({
				url: 'reviewLendList',
				contentType : 'application/json',
				method : 'GET',
				dataType: 'json',
				success: function(data){
					$("#lendList").empty();
					
					$("#lendList").append($("<div>").html("리뷰할 책을 선택해주세요!"))
									
									$.each(data, function(idx,item){
										$("#lendList").append($("<table class='chk'>")
															  .append($("<tr>")
															  			.append($("<td class='bkimg'>").append($("<img width='60px' height='90px' src='${pageContext.request.contextPath}/fileUp"+ item.bookCoverPath + item.bookCover+ "'>")))
															  			.append($("<td class='bknm'>").html(item.bookNm))
															  			.append($("<td class='bkw'>").html(item.bookWriter))
															  ).data("bookid", item.bookId)
													 )//table끝
													  
									})//each끝
									
					$('#lendList').on('dblclick',".chk", function(){ //부모한테걸어서 아직생성되지않은 테이블에 이벤트를 준다, div생성해서 append하고 모달을 닫기한다.
						console.log($(this).data("bookid"));
						var imgsrc = $(this).find(".bkimg").children().attr('src')
						
						$('#bookLendList').append( $("<img width='50px' height='70px'>").attr("src", imgsrc))
										  .append($(this).find(".bknm").html())
										  .append($(this).find(".bkw").html());
					})
				}//function끝
			})//대여리스트끝
			
			

		})
		
		span.onclick = function() {
	 	 modal.style.display = "none";
		}
		window.onclick = function(event) {
	 	 if (event.target == modal) {
		   modal.style.display = "none";
	    }
	}
		
		//썸머노트높이
		$('.summernote').summernote({
			height : 300
		});
		
		//책리뷰입력
		$("#reviewInputBtn").on('click', function() {
			frm.submit();
		})
	});
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>책리뷰작성</h2>
					<br> <br>
				</div>
			</div>
			<div id="lend">
			<table class="table">
				<tr>
					<td><input type="text" class="form-control" name="rewviewTitle" id="reviewTitle" placeholder="제목을 입력해 주세요"></td>
				</tr>
				<tr>
					<td>
						<div id="bookLendList">
						<button class="myBtn pull-right btn-primary">내가 대여한 책목록</button>
						</div></td>
				</tr>
				<tr>
					<td><textarea name="reviewContents" id="summernote" class="summernote" placeholder="내용을 입력해 주세요"></textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="reviewAtchNm" placeholder="파일 선택" multiple></td>
					
			</table>
			<input id="reviewInputBtn" value="등록" class="btn-primary ">
			<input type="button" onclick="location.href='bookReviewList'" value="취소" class="btn-danger">
		</div>
	</div>
</div>
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<form id="frm" name="frm" action="" method="post">
				
				<div id="lendList">
					
				</div>
				<input type="hidden" name="reviewId" id="reviewId" value="${lists.reviewId}">
			</form>
		</div>
	</div>
</body>
</html>