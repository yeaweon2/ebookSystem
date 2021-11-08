<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	 
	 $("#noticeInsertBtn").on("click", function(){
			frm.submit(); 
	 });
	 
 }); 
  </script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>공지사항</h2><br><br>
				</div>
			</div>
				<form id="frm" name="frm" action="noticeInsert" method="post" enctype = "multipart/form-data">
				<div>
					<label for="title">제목</label>
					<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" placeholder="제목을 입력해 주세요">
				</div>
				
				<div>
					<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div>
					<input type="file" multiple name="attchFile" id="attchFile" class="attchFile" >
				</div>
				
				
					<input id="noticeInsertBtn" type="button" value="등록" class="btn-primary">
					<input type="button" onclick="location.href='noticeList'" value="취소" class="btn">
				</form>		
		</div>
	</div>
</body>
</html>