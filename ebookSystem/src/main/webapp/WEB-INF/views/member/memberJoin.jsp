<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/form-validation.css" rel="stylesheet">
<link href="resources/assets/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/checkout/">
</head>
<body>
	<div align="left" class="site-section">
		<div class="container">
			<div class="row mb-1" style="margin-top: 40px">
				<div class="section-header">
					<h2>E로운 생활 회원가입</h2>
				</div>
			</div>
		</div>
		<div align="center">
			<button type="button" class="btn-projects scrollto"
				onclick="location.href='memberJoinForm'">회원가입(개인)</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn-projects scrollto"
				onclick="location.href='managerJoinForm'">회원가입(업체)</button>
		</div>
	</div>
	<script src="resources/js/form-validation.js"></script>
	<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>