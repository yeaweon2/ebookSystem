<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>회원목록 리스트</h2>
				</div>
			</div>
			<div>
				<div class="row">
					<div class="package text-center bg-white">
						<br />
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>선택</th>
								<th>ID</th>
								<th>회원명</th>
								<th>닉네임</th>
								<th>구분코드</th>
								<th>전화번호</th>
								<th>마일리지</th>
								<th>상태코드</th>
								<th>매니저승인여부</th>
								<th>회원등록일자</th>
								<th>회원수정일자</th>
							</tr>
							<c:forEach items="${lists}" var="member">
								<tr>
									<td><input type="checkbox">									
									<td>${member.memberId }</td>
									<td>${member.memberNm }</td>
									<td>${member.memberNicknm }</td>
									<td>${member.memberFlCd }</td>
									<td>${member.memberTel }</td>
									<td>${member.memberMile }</td>
									<td>${member.memberStCd }</td>
									<td>${member.managerCnfmYn }</td>
									<td>${member.insDt }</td>
									<td>${member.udtDt }</td>
								</tr>
							</c:forEach>
						</table>
					</div></br>
					<div>
						<button type="submit">휴면해제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>