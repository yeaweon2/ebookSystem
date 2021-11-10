<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
		width: 50%;
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
	}
	
	.form-label-group input:not(:placeholder-shown) ~label {
		
		font-size: 30px;
		color: #777;
	}
	#do{
		margin-top : 100px; 
		margin-bottom: 100px;
		margin-left: 50px;
		margin-right: 50px;
		align-content: right;
		padding: 10px 10px 100px 10px;
		
	}
	#socialimage{
		width:250px;
		hight:180px;
		
	}
	
	#memberId, #memberPw{
		width:200px;
		hight:100px;
		
	}
	#di{
		background-color: Cornsilk;
		text-align: center;
		align-content: center;
		width:600px;
		hight:800px;
		border-radius:50px;
	}
	#imge2{
		width:20px;
		hight:20px;
	}
	#p {
		color : LightCoral;
	}
	.btn btn-lg btn-secondary btn-block text-uppercase{
		width: 400px; 
 		height: 400px; 
	}
</style>
</head>
<body>
<div align="center" id="do">
	<div class="col-lg-10 mb-10 mb-lg-0">
		<div style='margin-bottom: 50px;'><h2>로그인 실패</h2></div>
			<form class="form-signin" action="loginProc" method="post" name="findform" id="frm">
				<div class="form-label-group">
					<div class="col-md-12" align="center">
						<h4><p id="p">로그인에 실패하셨습니다.</p></h4>
						<div class="col-md-6" >
							<button type="button" class="btn btn-lg btn-secondary btn-block text-uppercase" id="loginBtn" onclick="location.href='login'">로그인으로 이동</button>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-lg btn-secondary btn-block text-uppercase" id="loginBtn" onclick="location.href='memberJoin'">회원가입</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>