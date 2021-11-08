<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
//	회원구분 선택
	$("#memberFlCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#memberFlCd option:selected").text();
	 $("#memberFlCd option:selected").val();
	})

//	매니저 승인여부 선택	  
	 $("#managerCnfmYnY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#managerCnfmYn option:selected").text();
	 $("#managerCnfmYn option:selected").val();
	}) 
	
//	회원상태 선택
	 $("#memberStCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#memberStCd option:selected").text();
	 $("#memberStCd option:selected").val();
	})
	
//	회원성별 선택
	 $("#memberGenY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#memberGen option:selected").text();
	 $("#memberGen option:selected").val();
	})
	
})

//버튼 클릭 시 수정 & 취소
function MemberEdit(str) {
	if(str == 'U') {
		if(confirm('수정하시겠습니까?') == true) {
			 console.log($("#memberFlCdY option:selected").val());
			 
			 $("#memberFlCd").val($("#memberFlCdY option:selected").val());
			 $("#managerCnfmYn").val($("#managerCnfmYnY option:selected").val());
			 $("#memberStCd").val($("#memberStCdY option:selected").val());
			 $("#memberGen").val($("#memberGenY option:selected").val());
			 
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
				<form id="frm" name="frm" method="post" >
				<div class="col-lg-12 mb-12 mb-lg-0" align="center">
					<div class="package text-center bg-white"><br />
						<table id="lcodeTb" class="table table-hover">
							
								<tr id="lcodeTr" data-id="${member.memberId}">
									<th><label for="memberFlNm">회원구분</label><th>
										<c:if test="${auth ne 'A'}">
											<td><input type="text" id="memberFlCd1" name="memberFlCd1" value="${member.memberFlCd}" readonly="readonly"></td>
										</c:if>
										<c:if test="${auth eq 'A'}">
										<td class="lcodememFlNm">
											<select id="memberFlCdY" class="form-control form-control-sm">
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
										</td>
										</c:if>
									<th><label for="memberNm">회원명</label></th>
									<td><input type="text" id="memberNm" name="memberNm" value="${member.memberNm}" ></td>
									<th><label for="memberNicknm">닉네임</label></th>
									<td><input type="text" id="memberNicknm" name="memberNicknm" value="${member.memberNicknm}"></td>
								</tr>
								<tr>
									<c:if test="${auth ne 'U'}">
									<th><label for="managerCnfmYn">매니저승인여부</label><th>
									<td>
										<select id="managerCnfmYnY" class="form-control form-control-sm">
											<c:if test="${member.managerCnfmYn eq 'N'}">
												<option value="N" selected>처리중</option>
												<option value="Y" >승인</option>
											</c:if>
											<c:if test="${member.managerCnfmYn eq 'Y'}">
												<option value="N" >처리중</option>
												<option value="Y" selected>승인</option>
											</c:if>
										</select>
									</td>
									<th><label for="mcnfmId">승인번호</label></th>
									<td><input type="text" id="mcnfmId" name="mcnfmId" value="${member.mcnfmId}"></td>
									</c:if>
									<c:if test="${auth eq 'A'}">
									<th><label for="memberStNm">회원상태</label></th>
									<td>
										<select id="memberStCdY" class="form-control form-control-sm">
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
									</c:if>
								</tr>
								<tr>
									<th><label for="memberId">ID</label><th>
									<td><input type="text" id="memberId" name="memberId" value="${member.memberId}"></td>
									<th><label for="memberPw">비밀번호</label></th>
									<td><input type="password" id="memberPw" name="memberPw" value="${member.memberPw}"></td>
									<th><label for="memberGen">성별</label></th>
										<c:if test="${auth ne 'A'}">
									<td><input type="password" id="memberPw" name="memberPw" value="${member.memberPw}"></td>
										</c:if>
										<c:if test="${auth eq 'A'}">
										<td>
										<select id="memberGenY" class="form-control form-control-sm">
											<c:if test="${member.memberGen eq 'M'}">
												<option value="M" selected>남자</option>
												<option value="W" >여자</option>
											</c:if>
											<c:if test="${member.memberGen eq 'W'}">
												<option value="M" >남자</option>
												<option value="W" selected>여자</option>
											</c:if>
										</select>
										</td>
										</c:if>
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
									<th><label for="memberSubYn">월정액 결제여부</label><th>
									<td><input type="text" id="memberSubYn" name="memberSubYn" value="${member.memberSubYn}"></td>
										<c:if test="${auth ne 'M'}">
									<th><label for="memberMile">마일리지</label></th>
									<td><input type="text" id="memberMile" name="memberMile" value="${member.memberMile}"></td>
									<th><label for="memberLikeFld">관심분야</label></th>
									<td><input type="text" id="memberLikeFld" name="memberLikeFld" value="${member.memberLikeFld}"></td>
										</c:if>
								</tr>
								<tr>
									<th><label for="memberProfileNm">프로필파일</label><th>
									<td>
									<input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control">
									
									<div id="imgContainer" style="display:none"><img id="bookCoverImg" width="150" height="170"></div>
									</td>
									<td><button id="FileForm" type="button" class="btn btn-primary"> 파일등록 </button></td> 
									<th><label for="memberProfilePath">프로필파일경로</label></th>
									<td><input type="text" id="memberProfilePath" name="memberProfilePath" value="${member.memberProfilePath}"></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<c:if test="${auth eq 'A'}">
									<th><label for="insDt">회원등록일자</label><th>
									<td><input type="text" id="insDt" name="insDt" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />" readonly="readonly"></td>
									<th><label for="udtDt">회원수정일자</label></th>
									<td><input type="date" id="udtDt" name="udtDt"value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />"></td>
									</c:if>
									<th></th>
									<td></td>
								</tr>
						</table>
					</div>
					<div>
      				<input type="hidden" id="memberFlCd" name="memberFlCd" value="${member.memberFlCd}">
      				<input type="hidden" id="managerCnfmYn" name="managerCnfmYn" value="${member.managerCnfmYn}">
      				<input type="hidden" id="memberStCd" name="memberStCd" value="${member.memberStCd}">
      				<input type="hidden" id="memberGen" name="memberGen" value="${member.memberGen}">
					</div> 
					
				</div><br><br>
				<div align="center">
					<input type="button" onclick="MemberEdit('U')" value="수정" class="btn btn-default get" style="background-color: #90EE90">
					<input type="button" onclick="MemberEdit('D')" value="취소" class="btn btn-default get" style="background-color: #FF6347">
				</div><br><br><br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>