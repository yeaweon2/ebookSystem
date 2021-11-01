<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

//관심분야선택

$("input[name=memberLikeFld]:checked").each(function() { 
	var test = $(this).val(); 
})


//버튼 클릭 시 수정 & 취소
function myPageUpdate(str) {
	if(str == 'U') {
		if(confirm('수정하시겠습니까?') == true) {
			console.log("--------");
			frm.action = "myPageUpdate";
			$("#frm").submit();  
		} else {
			return false;
		}
	}else {
		if(confirm('수정을 취소하시겠습니까?') == true) {
			frm.action = "myPage";
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
					<h2>마이페이지</h2>
				</div>
				<div><p  style="color: #ac2925; margin-top: 30px">*표시된 항목만 수정 가능합니다.</p></div>
			</div>
			<div>
				<div class="col-lg-12 mb-12 mb-lg-0" align="center">
					<div class="package text-center bg-white"><br />
					<form action="#" method="post" id="frm" name="frm">
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th><label for="memberFlNm">회원구분</label></th>
									<td><input type="text" id="memberFlNm" name="memberFlNm" value="${member.memberFlNm}" readonly="readonly"></td>
								<th><label for="memberId">ID</label></th>
									<td><input type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly"></td>
							</tr>
							<tr>
								<th><label for="memberNm">회원명</label></th>
									<td><input type="text" id="memberNm" name="memberNm" value="${member.memberNm}" readonly="readonly"></td>
								<th><label for="memberGen">성별</label></th>
									<td><input type="text" id="memberGen" name="memberGen" value="${member.memberGen}" readonly="readonly"></td>
							</tr>
							<tr>	
								<th><p  style="color: #ac2925">*닉네임</p></th>
									<td><input type="text" id="memberNicknm" name="memberNicknm" value="${member.memberNicknm}"></td>
								<th><p  style="color: #ac2925">*비밀번호</p></th>
									<td><input type="password" id="memberPw" name="memberPw" value="${member.memberPw}"></td>
							</tr>
							<tr>
								<th><label for="memberBirth">생년월일</label></th>
									<td><input type="text" id="memberBirth" name="memberBirth" value="${member.memberBirth}" readonly="readonly"></td>
									<th><p  style="color: #ac2925">*전화번호</p></th>
									<td><input type="text" id="memberTel" name="memberTel" value="${member.memberTel}"></td>
							</tr>
							<tr>
									<th><p  style="color: #ac2925">*Email</p></th>
									<td><input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}"></td>
							</tr>
							<tr>
								<th><p  style="color: #ac2925">*프로필</p></th>
									<td>
									<input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control">
									<div id="imgContainer" style="display:none"><img id="Img" width="150" height="170"></div>
									</td>
									<td><button id="FileForm" type="button" class="btn btn-primary"> 파일등록 </button></td> 
									<th><label></label></th>
									<td></td>
							</tr>
							<tr>
								<c:if test="${auth ne 'M' }">
								<th><label for="memberMile">마일리지</label></th>
									<td><input type="text" id="memberMile" name="memberMile" value="${member.memberMile}" readonly="readonly"></td>
								<th><p  style="color: #ac2925; margin-top: 30px">*관심분야</p></th>
								<td><input type="text" id="memberLikeFld" name="memberLikeFld" value="${member.memberLikeFld}">
								<div class="form-check-inline" style="word-spacing: 10px">
								<input type="checkbox" class="form-check-input" id="memberLikeFld1" name="memberLikeFld" value="경제경영">
								<label for="favorite1" class="form-label">경제경영</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld2" name="memberLikeFld" value="자기개발">
								<label for="favorite2" class="form-label">자기개발</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld3" name="memberLikeFld" value="소설/시/희곡">
								<label for="favorite3" class="form-label">소설/시/희곡</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld4" name="memberLikeFld" value="에세이">
								<label for="favorite4" class="form-label">에세이</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld5" name="memberLikeFld" value="인문학">
								<label for="favorite5" class="form-label">인문학</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld6" name="memberLikeFld" value="사회과학">
								<label for="favorite6" class="form-label">사회과학</label><br>
								<input type="checkbox" class="form-check-input" id="memberLikeFld7" name="memberLikeFld" value="역사">
								<label for="favorite7" class="form-label">역사</label>
								<input type="checkbox" class="form-check-input" id="memberLikeFld8" name="memberLikeFld" value="예술/대중문화">
								<label for="favorite8" class="form-label">예술/대중문화</label>
							</div>
								</c:if>
							</tr>
							<tr>
								<c:if test="${auth ne 'U'}">
								<th><label for="managerCnfmYn">승인여부</label></th>
									<td><input type="text" id="managerCnfmYn" name="managerCnfmYn" value="${member.managerCnfmYn}" readonly="readonly"></td>
								<th><label for="mcnfmId">승인번호</label></th>
									<td><input type="text" id="mcnfmId" name="mcnfmId" value="${member.mcnfmId}" readonly="readonly"></td>
								</c:if>
							</tr>
						</table>
						</form>
					</div>
				</div><br><br>
				<div align="center">
					<input type="button" onclick="myPageUpdate('U')" value="수정" class="btn btn-default get" style="background-color: #90EE90">
					<input type="button" onclick="myPageUpdate('D')" value="취소" class="btn btn-default get" style="background-color: #1E90FF">
					<input type="button" onclick="location.href=''" value="회원탈퇴" class="btn btn-default get" style="background-color: #FF6347">
				</div><br><br><br>
			</div>
		</div>
	</div>
</body>
</html>