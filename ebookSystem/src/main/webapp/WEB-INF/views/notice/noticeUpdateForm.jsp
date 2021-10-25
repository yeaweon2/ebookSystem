<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

</head>
<body>
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>글쓰기</h2>
				</div>
			</div>
			<div>
				<form id="frm" name="frm" action="noticeUpdate" method="post">
					<div>
						<table class="table">
							<tr>
								<th>제 목</th>
								<td><input type="text" name="cmmntyTitle" id="cmmntyTitle" value ="${notice.cmmntyTitle }" size="50"></td>
							</tr>

							<tr>
								<th>내 용</th>
								<td><textarea rows="15" cols="150" name="cmmntyContents">${notice.cmmntyContents }</textarea></td>
							</tr>
							<script>
								CKEDITOR.replace('cmmntyContents');
							</script>

							<tr>
								<th>파일업로드</th>
								<td><input type="file" name="cmmntyAtchNm" id="cmmntyAtchNm" value ="${notice.cmmntyAtchNm }"></td>
							</tr>
						</table>
						<br>

						<div>
							<input type="hidden" id="cmmntyId" name="cmmntyId" value="${notice.cmmntyId}">
							<input type="submit" value="수정" class="btn btn-primary">
							<input type="button" onclick="location.href='noticeList'" value="취소" class="btn btn-danger">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>