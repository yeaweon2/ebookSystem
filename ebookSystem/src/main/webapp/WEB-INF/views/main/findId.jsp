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
 <div id="str" style="margin-bottom: 500px;">
 <div class="inner_login">
    <div class="login_tistory">
	<div align="center"><h2><span class="txt_lab">아이디 찾기</span></h2></div>
	<div>
        <form  action="find_id" method="post" name="findform" id="frm" >
        <c:if test="${check != 0}">
            <div class="box_login">
                <div class="inp_text">
                <label for="id" class="screen_out">Name</label>
                <input id="memberNm" name="memberNm" type="text" placeholder="Name">
                </div>
                <div class="inp_text">
                <label for="memberTel" class="screen_out">Phone</label>
                <input type="text" id="memberTel" name="memberTel" placeholder="Phone">
                </div>
            </div><br>
            <div>
            <button type="button" class="btn_login" id="chId">Check</button>
            </div><br>
            </c:if>
            <!-- 이름과 전화번호가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
					opener.document.findform.name.value = "";
					opener.document.findform.phone.value = "";
				</script>
				<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>
	
			<!-- 이름과 전화번호가 일치 할 때 -->
			<c:if test="${check == 0 }">
			<label>찾으시는 아이디는' ${id}' 입니다.</label>
			 <div>
            <button type="button" class="btn_login" onclick="location.href='login'">로그인</button>
            </div><br>
			</c:if>
	
        </form>
      </div> 
    </div>
</div>
</div><br><br><br><br><br>

	<script type="text/javascript">
				
		$("#chId").on("click", function(){
			frm.action="find_id";
			frm.submit(); 
			
		});
	</script>
</body>
</html>