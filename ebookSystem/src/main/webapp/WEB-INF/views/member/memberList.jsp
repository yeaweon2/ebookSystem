<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

//  휴면회원 해제
	function sleepMember() { 
		var memberArr = [];
		
		$("input[name=checkMember]:checked").each(function() { 
			memberArr.push($(this).val());
		});

		$.ajax({
			url : 'memberCdChange' ,
			type : 'post',
			dataType: 'json',
			data : { memArr : memberArr },
			success: function(res){
				alert("success");
				},
			error : function(rej){
				console.log(rej);
			}
		});
		alert("휴면해제완료");
	}
</script>
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
								<th>회원구분</th>
								<th>전화번호</th>
								<th>Email</th>
								<th>생년월일</th>
								<th>마일리지</th>
								<th>회원상태</th>
								<th>회원등록일자</th>
								<th>회원수정일자</th>
							</tr>
							<c:forEach items="${lists}" var="member" varStatus="status">
								<tr>
									<td><input type="checkbox" id="member${status.index}" name="checkMember" value="${member.memberId}"></td>
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
							</c:forEach>
						</table>
					</div>
					<div>
						<button type="submit" onclick="sleepMember()" class="btn btn-outline-primary">휴면해제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>