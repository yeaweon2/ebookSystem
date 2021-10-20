<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
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


				<table >
					<c:forEach var="notice" items="${notices }">
					
						<tr>
							<th colspan="6">${notice.cmmntyTitle}</th>
						</tr>
						<tr >
							<th>작성자:</th>
							<td>${notice.cmmntyWriter}</td>
							<th>작성일자:</th>
							<td>${notice.insDt}</td>
							<th>조회수:</th>
							<td>${notice.cmmntyHit}</td>
						</tr>
					
						<tr>
							<td colspan="6" height="400">${notice.cmmntyContents}</td>
						</tr>
					</c:forEach>
				</table>
				<input type="button" onclick="location.href='noticeList'" value="목록보기" class="btn btn-success">
				<input type="button" onclick="" value="수정" class="btn btn-primary">
				<input type="button" onclick="" value="삭제" class="btn btn-danger" onclick="del">
			</div>
		</div>
	</div>
</body>
</html>