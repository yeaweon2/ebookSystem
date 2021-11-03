<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세보기</title>

<script src="resources/js/form-validation.js"></script>

<script>
//	버튼 클릭 시 수정페이지로 이동 & 삭제
	function MemberEdit(str) {
		if(str == 'U') {
			frm.action = "memberUpdateForm";
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
					<h2>회원상세보기</h2>
				</div>
			</div>
			<div>
				<div class="col-lg-12 mb-12 mb-lg-0" align="center">
					<div class="package text-center bg-white"><br />
					<form>
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th>회원구분</th>
								<td>${member.memberFlNm }</td>
							</tr>
							<tr>
								<th>회원명</th>
								<td>${member.memberNm }</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>${member.memberNicknm }</td>
							</tr>
							<tr>
								<th>ID</th>
								<td>${member.memberId }</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>${member.memberPw }</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>${member.memberGen }</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>${member.memberBirth }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${member.memberTel }</td>
							</tr>
							<tr>
								<th>Email</th>
								<td>${member.memberEmail }</td>
							</tr>
							<tr>
								<th>프로필파일명</th>
								<td>${member.memberProfileNm }</td>	
							</tr>
							<tr>						
								<th>프로필파일경로</th>
								<td>${member.memberProfilePath }</td>
							</tr>
								<c:if test="${auth ne 'M' }">
							<tr>
								<th>휴대폰인증코드</th>
								<td>${member.memberPhoneVld }</td>
							</tr>
							<tr>
								<th>월정액 결제금액</th>
								<td>${sub.subspAmt }</td>
							</tr>
							<tr>
								<th>월정액 시작일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${sub.subspSdt }" /></td>
							</tr>
							<tr>
								<th>월정액 종료일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${sub.subspEdt }" /></td>
							</tr>
							<tr>
								<th>마일리지</th>
								<td>${member.memberMile }</td>
							</tr>
							<tr>
								<th>관심분야</th>
								<td>${member.memberLikeFld }</td>
							</tr>
								</c:if>
								<c:if test="${auth eq 'A' }">
							<tr>
								<th>월정액ID</th>
								<td>${sub.subspId }</td>
							</tr>
							<tr>
								<th>월정액 결제방법</th>
								<td>${sub.subspPayNm }</td>
							</tr>
								</c:if>
								<c:if test="${auth eq 'M'}">
							<tr>
								<th>승인여부</th>
								<td>${member.managerCnfmYn }</td>
							</tr>
							<tr>
								<th>승인번호</th>
								<td>${member.mcnfmId }</td>
							</tr>
								</c:if>
								<c:if test="${auth eq 'A'}">
							<tr>
								<th>회원등록일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.insDt }" /></td>
							</tr>
							<tr>
								<th>회원수정일자</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${member.udtDt }" /></td>
							</tr>
							<tr>
								<th>회원상태</th>
								<td>${member.memberStNm }</td>  
							</tr>
								</c:if>
						</table>
						</form>
					</div>
				</div><br><br>
				<div align="center">
					<input type="button" onclick="location.href='memberList'" value="목록보기" class="btn btn-default get" style="background-color: #1E90FF"> 
					<input type="button" onclick="MemberEdit('U')" value="수정"  class="btn btn-default get" style="background-color: #90EE90">
					<input type="button" onclick="MemberEdit('D')" value="삭제" class="btn btn-default get" style="background-color: #FF6347">
				</div><br><br><br>
			</div>
		</div>
	</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
	</form>
</body>
</html>