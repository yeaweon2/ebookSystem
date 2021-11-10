package co.ebook.prj.login.mapper;

import co.ebook.prj.login.vo.LoginVO;

public interface LoginMapper {
	LoginVO getLoginInfo(LoginVO vo);
	
//	아이디 찾기
	LoginVO findId(LoginVO vo);
	
//	비밀번호 찾기
	LoginVO findPassword(LoginVO vo);
	
//	비밀번호 수정
	int updatePwd(LoginVO vo);
	
//	로그인 이력 입력
	int insertLoginHistory(LoginVO vo);
	
//	로그아웃 이력 
	int updateLogoutHistory(LoginVO vo);
	
}
