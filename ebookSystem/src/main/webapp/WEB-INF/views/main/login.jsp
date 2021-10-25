<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="site-section">
	<div class="container">
		<div class="row mb-1" style="margin-top: 40px">
			<div class="section-header">
				<h2>로그인</h2>
			</div>
		</div>
		<div>
		<form action="loginProc" method="post">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				<dl>
					<dt>로그인 ID</dt>
					<dd><input type="text"  name="memberId"></dd>
					<dt>패스워드</dt>
					<dd><input type="password" name="memberPw"></dd>
				</dl>
				<button type="submit">로그인</button>
			</form>
		
		</div>
	</div>
</div>
</body>
</html>