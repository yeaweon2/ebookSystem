<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<style>
	:root { -
		-input-padding-x: 1.5rem; -
		-input-padding-y: .75rem;
	}
	
	body {
		background-color: white;
	}
	
	.card-signin {
		border: 0;
		border-radius: 1rem;
		box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
		overflow: hidden;
	}
	
	.card-signin .card-title {
		margin-bottom: 2rem;
		font-weight: 300;
		font-size: 1.5rem;
	}
	
	.card-signin .card-body {
		padding: 2rem;
	}
	
	.form-signin {
		width: 100%;
	}
	
	.form-signin .btn {
		font-size: 80%;
		border-radius: 5rem;
		letter-spacing: .1rem;
		font-weight: bold;
		padding: 1rem;
		transition: all 0.2s;
	}
	
	.form-label-group {
		position: relative;
		margin-bottom: 1rem;
	}
	
	.form-label-group input {
		height: auto;
		border-radius: 2rem;
	}
	
	.form-label-group>input, .form-label-group>label {
		padding: var(- -input-padding-y) var(- -input-padding-x);
	}
	
	.form-label-group>label {
		position: absolute;
		top: 0;
		left: 0;
		display: inline_block;
		width: 100%;
		margin-bottom: 0;
		/* Override default `<label>` margin */
		line-height: 1.5;
		color: #495057;
		border: 1px solid transparent;
		border-radius: .25rem;
		transition: all .1s ease-in-out;
	}
	
	.form-label-group input::-webkit-input-placeholder {
		color: transparent;
	}
	
	.form-label-group input:-ms-input-placeholder {
		color: transparent;
	}
	
	.form-label-group input::-ms-input-placeholder {
		color: transparent;
	}
	
	.form-label-group input::-moz-placeholder {
		color: transparent;
	}
	
	.form-label-group input::placeholder {
		color: transparent;
	}
	
	.form-label-group input:not(:placeholder-shown) {
		padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
		padding-bottom: calc(var(- -input-padding-y)/3);
	}
	
	.form-label-group input:not(:placeholder-shown) ~label {
		padding-top: calc(var(- -input-padding-y)/3);
		padding-bottom: calc(var(- -input-padding-y)/3);
		font-size: 12px;
		color: #777;
	}
	#do{
		margin-top : 100px; 
		margin-bottom: 100px;
		margin-left: 150px;
		margin-right: 150px;
		align-content: center;
		padding: 10px 10px 400px 400px;
		
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
<div align="center" id="do">
	<div class="col-lg-6 mb-6 mb-lg-0">
		<div style='margin-bottom: 50px;'><h2>비밀번호 찾기</h2></div>
			<form method="post" class="form-signin" action="find_password" name="findform" id = "frm">
				<c:if test="${check != 0}">
				
				<div class="form-label-group">
					<input type="text" id="memberId" name="memberId" class="form-control"/>
					<label for="id">ID</label>
				</div>
				
				<div class="form-label-group">
					<input type="text" id="memberNm" name="memberNm" class="form-control"/>
					<label for="name">name</label>
				</div>
				
				<div class="form-label-group">
					<input type="text" id="memberTel" name="memberTel" class="form-control"/>
					<label for="phone">phone</label>
				</div>
		
				<div class="form-label-group">
					<input class="btn btn-lg btn-secondary btn-block text-uppercase"
						type="button" value="check" id="ckPass">
				</div>
				</c:if>				
				<!-- 정보가 일치하지 않을 때-->
				<c:if test="${check == 1}">
					<script>
						opener.document.findform.id.value = "";
						opener.document.findform.name.value = "";
						opener.document.findform.phone.value = "";
					</script>
					<label>일치하는 정보가 존재하지 않습니다.</label>
				</c:if>
				
				<!-- 정보가 일치 할 때  -->
				<c:if test="${check == 0 }">
				<div>
					<label>회원정보가 일치합니다.</label>
					<label>비밀번호를 변경하세요.</label>
				</div>
				<div class="form-label-group">
				<input value="입력하신 아이디는 ' ${updateid } ' 입니다." class="form-control">
				<input type="hidden" id="id" name="updateid" value=${updateid } class="form-control">
				</div><br><br>
				<div class="form-label-group">
				<input type="hidden" id="pw" name="updatePw" value="${updatePw }">
				
					<input type="password" id="password" name="pwd" class="form-control"/>
					<label for="password">password</label>
				</div>
				
				<div class="form-label-group">
					<input type="password" id="confirmpassword" name="confirmpwd" class="form-control"/>
					<label for="confirmpassword">confirm password</label>
				</div>
				
				<div class="form-label-group">
						<input class="btn btn-lg btn-secondary btn-block text-uppercase"
							type="button" value="update password" onclick="updatePassword()">
							
					</div>
				</c:if>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	$("#ckPass").on("click", function(){
		frm.action="find_password";
		frm.submit(); 
		
	});

		function updatePassword(){
			console.log("------------------------------");
			if(document.findform.pwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.pwd.focus();
				
			} else if(document.findform.pwd.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
				
			} else {
				$("#id").val();
				$("#pw").val( $("#password").val() );
				
				console.log($("#id").val());
				console.log($("#pw").val());
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
		
	</script>
</body>
</html>