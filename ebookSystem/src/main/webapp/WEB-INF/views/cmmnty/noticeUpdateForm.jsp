<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
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
	 
	 $('#noticeUpdateBtn').on("click", function(){
		 if()//첨부파일 다르면...삭제하고 추가해야함..
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
					<h2>글쓰기</h2><br><br>
				</div>
			</div>
				<form id="frm" name="frm" action="noticeUpdate" method="post" enctype="multipart/form-data">
					<div>
						<label for="title">제목</label>
						<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" value ="${notice.cmmntyTitle }" >
					</div>
					
					<div>
						<label for="content">내용</label>
					<textarea name="cmmntyContents" id="summernote" class="summernote">${notice.cmmntyContents }</textarea>
					</div>
					<div>
					<div>
					<c:if test="${not empty notice.cmmntyAtchNm }">
					첨부파일 : <a href="#">${notice.cmmntyAtchNm}</a>
					</c:if>
					
					<input type="file" multiple="multiple" name="attchFile" id="attchFile" class="attchFile"> 
					
					</div>
					</div><br>	
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
							<input id="noticeUpdateBtn" type="button" value="수정" class="btn-primary">
							<input type="button" onclick="location.href='noticeList'" value="취소" class="btn-danger">
				</form>
			</div>
		</div>
</body>
</html>