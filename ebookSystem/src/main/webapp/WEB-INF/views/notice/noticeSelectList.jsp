<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<script>
 
	//버튼클릭시 글수정,삭제
	function NoticeEdit(str){
		if(str == 'U'){
			frm.action = "noticeUpdateForm";
						
		} else{
			if(confirm('삭제하시겠습니까?')==true ){
				frm.action = "noticeDelete";
				}else{
					return false;
				}
		}
		frm.submit();
	}
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>상세페이지</h2>
				</div>
			</div>
			<div>


				<table class="table">
					<tr>
						<th colspan="6">${notice.cmmntyTitle}</th>
					</tr>
					<tr>
						<th>작성자:</th>
						<td>${notice.cmmntyWriter}</td>
						<th>작성일자:</th>
						<td>${notice.insDt}</td>
						<th>조회수:</th>
						<td>${notice.cmmntyHit}</td>
					</tr>

					<tr>
						<td colspan="6" height="400"><textarea rows="15" cols="150" readonly="readonly">${notice.cmmntyContents}</textarea></td>
					</tr>
				
				</table>
				<input type="button" onclick="location.href='noticeList'" value="목록보기" class="btn btn-success"> 
				<input type="button" onclick="NoticeEdit('U')" value="수정" class="btn btn-primary"> 
				<input type="button" onclick="NoticeEdit('D')" value="삭제" class="btn btn-danger">
			</div>
		</div>
	</div>
	<form id="frm" name="frm" method="post">
	<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
	</form>
</body>
</html>