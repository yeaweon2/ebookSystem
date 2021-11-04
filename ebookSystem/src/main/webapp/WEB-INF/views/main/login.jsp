<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
$(function(){
	$("#loginBtn").on("click", function(){
		event.preventDefault();
		frm.submit();
	});
});

</script>
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
			<form id="frm"  action="loginProc" method="post">
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				<dl>
					<dt>로그인 ID</dt>
					<dd><input type="text" id="memberId"  name="memberId"></dd>
					<dt>패스워드</dt>
					<dd><input type="password" id="memberPw" name="memberPw"></dd>
				</dl>
				<a id="loginBtn" href="#" class="smoothie btn btn-primary">&nbsp;&nbsp;로그인&nbsp;&nbsp;</a>
				<!-- <button type="button" class="btn btn-primary">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button> -->
			</form>
		
		</div>
	</div>
</div>
</body>
</html>