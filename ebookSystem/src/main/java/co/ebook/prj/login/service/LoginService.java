package co.ebook.prj.login.service;

import java.util.Map;

import co.ebook.prj.login.vo.LoginVO;

public interface LoginService {
	LoginVO getLoginInfo(LoginVO vo);
	
	LoginVO getMemberCnt();
	
	LoginVO getComunutyCnt();

//	아이디 찾기
	LoginVO findId(LoginVO vo);
	
//	비밀번호 찾기
	LoginVO findPassword(LoginVO vo);
	
//	비밀번호 수정
	int updatePwd(LoginVO vo);

//	로그아웃 이력 
	int updateLogoutHistory(LoginVO vo);

	
	String getReturnAccessToken(String code);

	Map<String, Object> getUserInfo(String access_token);
	
}
