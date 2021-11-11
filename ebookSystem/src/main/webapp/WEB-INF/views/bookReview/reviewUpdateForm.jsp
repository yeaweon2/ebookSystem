<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		//썸머노트높이
		$('.summernote').summernote({
			height : 300
		});
		
		//책리뷰입력
		$('#reviewUpdateBtn').on('click', function() {
			bookfrm.submit();
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
			<form id="bookfrm" name="bookfrm" action="bookReviewUpdate" method="post">
			<table class="table">
				<tr>
					<td><input type="text" class="form-control" name="reviewTitle" id="reviewTitle" value ="${list.reviewTitle }" ></td>
				</tr>
				<tr>
					<td>
						<div id="bookLendList">
						<img width='80px' height='120px' src='${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}'>
						${list.bookNm}(${list.bookWriter })
						</div></td>
				</tr>
				<tr>
					<td><textarea name="reviewContents" id="summernote" class="summernote" >${list.reviewContents }" </textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="reviewAtchNm" placeholder="파일 선택" multiple></td>
					
			</table>
			<input type="button" id="reviewUpdateBtn" value="수정" class="ebookBtn">
			<input type="button" onclick="location.href='bookReviewList'" value="취소" class="ebookBtn">
			<input type="hidden" id="reviewId" name="reviewId" value="${list.reviewId}">
			</form>	
	</div>
</div>
</body>
</html>