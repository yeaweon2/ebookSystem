<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내글관리 페이지</title>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>내글관리</h2>
					<br> <br>
				</div>
				<div id="">
					<div>
						<label>자유게시판</label>

						<table class="table table-hover" style="cursor:pointer" >
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="list" items="${lists }">
							<tr class="noticeSelect" data-id="${list.cmmntyId}">
								<td>${list.cmmntyNo}</td>
								<td>${list.cmmntyTitle}(${notice.cmmntyReplyCnt})</td>
								<td>${list.cmmntyWriter}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></td>
								<td>${list.cmmntyHit}</td>
							</tr>
						</c:forEach>
					
					</tbody>
				</table>
					</div>

					<div>
						<label>1:1문의</label>
					</div>

					<div>
						<label>책리뷰</label>
					</div>

					<div>
						<label>내가쓴댓글</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>