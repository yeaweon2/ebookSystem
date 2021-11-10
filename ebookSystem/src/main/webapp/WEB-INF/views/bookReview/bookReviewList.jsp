<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책리뷰</title>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
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
			
			<div class="row">
  				<div class="column">
    				<div class="card">
    				<img width='60px' height='90px' src='${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}'>
     					 <h3>${list.reviewTitle}</h3>
      					 <p><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></p>
     					 <p>${list.reviewContents}</p>
    				</div>
  				</div>
  			</div>
		</div>
	</c:forEach>
	</div>
	</div>
</body>
</html>