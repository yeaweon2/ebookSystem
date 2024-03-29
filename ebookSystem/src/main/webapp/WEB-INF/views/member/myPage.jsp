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
<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(function(){



//첨부파일 선택시 이미지 파일 및 파일 사이즈 체크 
$("#attchFile").on("change", function(){
	
	if($("#attchFile").val() != "") {		
		
		var ext = $("#attchFile").val().split(".").pop().toLowerCase();
		console.log(ext);
		if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp"]) == -1) {
			Swal.fire({
                icon: 'error',
                title: '첨부파일은 이미지 파일만 등록 가능합니다',
                text: '( 첨부가능 확장자 : jpg, jpeg, png, gif, bmp )',
            });
			$("#attchFile").val("");
			return false;
		}
	}
	
	var maxSize = 5 * 1024 * 1024; // 5MB

	var fileSize = $("#attchFile")[0].files[0].size;
	console.log(fileSize);
	if(fileSize > maxSize){
		Swal.fire({
            icon: 'error',
            title: '첨부파일 사이즈는 5MB 이내로 등록 가능합니다.',
            text: '다시 등록하세요.',
        });
		$("#attchFile").val("");
		return false;
	}
	
	var reader = new FileReader();
	reader.onload = function(e){
		$(".profileImg").find("img").attr("src", e.target.result);
	};
	
	$(".profileImg").find("h3").html(event.target.files[0].name);
	console.log(event.target.files[0]);
	reader.readAsDataURL(event.target.files[0]);
});


//파일 등록버튼 클릭시 
	$("#profileAdd").on("click", function(){
		$("#attchFile").click();
	});	





	//관심분야선택
	
	$("input[name=memberLikeFld]:checked").each(function() { 
		var test = $(this).val(); 
	})
	
	
	
	
	// 수정내용 저장
	
	$("#profileUpdate").on("click" , function(){
		 Swal.fire({
             title: '수정하시겠습니까?',
             text: "확인버튼 클릭 시 수정됩니다.",
             icon: 'warning',
             showCancelButton: true,
             confirmButtonColor: '#3085d6',
             cancelButtonColor: '#d33',
             confirmButtonText: '수정',
             cancelButtonText: '취소'
         }).then((result) => {
        	 if(result.isConfirmed == true) {
        		 Swal.fire(
                         '회원정보가 수정 되었습니다.',
                     )
                 frm.action = "myPageUpdate";
        	 } else {
     			$("#frm").action = "myPage";
     				return false;
     			}
     		});
	});
		
		
	
	// 회원탈퇴
		
	$().ready(function () {
        $("#memDel").click(function () {
            Swal.fire({
                title: '정말로 탈퇴 하시겠습니까?',
                text: "다시 되돌릴 수 없습니다. 신중하세요.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '탈퇴',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed == true) {
                    Swal.fire(
                        'E로운생활 회원탈퇴 되었습니다.',
                    )
                    frm.action = "myDel";
                } else {
    				return false;
    			}
                frm.submit();
            })
        });
    });
	

});
</script>
</head>
<body>
	<div class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>기본정보관리</h2>
				</div>
				<div><p  style="color: #ac2925; margin-top: 30px">*표시된 항목만 수정 가능합니다.</p></div>
			</div>
			<div>
				<div class="col-lg-7 mb-7 mb-lg-0" align="center">
					<div class="package text-center bg-white" align="center"><br />
					<form action="#" method="post"  enctype = "multipart/form-data" id="frm" name="frm">
						<table id="lcodeTb" class="table table-hover">
							<tr>
								<th style="width:50px;"><label for="memberFlNm">회원구분</label></th>
								<td style="width:200px;"><input type="text" id="memberFlNm" name="memberFlNm" value="${member.memberFlNm}" readonly="readonly"></td>
							</tr>
							<tr>
								<th style="width:50px;"><label for="memberId">ID</label></th>
								<td style="width:200px;"><input type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly"></td>
							</tr>
							<tr>
								<th style="width:50px;"><label for="memberNm">회원명</label></th>
								<td style="width:200px;"><input type="text" id="memberNm" name="memberNm" value="${member.memberNm}" readonly="readonly"></td>
							</tr>
							<tr>
								<th style="width:50px;"><label for="memberGen">성별</label></th>
								<td style="width:200px;"><input type="text" id="memberGen" name="memberGen" value="${member.memberGen}" readonly="readonly"></td>
							</tr>
							<tr>	
								<th style="width:50px;"><p  style="color: #ac2925">*닉네임</p></th>
								<td style="width:200px;"><input type="text" id="memberNicknm" name="memberNicknm" value="${member.memberNicknm}"></td>
							</tr>
							<tr>
								<th style="width:50px;"><p  style="color: #ac2925">*비밀번호</p></th>
								<td style="width:200px;"><input type="password" id="memberPw" name="memberPw" value="${member.memberPw}"></td>
							</tr>
							<tr>
								<th style="width:50px;"><label for="memberBirth">생년월일</label></th>
								<td style="width:200px;"><input type="text" id="memberBirth" name="memberBirth" value="${member.memberBirth}" readonly="readonly"></td>
							</tr>
							<tr>	
								<th style="width:50px;"><p  style="color: #ac2925">*전화번호</p></th>
								<td style="width:200px;"><input type="text" id="memberTel" name="memberTel" value="${member.memberTel}"></td>
							</tr>
							<tr>
								<th style="width:50px;"><p  style="color: #ac2925">*Email</p></th>
								<td style="width:200px;"><input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}"></td>
							</tr>
							<tr class="profileImg">
								<th style="width:150px;"><p  style="color: #ac2925">*프로필</p></th>
								<td style="width:200px;"> 
									<img src="resources/assets/img/noimg.jpg"  style="width:30%">
									<h3>No Image</h3>
										<p><button id="profileAdd" type="button" class="bookCoverCardBtn" style="width:30%"> 파일등록 </button></p>
									<input type="file" id="attchFile" name="attchFile" value="파일조회" class="form-control" style="display: none"></td>
							</tr>
								<c:if test="${auth ne 'M' }">
							<tr>
								<th style="width:50px;"><label for="memberMile">마일리지</label></th>
								<td style="width:400px;"><input type="text" id="memberMile" name="memberMile" value="${member.memberMile}" readonly="readonly"></td>
							</tr>
							<tr>
								<th style="width:50px;"><p  style="color: #ac2925; margin-top: 30px">*관심분야</p></th>
								<td style="width:400px;">
									<input type="text" id="memberLikeFld" name="memberLikeFld" value="${member.memberLikeFld}">
									<div class="form-check-inline" align="left">
										<input type="checkbox" class="form-check-input" id="memberLikeFld1" name="memberLikeFld" value="경제경영">
										<label for="favorite1" class="form-label">경제경영</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld2" name="memberLikeFld" value="자기개발">
										<label for="favorite2" class="form-label">자기개발</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld3" name="memberLikeFld" value="소설/시/희곡">
										<label for="favorite3" class="form-label">소설/시/희곡</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld4" name="memberLikeFld" value="에세이">
										<label for="favorite4" class="form-label">에세이</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld5" name="memberLikeFld" value="인문학">
										<label for="favorite5" class="form-label">인문학</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld6" name="memberLikeFld" value="사회과학">
										<label for="favorite6" class="form-label">사회과학</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld7" name="memberLikeFld" value="역사">
										<label for="favorite7" class="form-label">역사</label><br>
										<input type="checkbox" class="form-check-input" id="memberLikeFld8" name="memberLikeFld" value="예술/대중문화">
										<label for="favorite8" class="form-label">예술/대중문화</label><br>
									</div>
							</tr>
								</c:if>
								<c:if test="${auth ne 'U'}">
							<tr>
								<th style="width:50px;"><label for="managerCnfmYn">승인여부</label></th>
								<td style="width:400px;"><input type="text" id="managerCnfmYn" name="managerCnfmYn" value="${member.managerCnfmYn}" readonly="readonly"></td>
							</tr>
							<tr>	
								<th style="width:50px;"><label for="mcnfmId">승인번호</label></th>
								<td style="width:400px;"><input type="text" id="mcnfmId" name="mcnfmId" value="${member.mcnfmId}" readonly="readonly"></td>
							</tr>
								</c:if>
						</table>
						</form>
					</div>
					<div >
						<input type="button" id="profileUpdate" value="수정" class="btn btn-default get" style="background-color: #90EE90">
						<input type="button" onclick="location.href='myPage'"  value="취소" class="btn btn-default get" style="background-color: #1E90FF">
						<input type="button" id="memDel" value="회원탈퇴" class="btn btn-default get" style="background-color: #FF6347">
					</div><br><br><br>
				</div><br><br>
			</div>
		</div>
	</div>
</body>
</html>