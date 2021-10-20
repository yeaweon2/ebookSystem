<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
				<form id="frm" name="frm" action="noticeInsert" method="post">
					<div>
						<table class="table table-hover">
							<tr>
								<th width="100">제 목</th>
								<td width="200"><input type="text" name="cmmntyTitle" id="cmmntyTitle" size="50"></td>
							</tr>

							<tr>
								<th width="100">내 용</th>
								<td width="200"><textarea rows="6" cols="52" name="cmmntyContents"></textarea></td>
							</tr>

							<tr>
								<th width="100">파일업로드</th>
								<td width="200"><input type="file" name="cmmntyAtchNm" id="cmmntyAtchNm"></td>
							</tr>
						</table>
						<br>

						<div>
							<input type="submit" value="등록">
							<input type="button" onclick="location.href='noticeList'" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>