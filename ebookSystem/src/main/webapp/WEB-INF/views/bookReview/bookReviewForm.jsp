<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
 $(document).ready(function() { 
	 $('.summernote').summernote({
			 height: 300
	 }); 
	 
 }); 
  </script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>책리뷰작성</h2>
					<br>
					<br>
				</div>
			</div>
			<div style="width : 800px">
			<table>
				<tr>제목</tr>
				<tr>	
					<td colspan="2"><input type="text" class="form-control" name="rewviewTitle" id="reviewTitle" placeholder="제목을 입력해 주세요"></td>
				</tr>
				<tr><td colspan="3">
					<form name="form1" id="form1" action="/action_page.php">
					모달창이나와서 대여목록이 나와야함 ㄴ
					</form>
  					</td>
  				</tr>
  				<tr><td colspan="3">작성자</td></tr>
				<tr>	
					<td colspan="3"><input type="text" class="form-control" name="reviewWriter" id="reviewWriter" value="${sessionScope.id}" readonly="readonly" >
					</td>	
				</tr>
				<tr>
					<td colspan="3">
					<textarea name="reviewContents" id="summernote" class="summernote" placeholder="내용을 입력해 주세요" ></textarea>
					</td>
				</tr>
				<tr>
					<td>
					<input type="file" name="reviewAtchNm" placeholder="파일 선택" multiple>
					<td>
				</td>			
			</table>	
					<input type="button" onclick="location.href='bookreviewList'" value="취소" class="btn-danger pull-right">
					<input type="submit" value="등록" class="btn-primary pull-right">
			</div>
		</div>
	</div>
	
		<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			 <span class="close">&times;</span>
			 <form id="frm" name="frm" action="faqUpdate" method="post">
				<div>
					<label for="title">대여목록</label>
				</div>
				<div>
					도서이미지 : 도서제목 : 도서저자 : 완료일자
				</div>
				<input type="button" onclick="location.href='faqList'" value="취소" class="btn-danger">
				<input type="hidden" name="reviewId" id="reviewId" value="${list.reviewId}">
			</form>
				</div>
		</div>
</body>
</html>