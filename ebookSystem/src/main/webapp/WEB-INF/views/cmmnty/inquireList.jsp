<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script>
	$(function() {
		//클릭시 글상세조회
		$("table").on("click", "tr", function() {
			event.stopPropagation();
			var id = $(this).closest("tr").data("id");
			$("#cmmntyId").val(id);

			frm.submit();
		})

	});

</script>
</head>
<body>
		<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>1:1 문의</h2><br><br>
				</div>
				
			</div>
			<div style="width : 800px;">
				<table class="table table-hover" style="cursor:pointer" >
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="inquire" items="${inquires }"> 
							<tr class="inquireSelect" data-id="${inquire.cmmntyId}">
								<td>${inquire.cmmntyNo}</td>
								<td>${inquire.cmmntyTitle}(${inquire.cmmntyReplyCnt})</td>
								<td>${inquire.cmmntyWriter}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${inquire.insDt}"/></td>
								<td>${inquire.cmmntyHit}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<c:if test="${not empty id}">
				<button type="button" onclick="location.href='inquireInsertForm'" class="btn-primary">글쓰기</button>
				</c:if>
			</div>
		</div>
	</div>
	<form action="inquireSelectList" method="post" id="frm">
		<input type="hidden" id="cmmntyId" name="cmmntyId">
	</form>
</body>
</html>