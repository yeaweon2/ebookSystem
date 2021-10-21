<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		//체크박스 이벤트중지
		$(".chkTd").on("click", function() {
			event.stopPropagation();
			if ($(event.target).find("#chkInput").prop('checked') == false) {
				$(event.target).find("#chkInput").prop('checked', true);
			} else {
				$(event.target).find("#chkInput").prop('checked', false);
			}
		});
		
		//체크박스 선택삭제
		
	});

</script>
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
							<th class="header" width="30"><input type="checkbox" id="checkall" /></th>
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
								<td  class="chkTd" width="30"><input id="chkInput" name="rowcheck" type="checkbox"></td>
								<td>${notice.cmmntyNo}</td>
								<td>${notice.cmmntyTitle}</td>
								<td>${notice.cmmntyWriter}</td>
								<td>${notice.insDt}</td>
								<td>${notice.cmmntyHit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id="Insert" name="Insert" onclick="location.href='noticeInsertForm'" class="btn btn-primary">글쓰기</button>
				<button type="button" id="del" name="del" class="btn btn-danger">삭제</button>
			</div>
		</div>
	</div>
	<form action="noticeSelectList" method="post" id="frm">
		<input type="hidden" id="cmmntyId" name="cmmntyId">
	</form>
</body>
</html>