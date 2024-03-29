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
 }); 
 </script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>1:1문의</h2><br><br>
				</div>
			</div>
			<div>
				<form id="frm" name="frm" action="inquireUpdate" method="post">
					<div>
						<label for="title">제목</label>
						<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" value ="${inquires.cmmntyTitle}" >
					</div>
					<div>
						<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote" cols="13"	>${inquires.cmmntyContents }</textarea>
					</div>
					<div >
						<label for="reg_id">파일첨부</label>
						<input type="file" class="form-control" multiple id="cmmntyAtchNm" value ="${inquires.cmmntyAtchNm }">
					</div><br>	
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${inquires.cmmntyId}">
							<input type="submit" value="수정" class="ebookBtn-sm">
							<input type="button" onclick="location.href='inquireList'" value="취소" class="ebookBtn-sm">
				</form>
			</div>
		</div>
	</div>
</body>
</html>