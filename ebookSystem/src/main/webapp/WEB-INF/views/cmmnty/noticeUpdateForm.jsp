<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
					<h2>글쓰기</h2><br><br><br><br>
				</div>
			</div>
			<div style="width : 800px">
				<form id="frm" name="frm" action="noticeUpdate" method="post">
					<div>
						<label for="title">제목</label>
						<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" value ="${notice.cmmntyTitle }" >
					</div>
					<div>
						<label for="reg_id">작성자</label>
						<input type="text" class="form-control" name="cmmntyWriter" id="cmmntyWriter" value="${notice.cmmntyWriter}" readonly="readonly">
					</div>
					<div>
						<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote">${notice.cmmntyContents }</textarea>
					</div>
					<div >
						<label for="reg_id">파일첨부</label>
						<input type="file" class="form-control" multiple id="cmmntyAtchNm" value ="${notice.cmmntyAtchNm }">
					</div><br>	
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
							<input type="submit" value="수정" class="btn-primary">
							<input type="button" onclick="location.href='noticeList'" value="취소" class="btn-danger">
				</form>
			</div>
		</div>
	</div>
</body>
</html>