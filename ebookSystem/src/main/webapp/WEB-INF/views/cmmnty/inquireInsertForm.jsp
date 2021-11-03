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
	 
 }); 
  </script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>1:1문의게시판</h2><br><br>
				</div>
			</div>
			<div style="width : 800px">
				<form id="frm" name="frm" action="inquireInsert" method="post">
				<div>
					<label for="title">제목</label>
					<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" placeholder="제목을 입력해 주세요">
				</div>
				<div>
					<label for="reg_id">작성자 </label>	
					<input type="text" class="form-control" name="cmmntyWriter" id="cmmntyWriter" value="${sessionScope.id}" readonly="readonly" >
					</div>
				<div>
					<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
					<input type="file" name="uploadfile" placeholder="파일 선택" multiple>
					<input type="submit" value="등록" class="btn-primary">
					<input type="button" onclick="location.href='inquireList'" value="취소" class="btn-danger">
				</form>		
			</div>
		</div>
	</div>
</body>
</html>