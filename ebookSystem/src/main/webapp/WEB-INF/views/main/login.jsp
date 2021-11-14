<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>로그인 폼</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
.btn-social-login {
  transition: all .2s;
  outline: 0;
  border: 1px solid transparent;
  padding: .5rem !important;
  border-radius: 50%;
  color: #fff;
}
.btn-social-login:focus {
  box-shadow: 0 0 0 .2rem rgba(0,123,255,.25);
}
.text-dark { color: #343a40!important; }




a {
    color: #333;
    text-decoration: none;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.inner_login {
    position: absolute;
    left: 50%;
    top: 50%;
    margin: -145px 0 0 -160px;
}
.login_tistory{
        position: relative;
        width: 320px;
        margin: 0 auto;
    }
.screen_out {
    position: absolute;
    width: 0;
    height: 0;
    overflow: hidden;
    line-height: 0;
    text-indent: -9999px;    
}
body, button, input, select, td, textarea, th {
    font-size: 13px;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
}    
fieldset, img {
    border: 0;
}
.login_tistory .box_login {
    margin: 35px 0 0;
    border: 1px solid #ddd;
    border-radius: 3px;
    background-color: #fff;
    box-sizing: border-box;
}
.login_tistory .inp_text {
    position: relative;
    width: 100%;
    margin: 0;
    padding: 18px 19px 19px;
    box-sizing: border-box;
}
.login_tistory .inp_text+.inp_text {
    border-top: 1px solid #ddd;
}
.inp_text input {
    display: block;
    width: 100%;
    height: 100%;
    font-size: 13px;
    color: #000;
    border: none;
    outline: 0;
    -webkit-appearance: none;
    background-color: transparent;
}
.btn_login {
    margin: 20px 0 0;
    width: 100%;
    height: 48px;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    background-color: #000;
}
.login_append {
    overflow: hidden;
    padding: 15px 0 0;
}
.inp_chk {
    display: inline-block;
    position: relative;
    margin-bottom: -1px;
}
.login_append .inp_chk {
    float: left;
}
.inp_chk .inp_radio {
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    width: 18px;
    height: 18px;
    border: 0;
}
.inp_chk .lab_g {
    display: inline-block;
    margin-right: 19px;
    color: #909090;
    font-size: 13px;
    line-height: 19px;
    vertical-align: top;
}
.inp_chk .ico_check {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin: 1px 4px 0 0;
    background-position: -60px 0;
    color: #333;
}
.inp_chk .txt_lab {
    vertical-align: top;
}
.login_append .txt_find {
    float: right;
    color: #777;
}
#str{
	margin-top:500px;
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
     
     
     
 
 
 
 
 
 
 
 
 <div id="str" style="margin-bottom: 500px;">
 <div class="inner_login">
    <div class="login_tistory">
	<div align="center"><h2><span class="txt_lab">Login</span></h2></div>
	<div>
        <form  action="loginProc" method="post" name="findform" id="frm" >
            <div class="box_login">
                <div class="inp_text">
                <label for="id" class="screen_out">아이디</label>
                <input type="email" id="memberId" name="memberId" placeholder="ID">
                </div>
                <div class="inp_text">
                <label for="loginPw" class="screen_out">비밀번호</label>
                <input type="password" id="memberPw" name="memberPw" placeholder="Password">
                </div>
            </div><br>
            <div align="right">
                <span class="txt_find">
                <a href="find_id_form" class="link_find">아이디</a>
                    / 
                <a href="find_password_form" class="link_find">비밀번호 찾기</a>
                </span>
                </div>
            <div>
            <button type="button" class="btn_login" id="loginBtn">로그인</button>
            </div><br>
            <div align="center">
            <button id="kakao-login-btn" class='btn-social-login' style='background:#1FC700; margin-right: 10px;'><i class="xi-2x xi-naver"></i></button>
			<button id="naver_id_login" class='btn-social-login' onclick="location.href='<%=apiURL%>'" style='background:#FFEB00'><i class="xi-2x xi-kakaotalk text-dark"></i></button>
            </div>
            <div class="login_append">
                <div class="inp_chk"> <!-- 체크시 checked 추가 -->
                <label for="keepLogin" class="lab_g">
        <span class="img_top ico_check"></span>
        </label>
                </div>
            </div>
            <div>
            <h5><p style="color: #F08080;">회원가입을 하시면 다양하고 특별한 혜택을 누릴 수 있습니다</p></h5>
             <button  id="join" type="button" class="btn_login" onclick="location.href='memberJoin'">회원가입</button>
             </div>
        </form>
      </div> 
    </div>
</div>
</div><br><br><br><br><br>
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
        $("#kakao-login-btn").on("click", function(){
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