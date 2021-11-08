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

<script type="text/javascript">
	$(function(){
		$("#loginBtn").on("click", function(){
			event.preventDefault();
			frm.submit();
		});
	});
	
	
</script>


<style type="text/css">
	#socialimage{
		width:250px;
		hight:180px;
		
	}
	
	#in{
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
		margin-top: 100px;
		padding: 50px 50px 50px 50px; 
	}
	#imge{
		width:30px;
		hight:30px;
	}
	#imge1{
		width:25px;
		hight:20px;
		margin-right: 5px;
	}
	#imge2{
		width:20px;
		hight:20px;
	}
	#p {
		color : LightCoral;
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
	<div class="container" id="di">
		<div class="area_inputs wow fadeIn">
			<div class="form-group">
				<div class="section-header">
					<h2>로그인</h2>
				</div><br><br>
				<form id="frm"  action="loginProc" method="post">
					<div>
						<div>
							<img id="imge1" src="resources/img/아이디.png" />
							<input id="in" type="text" id="memberId"  name="memberId" placeholder="id">
						</div><br>
						<div>
							<img id="imge" src="resources/img/패스워드.png" />
							<input id="in" type="password" id="memberPw" name="memberPw" placeholder="password">
						</div><br>
						<div class="interval_height a_none">
							<a href="#"> 아이디 / 비밀번호 찾기</a> 
						</div>
						<div class="col-md-12">
							<div class="col-md-3" style="float:right; margin-right: 100px; padding-bottom: 50px">
								<button id="loginBtn" type="button"	class="btn btn-primary btn-block">로그인</button>
							</div>
						</div>
						<div class="form-group socialimage" >
							 <a id="kakao-login-btn" style="width:250px; hight:180px;"></a>
						</div>
						<div class="form-group socialimage">
							 <a id="naver_id_login"></a>
    						  <a href="<%=apiURL%>"><img style="width:240px; hight:300px;" src="resources/img/네이버로그인.png"/></a>
						</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<h5><p id="p">회원가입을 하시면 다양하고 특별한 혜택을 누릴 수 있습니다</p></h5>
							<div class="col-md-3" style="float:right; margin-right: 100px">
								<button id="join" type="button"	class="btn btn-primary btn-block" onclick="location.href='memberJoin'">회원가입 <img id="imge2" src="resources/img/회원가입.png" /></button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
				
				
				
				
    <script type='text/javascript'>
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