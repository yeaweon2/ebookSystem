<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h2>공지사항</h2><br><br>
				</div>
			</div>
			<div style="width : 800px">
				<form id="frm" name="frm" action="noticeInsert" method="post">
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
					<input type="submit" value="등록" class="btn-primary">
					<input type="button" onclick="location.href='noticeList'" value="취소" class="btn-danger">
				</form>		
			</div>
		</div>
	</div>
</body>
</html>