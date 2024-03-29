<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>NaverLoginTest</title>
</head>
<body>
    <br>
    <div style="text-align:center">${result}</div>
</body>
</html><script type="text/javascript">
        var naver_id_login = new naver_id_login("fS4shoi86zkoG3WEiReF", "http://localhost/prj/home"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
        
        // 접근 토큰 값 출력
        alert(naver_id_login.oauthParams.access_token);
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        Swal.fire({
            icon: 'success',
            title: '로그인 완료',
            text: '로그인되셨습니다.',
        });
            self.close();
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('name'));
            alert(naver_id_login.getProfileData('id'));
            alert(naver_id_login.getProfileData('nickname'));
        }
    </script>
