<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#di{
		background-color: Cornsilk;
		text-align: center;
		align-content: center;
		width:600px;
		hight:800px;
		border-radius:50px;
		margin-top: 100px;
		padding: 50px 50px 50px 50px; 
	}
	#p {
		color : LightCoral;
	}
	
</style>
</head>
<body>
<div class="container" id="di">
	<div class="area_inputs wow fadeIn">
		<div class="form-group">
			<div class="section-header">
				<h2>로그인 오류</h2>
			</div><br><br>
			<form id="frm"  action="loginProc" method="post">
				<div class="form-group">
					<div class="col-md-12" align="center">
						<h4><p id="p">로그인에 실패하셨습니다.</p></h4>
						<div class="col-md-6" >
							<button type="button"	class="btn btn-primary btn-block" onclick="location.href='login'">로그인으로 이동</button>
						</div>
						<div class="col-md-6">
							<button type="button"	class="btn btn-primary btn-block" onclick="location.href='memberJoin'">회원가입</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>