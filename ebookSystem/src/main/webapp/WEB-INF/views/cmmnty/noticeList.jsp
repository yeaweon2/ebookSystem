<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
					<h2>공지사항</h2><br><br><br><br>
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
						<c:forEach var="notice" items="${notices }">
							<tr class="noticeSelect" data-id="${notice.cmmntyId}">
								<td>${notice.cmmntyNo}</td>
								<td>${notice.cmmntyTitle}(${notice.cmmntyReplyCnt})</td>
								<td>${notice.cmmntyWriter}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${notice.insDt}"/></td>
								<td>${notice.cmmntyHit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${id eq 'admin'}">
				<button type="button" onclick="location.href='noticeInsertForm'" class="btn-primary">글쓰기</button>
				</c:if>
			</div>
		</div>
	</div>
	<form action="noticeSelectList" method="post" id="frm">
		<input type="hidden" id="cmmntyId" name="cmmntyId">
	</form>
</body>
</html>