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
<h1>공지사항목록</h1>
<div>
<c:forEach var="notice" items="${notices }">
		${notice.cmmntyId } : ${notice.cmmntyTitle }:${notice.cmmntyWriter }:${notice.cmmntyHit }<br>
		</c:forEach>
		</div>
</body>
</html>