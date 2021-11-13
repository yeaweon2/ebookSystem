package co.ebook.prj.bookreview.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.bookreview.service.BookReviewService;
import co.ebook.prj.bookreview.vo.BookReviewVO;
import co.ebook.prj.common.vo.Paging;
import co.ebook.prj.lend.service.LendService;
import co.ebook.prj.lend.vo.LendVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;

@Controller
public class BookReviewController {
	@Autowired
	BookReviewService bookReviewDao;
	
	@Autowired
	BookService bookDao;
	
	@Autowired
	LendService lendDao;
	
	@Autowired
	MemberService memberDao;
	
	//전체리스트
	@RequestMapping("/bookReviewList")
	String bookReviewList(Model model, BookReviewVO vo, Paging paging) {
		List<BookReviewVO> bests = bookReviewDao.bookReviewList(vo);
		model.addAttribute("bests", bests);
	
		//페이징처리
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast()); 
		paging.setTotalRecord(bookReviewDao.getCount(vo));
		
		
		List<BookReviewVO> lists = bookReviewDao.reviewList(vo);
		model.addAttribute("review", lists);

		return "bookReview/bookReviewList";
	}
	
	//단건조회
	@RequestMapping("/reviewSelectList")
	String reviewSelectList(Model model, BookReviewVO vo, HttpServletRequest request, MemberVO mvo) throws Exception{
		HttpSession session = request.getSession();
		vo.setReviewWriter((String) session.getAttribute("id"));
		
		memberDao.memberSelect(mvo);
		vo = bookReviewDao.reviewSelectList(vo);
		model.addAttribute("list", vo);
		
		return "bookReview/reviewSelectList";
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
	String reviewInsert(Model model, BookReviewVO vo, MemberVO mvo,HttpServletRequest request) {
		
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
	
	//리뷰 수정양식
	@RequestMapping("/reviewUpdateForm")
	public String reviewUpdateForm(Model model, BookReviewVO vo) {
		vo = bookReviewDao.reviewSelectList(vo);
		model.addAttribute("list", vo);
		return "bookReview/reviewUpdateForm";
	}
	
	//리뷰 수정
	@RequestMapping("/bookReviewUpdate")
	public String bookReviewUpdate(Model model, BookReviewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setBookWriter((String)session.getAttribute("id"));
		
		int list = bookReviewDao.bookReviewUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:bookReviewList";
	}
	
	// 리뷰 삭제
	@PostMapping("/bookReviewDelete")
	public String bookReviewDelete(Model model, BookReviewVO vo) {
		bookReviewDao.bookReviewDelete(vo);

		return "redirect:bookReviewList";
	}
}
