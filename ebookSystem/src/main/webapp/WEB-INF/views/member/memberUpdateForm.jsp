<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

//버튼 클릭 시 수정 & 취소
function MemberEdit(str) {
	if(str == 'U') {
		if(confirm('수정하시겠습니까?') == true) {
			frm.action = "memberUpdate";
			frm.submit();
		} else {
			return false;
		}
	}else {
		if(confirm('수정을 취소하시겠습니까?') == true) {
			frm.action = "memberList";
		} else {
			return false;
		}
	}
}
</script>
</head>
<body>
	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>회원정보 수정</h2>
				</div>
			</div>
			<div>
				<div class="col-lg-12 mb-12 mb-lg-0" align="center">
				<form id="frm" name="frm" method="post" >
					<div class="package text-center bg-white"><br />
						<table id="lcodeTb" class="table table-hover">
							
								<tr id="lcodeTr" data-id="${member.memberId}">
									<th><label for="memberFlNm">회원구분</label><th>
									<td>
										<select id="memberFlCd" class="form-control form-control-sm">
											<c:if test="${member.memberFlCd eq 'U'}">
												<option value="U" selected>일반회원</option>
												<option value="M" >매니저</option>
												<option value="A" >관리자</option>
											</c:if>
											<c:if test="${member.memberFlCd eq 'M'}">
												<option value="U" >일반회원</option>
												<option value="M" selected>매니저</option>
												<option value="A" >관리자</option>
											</c:if>
											<c:if test="${member.memberFlCd eq 'A'}">
												<option value="U" >일반회원</option>
												<option value="M" >매니저</option>
												<option value="A" selected>관리자</option>
											</c:if>
										</select>
									<th><label for="memberNm">회원명</label></th>
									<td><input type="text" id="memberNm" name="memberNm" value="${member.memberNm}" ></td>
									<th><label for="memberNicknm">닉네임</label></th>
									<td><input type="text" id="memberNicknm" name="memberNicknm" value="${member.memberNicknm}"></td>
								</tr>
								<tr>
									<th><label for="managerCnfmYn">매니저승인여부</label><th>
									<td>
										<select id="managerCnfmYn" class="form-control form-control-sm">
											<c:if test="${member.managerCnfmYn eq 'N'}">
												<option value="N" selected>처리중</option>
												<option value="Y" >승인</option>
											</c:if>
											<c:if test="${member.managerCnfmYn eq 'Y'}">
												<option value="N" >처리중</option>
												<option value="Y" selected>승인</option>
											</c:if>
										</select>
									<th><label for="mcnfmId">승인번호</label></th>
									<td><input type="text" id="mcnfmId" name="mcnfmId" value="${member.mcnfmId}"></td>
									<th><label for="memberStNm">회원상태</label></th>
									<td>
										<select id="memberStCd" class="form-control form-control-sm">
											<c:if test="${member.memberStCd eq '01'}">
												<option value="01" selected>사용중</option>
												<option value="02" >휴면</option>
												<option value="03" >탈퇴</option>
											</c:if>
											<c:if test="${member.memberStCd eq '02'}">
												<option value="01" >사용중</option>
												<option value="02" selected>휴면</option>
												<option value="03" >탈퇴</option>
											</c:if>
											<c:if test="${member.memberStCd eq '03'}">
												<option value="01" >사용중</option>
												<option value="02" >휴면</option>
												<option value="03" selected>탈퇴</option>
											</c:if>
										</select>
									</td>
								</tr>
								<tr>
									<th><label for="memberId">ID</label><th>
									<td><input type="text" id="memberId" name="memberId" value="${member.memberId}"></td>
									<th><label for="memberPw">비밀번호</label></th>
									<td><input type="password" id="memberPw" name="memberPw" value="${member.memberPw}"></td>
									<th><label for="memberGen">성별</label></th>
									<td>
										<select id="memberGen" class="form-control form-control-sm">
											<c:if test="${member.memberGen eq 'M'}">
												<option value="M" selected>남자</option>
												<option value="W" >여자</option>
											</c:if>
											<c:if test="${member.memberGen eq 'W'}">
												<option value="M" >남자</option>
												<option value="W" selected>여자</option>
											</c:if>
										</select>
								</tr>
								<tr>
									<th><label for="memberBirth">생년월일</label><th>
									<td><input type="text" id="memberBirth" name="memberBirth" value="${member.memberBirth}"></td>
									<th><label for="memberTel">전화번호</label></th>
									<td><input type="text" id="memberTel" name="memberTel" value="${member.memberTel}"></td>
									<th><label for="memberEmail">Email</label></th>
									<td><input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}"></td>
								</tr>
								<tr>
									<th><label for="memberPhoneVld">휴대폰인증</label><th>
									<td><input type="text" id="memberPhoneVld" name="memberPhoneVld" value="${member.memberPhoneVld}"></td>
									<th><label for="memberMile">마일리지</label></th>
									<td><input type="text" id="memberMile" name="memberMile" value="${member.memberMile}"></td>
									<th><label for="memberLikeFld">관심분야</label></th>
									<td><input type="text" id="memberLikeFld" name="memberLikeFld" value="${member.memberLikeFld}"></td>
								</tr>
								<tr>
									<th><label for="memberProfileNm">프로필파일</label><th>
									<td>
									<input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control">
									
									<div id="imgContainer" style="display:none"><img id="bookCoverImg" width="150" height="170"></div>
									</td>
									<td><button id="bookFileForm" type="button" class="btn btn-primary"> 파일등록 </button></td> 
									<th><label for="memberProfilePath">프로필파일경로</label></th>
									<td><input type="text" id="memberProfilePath" name="memberProfilePath" value="${member.memberProfilePath}"></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th><label for="insDt">회원등록일자</label><th>
									<td><input type="text" id="insDt" name="insDt" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />" readonly="readonly"></td>
									<th><label for="udtDt">회원수정일자</label></th>
									<td><input type="date" id="udtDt" name="udtDt"value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />"></td>
									<th></th>
									<td></td>
								</tr>
						</table>
					</div>
				</form>
				</div><br><br>
				<div align="center">
					<input type="submit" onclick="MemberEdit('U')" value="수정" class="btn btn-primary">
					<input type="button" onclick="MemberEdit('D')" value="취소" class="btn btn-danger">
				</div><br><br><br>
			</div>
		</div>
	</div>
</body>
</html>