package co.ebook.prj.login.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import co.ebook.prj.login.mapper.LoginMapper;
import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.service.kakaoService;
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
				
				views = "redirect:home"; 
			} else  {
				model.addAttribute("message", "휴면회원이거나 탈퇴회원입니다. 관리자에게 1:1문의를 남겨주세요.");
				views = "main/loginFail";
			}
		}else {
			model.addAttribute("message", "로그인 실패 !!");
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
		System.out.println("=====================================null???");
		System.out.println("===================================================="+vo);
		loginDao.updatePwd(vo);
		model.addAttribute("login", loginDao.updatePwd(vo));
		System.out.println("======================>>>>" +loginDao.updatePwd(vo));
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
	
	

	
//	네이버로그인	
	  @RequestMapping(value="loginPostNaver", method=RequestMethod.GET)
	    public String loginPOSTNaver(Model model, HttpSession session, LoginVO vo) {
			vo.setMemberId((String)session.getAttribute("id"));	
	        model.addAttribute("state", loginDao.getLoginInfo(vo));
	        return "main/callback";
	    }
	  
	  
	  
	  @RequestMapping(value="/main/kakao_login.ajax")
	    public String kakaoLogin() {
	        StringBuffer loginUrl = new StringBuffer();
	        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
	        loginUrl.append("d9290cc72d96a7cf3bcc6da779e80ca2"); 
	        loginUrl.append("&redirect_uri=");
	        loginUrl.append("http://localhost:8080"); 
	        loginUrl.append("&response_type=code");
	        
	        return "redirect:"+loginUrl.toString();
	    }
	  
	  
	  @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
	    public <SessionConfigVO> String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
	            System.out.println(code);
	            
	            //접속토큰 get
	            String kakaoToken = kakaoService.getReturnAccessToken(code);
	            
	            //접속자 정보 get
	            Map<String,Object> result = kakaoService.getUserInfo(kakaoToken);
	            System.out.println("컨트롤러 출력"+result.get("nickname")+result.get("profile_image"));
	            LoginVO vo =new LoginVO();
	            vo.setMemberNm((String)result.get("name"));
	            vo.setMemberNicknm((String)result.get("nickname"));
	            vo.setMemberTel((String)result.get("tel"));
	            
	            session.setAttribute("sessionConfigVO", vo);
	            /*로그아웃 처리 시, 사용할 토큰 값*/
	            session.setAttribute("kakaoToken", kakaoToken);
	        return "redirect:/";
	    }
	
	  
		
}
