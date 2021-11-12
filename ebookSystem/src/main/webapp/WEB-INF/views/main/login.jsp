<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<script type="text/javascript">
	$(function(){
		$("#loginBtn").on("click", function(){
			event.preventDefault();

			frm.submit();
		});
	
	});
	
   

</script>
	
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
	<%
// 	네이버 로그인
        String clientId = "fS4shoi86zkoG3WEiReF";//애플리케이션 클라이언트 아이디값";
        String redirectURI = URLEncoder.encode("http://localhost/prj/home", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        session.setAttribute("state", state);
     %>
<div align="center" id="do">
	<div class="col-lg-10 mb-10 mb-lg-0">
		<div style='margin-bottom: 50px;'><h2>로그인</h2></div>
			<form class="form-signin" action="loginProc" method="post" name="findform" id="frm">
				<div class="col-lg-7 mb-7 mb-lg-0">
				<div class="form-label-group">
					<label for="id">ID를 입력하세요 </label>
					<input type="text" id="memberId" name="memberId" class="form-control"  placeholder="id"/>
				</div>
				
				<div class="form-label-group">
					<label for="id">비밀번호를 입력하세요 </label>
					<input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="password"/>
				</div>
				<div></div>
				<div class="form-label-group">
					<div class="col-md-3" style="float:right">
						 <a id="kakao-login-btn" style="width:250px; hight:180px;"></a>
					</div>
				</div>
				
				<div class="form-group socialimage">
					<div class="col-md-3" style="float:right; margin-right: 150px">
					 <a id="naver_id_login"></a>
  						  <a href="<%=apiURL%>"><img style="width:240px; hight:300px;" src="resources/img/네이버로그인.png"/></a>
					  </div>
				</div>
				
				</div>
				<div class="col-lg-5 mb-5 mb-lg-0">
				<div class="col-md-5" style="float:left; margin-right: 100px">
					<button type="button" class="btn btn-lg btn-secondary btn-block text-uppercase" id="loginBtn">로그인</button>
					<button type="button" class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="location.href='find_id_form'">아이디 찾기</button>
  					<button type="button" class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="location.href='find_password_form'">비밀번호 찾기</button>
				</div>
				</div>
				<div class="col-lg-10 mb-10 mb-lg-0">
				<div class="form-label-group">
					<h5><p id="p">회원가입을 하시면 다양하고 특별한 혜택을 누릴 수 있습니다</p></h5>
					<div class="col-md-3" style="float:right; margin-right: 200px">
						<button id="join" type="button"	class="btn btn-lg btn-secondary btn-block text-uppercase"  onclick="location.href='memberJoin'">회원가입</button>
					</div>
				</div>
				</div>
			</form>
		</div>
	</div>
				
				
				
				
    <script type='text/javascript'>
       
    $("#memberId").keydown(function(e) {
		if (e.keyCode == 13) {
			alert("비밀번호를 입력하세요");
		}
	});

    
      
    $("#memberPw").keydown(function(e) {
			if (e.keyCode == 13) {
				$("#loginBtn").trigger('click');
			}
	});

    
    	//카카오 로그인
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a14afe36c9cbe3e8149b6c194be98c69');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
            	//아작스 호출필요
            	
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    	
    </script>
</body>
</html>