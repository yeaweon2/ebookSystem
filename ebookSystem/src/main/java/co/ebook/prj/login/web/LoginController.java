package co.ebook.prj.login.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.ebook.prj.login.mapper.LoginMapper;
import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginDao;
	
	@Autowired
	LoginMapper map;
	
	@RequestMapping("/login")
	public String login (Model model,HttpServletRequest request, LoginVO vo) {
		HttpSession session = request.getSession();
        
		session.setMaxInactiveInterval(3600);
		
		return "main/login";
	}
	
	
	
	@RequestMapping("/loginProc")
	public String loginProc(Model model , LoginVO vo , HttpSession session) {
		
		String views = null;
		
		vo = loginDao.getLoginInfo(vo);
		//
		
		if( vo != null ) {
			if(vo.getMemberStCd().equals("01")) {
				session.setAttribute("id"		, vo.getMemberId());     
				session.setAttribute("name"		, vo.getMemberNm());
				session.setAttribute("nicknm"	, vo.getMemberNicknm());
				session.setAttribute("auth"		, vo.getMemberFlCd());
				session.setAttribute("stcd"		, vo.getMemberStCd());
				session.setAttribute("cartCnt"	, vo.getCartCnt());
				session.setAttribute("subYn"	, vo.getMemberSubYn());
				session.setAttribute("cnfmYn"   , vo.getManagerCnfmYn());
				session.setAttribute("mcnId"    , vo.getMcnfmId());
				session.setAttribute("memf"     , vo.getMemberProfilePath());
				session.setAttribute("memfn"    , vo.getMemberProfileNm());
				session.setAttribute("mile"     , vo.getMemberMile());
				session.setAttribute("sube"     , vo.getSubspEdt());
				session.setAttribute("mcnSd"    , vo.getMcnfmCntrSdt());
				session.setAttribute("mcnEd"    , vo.getMcnfmCntrEdt());
				session.setAttribute("flNm"     , vo.getMemberFlNm());	
				session.setAttribute("payA"     , vo.getPayAmt());	
				session.setAttribute("imp"      , vo.getImpUid());	
				
				if( vo.getMemberFlCd().equals("A") ) {
					// 회원수 가져오기
					LoginVO memCnt = loginDao.getMemberCnt();
					session.setAttribute("todayRegCnt", memCnt.getTodayRegCnt());	// 오늘 회원가입수
					session.setAttribute("userCnt", memCnt.getUserCnt());			// 일반 회원수            
					session.setAttribute("managerCnt", memCnt.getManagerCnt());		// 메니저 회원수           
					session.setAttribute("adminCnt", memCnt.getAdminCnt());			// 관리자 회원수           
					                                                 
					// 게시글수 가져오기
					LoginVO cmuCnt = loginDao.getComunutyCnt();
					session.setAttribute("todayRepCnt", cmuCnt.getTodayRepCnt());	// 오늘 등록된 댓글수        
					session.setAttribute("todayNotiCnt", cmuCnt.getTodayNotiCnt());	// 오늘 등록된 공지사항 수     
					session.setAttribute("todayQustCnt", cmuCnt.getTodayQustCnt());	// 오늘 등록된 1:1 문의사항 수 
					session.setAttribute("comunityCnt", cmuCnt.getComunityCnt());	// 전체 게시글수           
				
				}
				
				views = "redirect:home"; 
			} else  {
				model.addAttribute("message", "휴면회원이거나 탈퇴회원입니다. 관리자에게 1:1문의를 남겨주세요.");
				views = "main/loginFail";
			}
		}else {
			model.addAttribute("message", "로그인 실패하셨습니다. 아이디와 패스워드를 확인해주세요.");
			views = "main/loginFail";
		}

		return views;
		
		
	}
	
		
//	아이디 찾기 페이지 이동
	@RequestMapping(value="find_id_form")
	public String findIdView() {
		
		return "main/findId";
	}
	
	
//  아이디 찾기 실행
	@RequestMapping(value="find_id")
	public String findIdAction(LoginVO vo, Model model) {
		LoginVO user = loginDao.findId(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getMemberId());
		}
		
		return "main/findId";
	}
	
	
//	비밀번호 찾기 페이지로 이동
	@RequestMapping(value="find_password_form")
	public String findPasswordView() {
		return "main/findPassword";
	}
	
	
//	비밀번호 찾기 실행
	@RequestMapping(value="find_password", method=RequestMethod.POST)
	public String findPasswordAction(LoginVO vo, Model model) {
		LoginVO user = loginDao.findPassword(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getMemberId());
			model.addAttribute("updatePw", user.getMemberPw());
		}
		
		return "main/findPassword";
	}
	
	
// 	비밀번호 바꾸기 실행
	@RequestMapping(value="update_password", method=RequestMethod.POST)
	public String updatePasswordAction(LoginVO vo, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setMemberId(vo.getUpdateid());
		vo.setMemberPw(vo.getUpdatePw());
		
		loginDao.updatePwd(vo);
		model.addAttribute("login", loginDao.updatePwd(vo));

		return "main/findPasswordConfirm";
	}
	
	
//	비밀번호 바꾸기할 경우 성공 페이지 이동
	@RequestMapping(value="check_password_view")
	public String checkPasswordForModify(HttpSession session, Model model) {
		LoginVO loginUser = (LoginVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "main/login";
		} else {
			return "main/main";
		}
	}

	
//	로그아웃
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request, LoginVO vo) {
		HttpSession session = request.getSession();
		
		vo.setMemberId((String)session.getAttribute("id"));	
		model.addAttribute("logoutHistory", map.updateLogoutHistory(vo));
		
		session.invalidate();
		
		return "redirect:home";
	}
	
	
		
}
