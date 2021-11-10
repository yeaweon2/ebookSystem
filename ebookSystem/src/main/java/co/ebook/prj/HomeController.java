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
import co.ebook.prj.common.service.CommService;
import co.ebook.prj.common.vo.BookCnfmTopVO;
import co.ebook.prj.common.vo.BucketTopVO;
import co.ebook.prj.common.vo.InquireTopVO;
import co.ebook.prj.common.vo.ReviewTopVO;
import co.ebook.prj.managerConfirm.service.ManagerConfirmService;
import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
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
	
	@Autowired
	CommService commDao;
	
	@Autowired
	ManagerConfirmService manDao;
	
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model
					   , MemberVO vo, SubscriptionVO sVo, ManagerConfirmVO mVo
					   , BookCnfmTopVO btVo
					   , BucketTopVO bktVo
					   , InquireTopVO itVo
					   , HttpServletRequest request) {
		
		// best seller 

		
		// 카테고리 
		//List<CtgyVO> ctgyGrs = ctgyDao.ctgyList();
		
	//	List<CtgyVO> ctgys = ctgyDao.ctgysList();
		
		//model.addAttribute("ctgyGrs", ctgyGrs);
		//model.addAttribute("ctgys", ctgys);
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		vo.setMemberId(id);
		sVo.setMemberId(id);
		mVo.setMemberId(id);
		
		sVo = subDao.subSelect(sVo);
		mVo = manDao.managerSelect(mVo);
		
		model.addAttribute("sub", sVo);
		model.addAttribute("member", memberDao.memberSelect(vo));
		model.addAttribute("managerConfirm", mVo);
		
		List<BookVO> bests = bookDao.bestSellerBook();
		model.addAttribute("bests", bests);
		
		List<BookVO> news = bookDao.newBooks();
		model.addAttribute("news", news);
		
		List<BookVO> likes = bookDao.likeBooks();
		model.addAttribute("likes", likes);
		
		List<ReviewTopVO> reviewList = commDao.reviewTop();
		model.addAttribute("reviewList", reviewList);
		
		String auth = (String)session.getAttribute("auth");
		
		if("A".equals(auth)) {
			model.addAttribute("lists", commDao.inquireTop());	
		}else if("M".equals(auth)) {
			model.addAttribute("lists" , commDao.bookCnfmTop(id));	
		}else if("U".equals(auth)) {
			model.addAttribute("lists" , commDao.bucketTop(id));	
		}else {
		
		}
		
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
}
