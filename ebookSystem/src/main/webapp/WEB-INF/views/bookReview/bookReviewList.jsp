<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책리뷰</title>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>책리뷰</h2><br><br>
				</div>
				
			</div>
	<div>
		<input type="button" onclick="location.href='reviewInsertForm'" class="btn-primary pull-right"  value="글쓰기">
	</div>
	<!--  책리뷰 조회 -->
	<c:forEach var="list" items="${lists }">
		<div class="reviewList">
			<table class="table">
				<tr>
					<td>${list.reviewTitle}</td>
					<td align="right"><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></td>
				</tr>
				<tr>
					<td colspan="2">${list.reviewContents}</td>
				</tr>
			</table>
		</div>
	</c:forEach>
	</div>
	</div>
</body>
</html>