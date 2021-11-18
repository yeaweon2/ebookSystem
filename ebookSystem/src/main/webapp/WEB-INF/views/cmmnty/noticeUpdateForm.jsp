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
		
		 frm.submit();
	 })
	 
	// 파일 수정버튼 클릭시 
	$("#AtchBtn").on("click", function(){
		$("#attchFile").click();
	});	
	 
	 $("#attchFile").on("change", function(){
		 $("#fileName").text(document.getElementById('attchFile').files[0].name);
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
						<input type="text" class="form-control" name="cmmntyTitle" id="cmmntyTitle" value ="${notice.cmmntyTitle }" >
					</div>
					
					<div>
					<textarea name="cmmntyContents" id="summernote" class="summernote">${notice.cmmntyContents }</textarea>
					</div>
					<div>
					<div class="fileNm">
					<button type="button" id="AtchBtn" class="AtchBtn ebookBtn-sm">파일등록</button>
					<input type="file" multiple id="attchFile" name="attchFile" value="파일조회" class="form-control ebookBtn-sm" style="display: none">
					<c:if test="${not empty notice.cmmntyAtchNm }">
					첨부파일 : <a id="fileName" href="#" >${notice.cmmntyAtchNm}</a>
					</c:if>
					</div>
					</div><br>	
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
							<input type="hidden" id="cmmntyAtchNm" name="cmmntyAtchNm" value="${notice.cmmntyAtchNm}">
							<input id="noticeUpdateBtn" type="button" value="수정" class="ebookBtn-sm">
							<input type="button" onclick="location.href='noticeList'" value="취소" class="ebookBtn-sm">
				</form>
			</div>
		</div>
</body>
</html>