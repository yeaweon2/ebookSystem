package co.ebook.prj.book.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.category.vo.CtgyVO;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
	@RequestMapping("/bookList")
	public String bookList(Model model , BookVO vo ) {
		
		List<BookVO> lists = bookDao.bookList();
		System.out.println(lists.size());
		
		for(BookVO v : lists) {
			System.out.println(v.toString());
		}

		if(lists.size() > 0) {
			model.addAttribute("msg", "성공");
			model.addAttribute("lists", lists);
		}else {
			model.addAttribute("msg", "자료가 없습니다.");
		}		
		
		return "book/bookList";
	}
	
	@RequestMapping("/bookInsertForm")
	public String bookInsertForm() {
		return "book/bookInsertForm";
	}
	
	@RequestMapping("/bookInsert")
	public String bookInsert(Model model , BookVO vo) {
		vo.setMemberId("admin");
		System.out.println(vo.toString());
		int result = bookDao.bookInsert(vo);
		
		System.out.println("도서 : " + result + " 건 입력완료 ------->");
		if(result > 0 ) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "에러");
		}
		
		return "book/bookList";
	}
	
	@RequestMapping("/bookUpdateForm")
	public String bookUpdateForm(Model model , BookVO vo) {
		model.addAttribute("books", bookDao.bookDetail(vo));
		return "book/bookUpdateForm";
	}
	
	
}
