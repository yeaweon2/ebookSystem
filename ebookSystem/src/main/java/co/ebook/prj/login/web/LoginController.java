package co.ebook.prj.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginDao;
	
	
	
	@RequestMapping("/login")
	public String login (Model model,HttpServletRequest request, LoginVO vo) {
		HttpSession session = request.getSession();
        
		session.setMaxInactiveInterval(60);
		
		return "main/login";
	}
	
	
	
	@RequestMapping("/loginProc")
	public String loginProc(Model model , LoginVO vo , HttpSession session) {
		
		String views = null;
		
		vo = loginDao.getLoginInfo(vo);
		
		if( vo != null ) {
			session.setAttribute("id"		, vo.getMemberId());
			session.setAttribute("name"		, vo.getMemberNm());
			session.setAttribute("nicknm"	, vo.getMemberNicknm());
			session.setAttribute("auth"		, vo.getMemberFlCd());
			session.setAttribute("stcd"		, vo.getMemberStCd());
			session.setAttribute("cartCnt"	, vo.getCartCnt());
			session.setAttribute("subYn"	, vo.getMemberSubYn());
			views = "redirect:home"; 
		}else {
			model.addAttribute("message", "로그인 실패 !!");
			views = "main/loginFail";
		}

		return views;
		
		
	}
	
	
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
		return "redirect:home";
	}
}
