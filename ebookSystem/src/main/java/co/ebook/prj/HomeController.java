package co.ebook.prj;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;
import co.ebook.prj.subscription.service.SubscriptionService;
import co.ebook.prj.subscription.vo.SubscriptionVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	  
	@Autowired
	BookService bookDao;
	
	@Autowired
	CtgyService ctgyDao;
	
	@Autowired
	MemberService memberDao;
	
	@Autowired
	SubscriptionService subDao;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, MemberVO vo, SubscriptionVO sVo, HttpServletRequest request) {
		
		// best seller 
		//List<BookVO> lists = bookDao.bestSellerBook();
		//model.addAttribute("lists", lists);
		
		// 카테고리 
		//List<CtgyVO> ctgyGrs = ctgyDao.ctgyList();
		
	//	List<CtgyVO> ctgys = ctgyDao.ctgysList();
		
		//model.addAttribute("ctgyGrs", ctgyGrs);
		//model.addAttribute("ctgys", ctgys);
		
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));
		sVo = subDao.subSelect(sVo);
		model.addAttribute("sub", sVo);
		model.addAttribute("member", memberDao.memberSelect(vo));
		
		
		
		
		return "main/home";  
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		
		return "main/about";  
	}
	
	
	@RequestMapping(value = "/sidebar", method = RequestMethod.GET)
	public String sidebarSearch(Model model) {
		
		// 카테고리 
		List<CtgyVO> ctgyGrs = ctgyDao.ctgyList();
		
		List<CtgyVO> ctgys = ctgyDao.ctgysList();
		
		model.addAttribute("ctgyGrs", ctgyGrs);
		model.addAttribute("ctgys", ctgys);
		
		return "no/tiles/sidebar";  
	}
	
	
	/*
	 * @RequestMapping(value="login", method=RequestMethod.GET) public String
	 * loginGET() {
	 * 
	 * return "main/login"; }
	 * 
	 * @RequestMapping(value="loginPostNaver", method=RequestMethod.GET) public
	 * String loginPOSTNaver(HttpSession session) {
	 * 
	 * return "main/loginPostNaver"; }
	 * 
	 */
	
	
}
