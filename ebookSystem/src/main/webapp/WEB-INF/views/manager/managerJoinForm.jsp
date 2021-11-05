<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>기업회원가입 폼</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/form-validation.js"></script>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">  

	// 아이디 중복체크
	function checkMemberId(div) {
		var memberId = $('#memberId').val();
		
		$.ajax({
			url : 'checkMemberId' ,
			type : 'post',
			dataType: 'json',
			data : { memberId : $('#memberId').val() },
			success: function(data){
				if (data > 0) { 
					if ( div == "Y" ) { 
						alert("중복된 ID입니다.");
						}
					return false;				
				} else {
					if ( div == "Y" ) { 
						alert("사용가능한 ID입니다.");
						}
					return true;
				}
			},
			error : function(rej){
				console.log(rej);
			}
		}); 
	}


	// 닉네임 중복체크	
	function checkNickName(div) {
		var memberNicknm = $('#memberNicknm').val();
		
		$.ajax({
			url : 'checkNickName' ,
			type : 'post',
			dataType: 'json',
			data : { memberNicknm : $('#memberNicknm').val() },
			success: function(data){
				if (data > 0) {
					if ( div == "Y" ) { 
						alert("중복된 닉네임입니다.");
						}
					return false;				
				} else {
					if ( div == "Y" ) { 
						alert("사용가능한 닉네임입니다.");
						}
					return true;
				}
			},
			error : function(rej){
				console.log(rej);
			}
		}); 
	}	
	
	
</script>
</head>
<body class="bg-center">
	<div class="inner-page pt-6">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>회원가입(기업회원)</h2>
				</div>
			</div>
			<div>
			
						<div class="col-sm-8">
							<div>
								<label for="birth" class="form-label">★안내사항★</label>
							</div>
							<div>
							<textarea name="content" cols="100" rows="6" readonly="readonly" class="container-fluid">
회원가입은 해당업무 담당자명으로 진행 부탁드립니다.
회원가입 후 업체등록 신청을 해 주세요.
업체등록 신청 시 사업자등록증 첨부가 필요합니다.
업체등록 신청 후 관리자의 승인이 이루어지며, 이후 도서등록 신청이 가능합니다.
다른 자세한 사항은 1:1문의로 문의 바랍니다.
						  </textarea>
							</div>
						</div>
						
				<h4 class="mb-3"></h4>
				<form class="needs-validation" novalidate action="managerJoinSuccess" id="frm" name ="frm">
					<div class="row g-3">
						<div class="col-sm-8">
							<label for="name" class="form-label">이 름</label> 
							<input type="text" class="form-control" id="memberNm" name="memberNm" placeholder="담당자이름를 입력하세요." required>
							<div class="invalid-feedback">이름를 입력하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-sm-7">
							<label for="id" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memberId" name="memberId" placeholder="id" value="" required>
							<div class="invalid-feedback">ID를 입력하세요.</div>
						</div>

						<div class="col-sm-2">
							<br>
							<button type="button" onclick="checkMemberId('Y');" class="btn btn-primary btn-lg">중복확인</button>
							<div class="invalid-feedback">ID 중복확인을 하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-sm-4">
							<label for="password" class="form-label">비밀번호</label>
							<input type="text" class="form-control" id="memberPw" name="memberPw" placeholder="password" required>
							<div class="invalid-feedback">비밀번호를 입력하세요.</div>
						</div>

						<div class="col-sm-4">
							<label for="password" class="form-label">비밀번호 확인</label>
							<input type="text" class="form-control" id="password" placeholder="password" required>
							<div class="invalid-feedback">비밀번호를 한번더 입력하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-sm-8">
							<label for="tel" class="form-label">휴대전화</label>
							<input type="text" class="form-control" id="memberTel" name="memberTel" placeholder="tel" required>
							<div class="invalid-feedback">전화번호를 입력하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-sm-8">
							<label for="email" class="form-label">Email</label>
							<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="you@example.com">
							<div class="invalid-feedback">Email을 바르게 입력하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-sm-7">
							<label for="nickname" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="memberNicknm" name="memberNicknm" placeholder="nickname" required>
							<div class="invalid-feedback">닉네임을 입력하세요.</div>
						</div>

						<div class="col-sm-4">
							<br>
							<button type="button" onclick="checkNickName('Y');" class="btn btn-primary btn-lg">중복확인</button>
							<div class="invalid-feedback">ID 중복확인을 하세요.</div>
						</div>
					</div>
					<br>

					<div class="row g-3">
						<div class="col-md-5">
							<label for="birth" class="form-label">생년월일</label>
							<input type="text" class="form-control" id="memberBirth" name="memberBirth" placeholder="birth" required>
							<div class="invalid-feedback">생년월일 입력하세요.</div>
						</div>
						
						<div class="col-md-1">
						</div>

						<div class="col-md-2">
							<label for="gen" class="form-label">성별</label>
							<br>
							<input type="radio" name="gen" value="male">남성&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gen" value="female">여성
						</div>
						<br> <br>

					</div>

					<hr class="col-sm-8"><br><br>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="agree" required>
						<label class="form-check-label" for="agree">
							개인정보 수집 및 이용에 동의합니다.(필수)</label>
					</div>

					<div class="col-sm-8">
						<textarea name="content" cols="120" rows="10" readonly="readonly" class="container-fluid">
Ⅰ. 개인정보의 수집 및 이용 동의서
	- 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.
	
① 개인정보 수집 항목 및 수집·이용 목적
 가) 수집 항목 (필수항목)
- 성명, 비밀번호, 아이디, 전화번호, 이메일, 생년월일, 닉네임, 관심분야, 등 회원가입에 기재된 정보 또는 신청자가 제공한 정보
 
 나) 수집 및 이용 목적
- 개인회원 정보 조회
- 개인회원 마일리지 조회
- 개인회원 연락처 및 생년월일 조회
- 개인회원 관심분야 수집 후 선호카테고리 조사

② 개인정보 보유 및 이용기간
 - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지

③ 동의거부관리
 - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만,
귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수
있음을 알려드립니다
					  </textarea>
					</div>

					<hr class="col-sm-8">
					<div class="col-sm-8" >
						<button style="float:right; margin-right: 50px; padding-top: 10px" class="btn btn-primary btn-lg"  onClick="alert('회원가입이 완료되었습니다. 홈으로 이동합니다.')" type="submit">&nbsp;&nbsp;회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
