package co.ebook.prj.bookreview.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.bookreview.service.BookReviewService;
import co.ebook.prj.bookreview.vo.BookReviewVO;

@Controller
public class BookReviewController {
	@Autowired
	BookReviewService bookReviewDao;
	@Autowired
	BookService bookDao;

	@RequestMapping("/bookReviewList")
	String bookReviewList(Model model, BookReviewVO vo) {
		List<BookReviewVO> lists = bookReviewDao.bookReviewList(vo);
		model.addAttribute("lists", lists);
	
		return "bookReview/bookReviewList";
	}
	
	@RequestMapping("/reviewInsertForm")
	String reviewInsertForm(Model model, BookReviewVO vo) {
		System.out.println(vo.toString());
		System.out.println("===========>>>>>>>>>>>>>>>>>>여기는 입력폼");
		return "bookReview/bookReviewForm";
	}
	
	@RequestMapping("/reviewInsert")
	String reviewInsert(Model model, BookReviewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setReviewWriter((String)(session.getAttribute("id"))); //세션(로그인)에 담긴 (id)값을 조건으로 사용할때 필요함 예)검색조건값
		
		
		return "redirect:bookReviewList";
	}
}
