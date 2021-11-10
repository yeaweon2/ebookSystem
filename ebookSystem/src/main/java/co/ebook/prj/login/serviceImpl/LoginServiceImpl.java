package co.ebook.prj.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.login.mapper.LoginMapper;
import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.vo.LoginVO;

@Repository
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper map;
	
	@Override
	public LoginVO getLoginInfo(LoginVO vo) {
		LoginVO lVo=map.getLoginInfo(vo);
		if(lVo != null  && lVo.getMemberStCd().equals("01")) {
			map.insertLoginHistory(vo);
		}
		return lVo;
	}

//	비밀번호변경
	@Override
	public int updatePwd(LoginVO vo) {
		return map.updatePwd(vo);
	}

//	아이디찾기
	@Override
	public LoginVO findId(LoginVO vo) {
		return map.findId(vo);
	}

//	비밀번호찾기
	@Override
	public LoginVO findPassword(LoginVO vo) {
		return map.findPassword(vo);
	}

//	로그아웃
	@Override
	public int updateLogoutHistory(LoginVO vo) {
		return map.updateLogoutHistory(vo);
	}
	
	
}
