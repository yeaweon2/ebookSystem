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


				<table class="table table-hover">
					<c:forEach var="notice" items="${notices }">
						<tr>
							<th>${notice.cmmntyTitle}</th>
						</tr>
						<tr>
							<th>작성자:${notice.cmmntyWriter} 작성일자:${insDt}
								조회수:${notice.cmmntyHit}</th>
						</tr>
						<tr>
							<td>${notice.cmmntyContents}</td>
						</tr>
					</c:forEach>
				</table>
				<input type="button" onclick="location.href='noticeList'" value="뒤로가기">
				<input type="button" onclick="'" value="수정">
				<input type="button" onclick="'" value="삭제">
			</div>
		</div>
	</div>
</body>
</html>