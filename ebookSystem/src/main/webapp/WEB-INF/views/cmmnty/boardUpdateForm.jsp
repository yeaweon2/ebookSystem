<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

 <script>
 $(document).ready(function() { 
	 $('.summernote').summernote({
			 height: 300
	 }); 
	 
	 $('#boardUpdateBtn').on('click', function(){
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
					<h2>자유게시판</h2><br><br>
				</div>
			</div>
	
				<form id="frm" name="frm" action="boardUpdate" method="post">
					<div>
						<label for="title">제목</label>
						<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" value ="${board.cmmntyTitle}" >
					</div>
					
					<div>
						<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote">${board.cmmntyContents }</textarea>
					</div>
					<div >
						<input type="file" class="form-control" multiple id="cmmntyAtchNm" value ="${board.cmmntyAtchNm }">
					</div><br>	
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${board.cmmntyId}">
							<input type="button" id="boardUpdateBtn" value="수정" class="ebookBtn-sm">
							<input type="button" onclick="location.href='boardList'" value="취소" class="ebookBtn-sm">
				</form>
			</div>
		</div>

</body>
</html>