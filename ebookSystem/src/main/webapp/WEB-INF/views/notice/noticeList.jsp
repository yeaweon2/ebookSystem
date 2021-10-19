<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>공지사항</h2>
				</div>
			</div>
			<div>

				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${notices }">

							<tr
								onclick="location.href='noticeSelectList?cmmntyId=${notice.cmmntyId}'">
								<td><input type="checkbox" id="checkbox" name="checkbox"></td>
								<td>${notice.cmmntyNo}</td>
								<td>${notice.cmmntyTitle}</td>
								<td>${notice.cmmntyWriter}</td>
								<td>${notice.insDt}</td>
								<td>${notice.cmmntyHit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id="write" name="write"
					onclick="location.href='noticeWriterForm'">글쓰기</button>
				<button type="button" id="cancel" name="cancel" onclick="">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>