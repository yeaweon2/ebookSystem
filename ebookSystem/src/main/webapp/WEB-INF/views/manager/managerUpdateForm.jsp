<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저정보수정</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

//	 회원구분 선택
	$("#memberFlCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#memberFlCd option:selected").text();
	 $("#memberFlCd option:selected").val();
	})

//	 회원상태 선택
	 $("#memberStCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#memberStCd option:selected").text();
	 $("#memberStCd option:selected").val();
	})
	
//	 매니저승인여부 선택	  
	 $("#mcnfmStCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#mcnfmStCd option:selected").text();
	 var mcnfmStCd = $("#mcnfmStCd option:selected").val();
	 })
	
//	 계약구분 선택
	 $("#mcnfmCntrFlCdY").on("change", function(){
	 console.log("==============");
	 alert( $(this).val());
	 $("#mcnfmCntrFlNm option:selected").text();
	 $("#mcnfmCntrFlNm option:selected").val();
	})
	
})

//버튼 클릭 시 수정 & 취소
function ManagerEdit(str) {
	if(str == 'U') {
		if(confirm('수정하시겠습니까?') == true) {
			console.log($("#memberFlCdY option:selected").val());
			console.log($("#memberStCdY option:selected").val());
			console.log($("#mcnfmStCdY option:selected").val());
			console.log($("#mcnfmCntrFlCdY option:selected").val());
			 $("#memberFlCd").val($("#memberFlCdY option:selected").val());
			 $("#memberStCd").val($("#memberStCdY option:selected").val());
			 $("#mcnfmStCd").val($("#mcnfmStCdY option:selected").val());
			 $("#mcnfmCntrFlNm").val($("#mcnfmCntrFlNmY option:selected").val());
			 
			frm.action = "managerUpdate";
			frm.submit();
		} else {
			return false;
		}
	}else {
		if(confirm('수정을 취소하시겠습니까?') == true) {
			frm.action = "managerList";
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
					<h2>매니저 등록정보 수정</h2>
				</div>
			</div>
			<div>
				<form id="frm" name="frm" method="post" >
				<div align="center">
					<div class="package text-center bg-white"><br>
						<table id="lcodeTb" class="table table-hover">
							<tr data-id="${managerConfirm.memberId}">
								<th><label for="memberId">회원ID</label></th>
									<td>
									<input type="text" id="memberId" name="memberId" value="${member.memberId}">
									</td>
								<th><label for="memberFlNm">회원구분</label></th>
									<td>
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
							</tr>
							<tr>
								<th><label for="mcnfmStCd">매니저승인여부</label></th>
								<td>
									<select id="mcnfmStCdY" class="form-control form-control-sm">
										<c:if test="${managerConfirm.mcnfmStCd eq '01'}">
											<option value="01" selected>처리중</option>
											<option value="02" >승인</option>
											<option value="03" >보류</option>
										</c:if>
										<c:if test="${managerConfirm.mcnfmStCd eq '02'}">
											<option value="01" >처리중</option>
											<option value="02" selected>승인</option>
											<option value="03" >보류</option>
										</c:if>
										<c:if test="${managerConfirm.mcnfmStCd eq '03'}">
											<option value="01" >처리중</option>
											<option value="02" >승인</option>
											<option value="03" selected>보류</option>
										</c:if>
									</select>
								</td>
								<th><label for="mcnfmId">승인ID</label></th>
									<td><input type="text" id="mcnfmId" name="mcnfmId" value="${member.mcnfmId}"></td>
								<th><label for="mcnfmCnfmr">승인자ID</label></th>
									<td><input type="text" id="mcnfmCnfmr" name="mcnfmCnfmr" value="${managerConfirm.mcnfmCnfmr}"></td>
							</tr>
							<tr>
								<th><label for="mcnfmReqDt">승인신청일자</label></th>
									<td><input type="text" id="mcnfmReqDt" name="mcnfmReqDt" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmReqDt }" />" readonly="readonly"></td>
								<th><label for="mcnfmCnfmDt">승인처리일자</label></th>
									<td><input type="date" id="mcnfmCnfmDt" name="mcnfmCnfmDt"value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmCnfmDt }" />"></td>
							</tr>	
							<tr>
								<th><label for="mcnfmCoNm">상호명</label></th>
									<td><input type="text" id="mcnfmCoNm" name="mcnfmCoNm" value="${managerConfirm.mcnfmCoNm}" ></td>
								<th><label for="mcnfmRpspr">대표자명</label></th>
									<td><input type="text" id="mcnfmRpspr" name="mcnfmRpspr" value="${managerConfirm.mcnfmRpspr}"></td>
								<th><label for="memberNm">회원명</label></th>
									<td><input type="text" id="memberNm" name="memberNm" value="${member.memberNm}"></td>
							</tr>
							<tr>
								<th><label for="mcnfmStNm">계약구분</label></th>
								<td>
									<select id="mcnfmCntrFlNmY" class="form-control form-control-sm">
										<c:if test="${managerConfirm.mcnfmCntrFlNm  eq '01'}">
											<option value="01" selected>1개월</option>
											<option value="02" >6개월</option>
											<option value="03" >12개월</option>
										</c:if>
										<c:if test="${managerConfirm.mcnfmCntrFlNm eq '02'}">
											<option value="01" >1개월</option>
											<option value="02" selected>6개월</option>
											<option value="03" >12개월</option>
										</c:if>
										<c:if test="${managerConfirm.mcnfmCntrFlNm eq '03'}">
											<option value="01" >1개월</option>
											<option value="02" >6개월</option>
											<option value="03" selected>12개월</option>
										</c:if>
									</select>
								</td>
								<th><label for="mcnfmCntrSdt">계약시작일자</label></th>
									<td><input type="text" id="mcnfmCntrSdt" name="mcnfmCntrSdt" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmCntrSdt }" />" readonly="readonly"></td>
								<th><label for="mcnfmCntrEdt">계약종료일자</label></th>
									<td><input type="date" id="mcnfmCntrEdt" name="mcnfmCntrEdt"value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmCntrEdt }" />"></td>
							</tr>
							<tr>
								<th><label for="memberTel">전화번호</label></th>
									<td><input type="text" id="memberTel" name="memberTel" value="${member.memberTel}"></td>
								<th><label for="memberEmail">Email</label></th>
									<td><input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}"></td>
								<th><label for="memberPhoneVld">휴대폰인증</label></th>
									<td><input type="text" id="memberPhoneVld" name="memberPhoneVld" value="${member.memberPhoneVld}"></td>
							</tr>
							<tr>
								<th><label for="memberProfileNm">프로필파일</label></th>
								<td><input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control">
								<div id="imgContainer" style="display:none"><img id="bookCoverImg" width="150" height="170"></div>
								</td>
								<td><button id="FileForm" type="button" class="btn btn-primary"> 파일등록 </button></td> 
								<th></th>
								<th><label for="memberProfilePath">프로필파일경로</label></th>
									<td><input type="text" id="memberProfilePath" name="memberProfilePath" value="${member.memberProfilePath}"></td>
							</tr>
							<tr>
								<th><label for="insDt">회원등록일자</label></th>
									<td><input type="text" id="insDt" name="insDt" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />" readonly="readonly"></td>
								<th><label for="udtDt">회원수정일자</label></th>
									<td><input type="date" id="udtDt" name="udtDt"value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" />"></td>
							</tr>
						</table>
					</div>
					<div>
      				<input type="hidden" id="memberFlCd" name="memberFlCd" value="${member.memberFlCd}">
      				<input type="hidden" id="memberStCd" name="memberStCd" value="${member.memberStCd}">
      				<input type="hidden" id="mcnfmStCd" name="mcnfmStCd" value="${managerConfirm.mcnfmStCd}">
      				<input type="hidden" id="mcnfmCntrFlNm" name="mcnfmCntrFlNm" value="${managerConfirm.mcnfmCntrFlNm}">
      				<input type="hidden" id="memberPw" name="memberPw" value="${member.memberPw}">
      				<input type="hidden" id="memberNicknm" name="memberNicknm" value="${member.memberNicknm}">
					</div> 
					
				</div><br><br>
				<div align="center">
					<input type="button" onclick="ManagerEdit('U')" value="수정"  class="btn btn-default get" style="background-color: #90EE90">
					<input type="button" onclick="ManagerEdit('D')" value="취소" class="btn btn-default get" style="background-color: #FF6347">
				</div><br><br><br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>