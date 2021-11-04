<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

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
							<input id="in" type="text" id="memberId"  name="memberId">
						</div><br>
						<div>
							<img id="imge" src="resources/img/패스워드.png" />
							<input id="in" type="password" id="memberPw" name="memberPw">
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
							<img id="socialimage" src="resources/img/카카오로그인.png" />
						</div>
						<div class="form-group socialimage">
							<img id="socialimage" src="resources/img/네이버로그인.png"/>
						</div>
						<div class="form-group socialimage" >
							<img id="socialimage" src="resources/img/구글로그인.png" />
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
					
					
					
					<!-- '네이버 아이디로 로그인하기' 버튼 -->
						<!-- 원하는 곳에 넣습니다. -->
					<div id="naver_id_login">
						<button type="button" >네이버로그인</button>
					</div>
										
				</form>
			</div>
		</div>
	</div>
	
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<script type="text/javascript">
		var naver_id_login = new naver_id_login("fS4shoi86zkoG3WEiReF", "http://localhost/prj/login");	// Client ID, CallBack URL 삽입
										// 단 'localhost'가 포함된 CallBack URL
		var state = naver_id_login.getUniqState();
	
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://192.168.0.13/prj/home");	//  URL
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>