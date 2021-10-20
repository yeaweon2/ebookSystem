<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<script type="text/javascript">
$(function(){
	$("table").on("click", "tr", function(){ 
		var id = $(this).closest("tr").data("id");
		$("#bookId").val(id);
		console.log()
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
	          		<h2>BOOK 목록</h2>
	        	</div>
			</div>	
			<div class="row">
				<table class="table table-hover" style="cursor: pointer;">
					<tr>
						<th></th>
						<th>No</th>
						<th>구분</th>
						<th>등록일자</th> 
						<th>BOOK명</th>
						<th>출판사</th>
						<th>저자</th>
						<th>금액</th>
						<th>할인율</th>
						<th>승인여부</th>
						<th>사용여부</th>
						<th>조회수</th>
						<th>매니저</th>
					</tr>
					<c:forEach var="list" items="${lists}" >
						<tr data-id="${list.bookId}">
							<td><input type="checkbox"></td>
							<td>${list.bookNo}</td>
							<td>${list.bookFlCd}</td>
							<td>${list.insDt}</td>
							<td>${list.bookNm}</td>
							<td>${list.bookPublCo}</td>
							<td>${list.bookWriter}</td>
							<td>${list.bookAmt}</td>
							<td>${list.bookDiscnt}</td>
							<td>${list.bookCnfmYn}</td>
							<td>${list.bookUseyn}</td>
							<td>${list.bookHit}</td>
							<td>${list.memberId}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="row">
				<button class="btn">수 정</button>
				<button class="btn">승 인</button>
			</div>
		</div>
	</div>
	
<form action="bookUpdateForm" method="post" id="frm">
	<input type="hidden" id="bookId" name="bookId" >
</form>	
</body>
</html>
