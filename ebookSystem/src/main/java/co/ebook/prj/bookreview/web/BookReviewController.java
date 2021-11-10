package co.ebook.prj.bookreview.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.bookreview.service.BookReviewService;
import co.ebook.prj.bookreview.vo.BookReviewVO;
import co.ebook.prj.lend.service.LendService;
import co.ebook.prj.lend.vo.LendVO;

@Controller
public class BookReviewController {
	@Autowired
	BookReviewService bookReviewDao;
	
	@Autowired
	BookService bookDao;
	
	@Autowired
	LendService lendDao;
	
	//전체리뷰 리스트
	@RequestMapping("/bookReviewList")
	String bookReviewList(Model model, BookReviewVO vo) {
		List<BookReviewVO> lists = bookReviewDao.bookReviewList(vo);
		model.addAttribute("lists", lists);
	
		return "bookReview/bookReviewList";
	}
	
	//대여리스트 
	@RequestMapping(value="/reviewLendList", method=RequestMethod.GET)
	@ResponseBody
	List<LendVO> reviewLendList(Model model, LendVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		List<LendVO> lists = lendDao.lendList(vo);
		
		return lists;
	}
	
	//리뷰 입력양식
	@RequestMapping("/reviewInsertForm")
	String reviewInsertForm(Model model, BookReviewVO vo) {
		return "bookReview/bookReviewForm";
	}
	
	
	//리뷰 입력
	@RequestMapping("/reviewInsert")
	String reviewInsert(Model model, BookReviewVO vo, HttpServletRequest request) {
		System.out.println(vo.toString());
		System.out.println("========================리뷰를 입력합시다");
		
		HttpSession session = request.getSession();
		vo.setReviewWriter((String)session.getAttribute("id"));
		
		int lists = bookReviewDao.bookReviewInsert(vo);
		
		if (lists > 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:bookReviewList";
	}
}
