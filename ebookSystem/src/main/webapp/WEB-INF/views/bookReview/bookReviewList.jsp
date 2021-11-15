<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -10px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>
<script>
	function goList(p) {
		location.href="bookReviewList?page="+p
	}

$(function() {
	//클릭시 글상세조회
	$("table").on("click", "tr", function() {
		event.stopPropagation();
		var id = $(this).closest("tr").data("id");
		$("#reviewId").val(id);

		frm.submit();
	})
	
	//더보기 클릭시 글상세조회
	$(".card").on("click", "#more", function(){
		var id = $(this).data("id");
		$("#reviewId").val(id);
		frm.submit();
		
	});
});
</script>
</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2><img width="40px" height="40px" src="resources/img/books.png"> 책리뷰</h2><br><br>
			
				</div>
				
			</div>

	<!--  베스트 리뷰조회 -->
		<div class="reviewList">
			<div class="row">
			<h3>베스트 리뷰</h3>
  			<c:forEach var="list" items="${bests }">
  				<div class="col-md-3">
    				<div class="card">
    					<img width='80px' height='120px' src='${pageContext.request.contextPath}/fileUp${list.bookCoverPath}${list.bookCover}'>
    					<h4>${list.bookNm}</h4>
     					<h5>${list.reviewTitle}</h5>
     					<p>작성자: ${list.reviewWriter}</p>
     					<p>추천수: ${list.reviewLikeit }</p>
      					<p><fmt:formatDate pattern="yyyy-MM-dd"  value="${list.insDt}"/></p>
     					<button type="button" id="more" data-id="${list.reviewId }" >더보기</button>
    				</div>
  				</div>
			</c:forEach>  				
  			</div>
		</div>
	<!-- 리뷰 리스트--><br><br>
		<div class="reviewList">
			<input type="button" onclick="location.href='reviewInsertForm'" class="btn-primary pull-right"  value="글쓰기">
			<table class="table table-hover" style="cursor:pointer" >
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="rv" items="${review }">
							<tr class="reviewSelect" data-id="${rv.reviewId}">
								<td>${rv.reviewNo}</td>
								<td>${rv.reviewTitle} <c:if test="${rv.reviewReplyCnt ne '0'}">(${rv.reviewReplyCnt})</c:if></td>
								<td>${rv.reviewWriter}</td>
								<td>${rv.reviewHit}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${rv.insDt}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<my:paging jsFunc="goList" paging="${paging}" />
		</div>
		<form action="reviewSelectList" method="post" id="frm">
		<input type="hidden" id="reviewId" name="reviewId">
		</form>
	</div>
	</div>
</body>
</html>