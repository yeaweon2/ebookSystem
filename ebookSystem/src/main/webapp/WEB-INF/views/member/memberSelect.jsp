<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세보기</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>회원상세보기</h2>
				</div>
			</div>
			<div>
				<div class="row">
					<div class="package text-center bg-white">
						<br />
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>ID</th>
								<th>회원명</th>
								<th>닉네임</th>
								<th>회원구분</th>
								<th>전화번호</th>
								<th>Email</th>
								<th>생년월일</th>
								<th>마일리지</th>
								<th>회원상태</th>
								<th>회원등록일자</th>
								<th>회원수정일자</th>
							</tr>
								<tr>
									<td>${member.memberId }</td>
									<td>${member.memberNm }</td>
									<td>${member.memberNicknm }</td>
									<td>${member.memberFlNm }</td>
									<td>${member.memberTel }</td>
									<td>${member.memberEmail }</td>
									<td>${member.memberBirth }</td>
									<td>${member.memberMile }</td>
									<td>${member.memberStNm }</td>
									<td>${member.insDt }</td>
									<td>${member.udtDt }</td>
								</tr>
						</table>
					</div>
				</div>
				<input type="button" onclick="location.href='memberSelectList'" value="목록보기" class="btn btn-success"> 
				<input type="button" onclick="MemberEdit('U')" value="수정" class="btn btn-primary">
				<input type="button" onclick="MemberEdit('D')" value="삭제" class="btn btn-danger">
			</div>
		</div>
	</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
	</form>
</body>
</html>