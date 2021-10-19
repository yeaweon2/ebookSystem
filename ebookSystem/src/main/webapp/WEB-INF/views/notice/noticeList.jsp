<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항</h1>
<table class="table table-hover">
<thead>
	<tr>
	<th>작성자</th>
	<th>제목</th>
	<th>번호</th>
	<th>작성일</th>
	<th>조회수</th>
	</tr>
</thead>

<c:forEach var="notice" items="${notices }">
	<tbody>
	<tr>
		<td>${notice.cmmntyId}</td>
		<td>${notice.cmmntyTitle}</td>
		<td>${notice.cmmntyWriter}</td>
		<td>${notice.insDt}</td>
		<td>${notice.cmmntyHit}</td>
	</tr>
	</tbody>
</c:forEach>


</table>

</body>
</html>