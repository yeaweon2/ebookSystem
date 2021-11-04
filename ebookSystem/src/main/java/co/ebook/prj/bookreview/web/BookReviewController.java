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

	@RequestMapping("/bookReviewList")
	String bookReviewList(Model model, BookReviewVO vo) {
		List<BookReviewVO> lists = bookReviewDao.bookReviewList(vo);
		model.addAttribute("lists", lists);
	
		return "bookReview/bookReviewList";
	}
	
	@RequestMapping("/reviewInsertForm")
	String reviewInsertForm(Model model, BookReviewVO vo) {
		return "bookReview/bookReviewForm";
	}
	
	@RequestMapping(value="/reviewLendList", method=RequestMethod.GET)
	@ResponseBody
	List<LendVO> reviewLendList(Model model, LendVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		List<LendVO> lists = lendDao.lendList(vo);
		System.out.println(lists.toString());
		System.out.println("===============================여기가 대여리스트");
		
		return lists;
	}
}
