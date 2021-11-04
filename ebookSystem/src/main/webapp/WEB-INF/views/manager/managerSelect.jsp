<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매니저회원 상세보기</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script>

//	버튼 클릭 시 수정페이지로 이동 & 삭제
	function ManagerEdit(str) {
		if(str == 'U') {
			frm.action = "managerUpdateForm";
		}else {
			if(confirm('회원을 삭제하시겠습니까?') == true) {
				frm.action = "memberDelete";
			} else {
				return false;
			} 
		}
		frm.submit();
	}
</script>

</head>
<body>
	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>매니저회원 상세보기</h2>
				</div>
			</div>
			<div>
				<div class="col-lg-12 mb-12 mb-lg-0" align="center">
					<div class="package text-center bg-white"><br />
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>회원구분</th>
								<td>${member.memberFlNm }</td>
								<th>회원상태</th>
								<td>${member.memberStNm }</td>
								<th>승인상태</th>
								<td>${managerConfirm.mcnfmStNm }</td>
								<th>승인ID</th>
								<td>${member.mcnfmId }</td>
							</tr>
							<tr>
								<th>회원ID</th>
								<td>${managerConfirm.memberId }</td>
								<th>상호명</th>
								<td>${managerConfirm.mcnfmCoNm }</td>
								<th>대표자명</th>
								<td>${managerConfirm.mcnfmRpspr }</td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th>승인자ID</th>
								<td>${managerConfirm.mcnfmCnfmr}</td>
								<th>승인신청일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmReqDt }" /></td>
								<th>승인처리일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${managerConfirm.mcnfmCnfmDt }" /></td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th>계약시작일자</th>
								<td>${managerConfirm.mcnfmCntrSdt }</td>
								<th>계약종료일자</th>
								<td>${managerConfirm.mcnfmCntrEdt }</td>
								<th>계약구분</th>
								<td>${managerConfirm.mcnfmCntrFlNm }</td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th>회원명</th>
								<td>${member.memberNm }</td>
								<th>전화번호</th>
								<td>${member.memberTel }</td>
								<th>Email</th>
								<td>${member.memberEmail }</td>
								<th>휴대폰인증</th>
								<td>${member.memberPhoneVld }</td>
							</tr>
							<tr>
								<th>프로필파일명</th>
								<td>${member.memberProfileNm }</td>							
								<th>프로필파일경로</th>
								<td>${member.memberProfilePath }</td>
								<th>회원등록일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" /></td>
								<th>회원수정일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.udtDt }" /></td>
							</tr>
						</table>
					</div>
				</div><br><br>
				<div align="center">
					<input type="button" onclick="location.href='managerList'" value="목록보기" class="btn btn-default get" style="background-color: #1E90FF">&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="ManagerEdit('U')" value="수정" class="btn btn-default get" style="background-color: #90EE90"> &nbsp;&nbsp;&nbsp;
					<input type="button" onclick="ManagerEdit('D')" value="삭제" class="btn btn-default get" style="background-color: #FF6347">
				</div><br><br><br>
			</div>
		</div>
	</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="memberId" name="memberId" value="${managerConfirm.memberId}">
	</form>
</body>
</html>