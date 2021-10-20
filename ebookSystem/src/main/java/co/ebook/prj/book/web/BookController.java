package co.ebook.prj.book.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
   @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	
	@RequestMapping("/bookList")
	public String bookList(Model model , BookVO vo ) {
		
		List<BookVO> lists = bookDao.bookList();

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
	
	
	@PostMapping("/bookInsert")
	public String bookInsert(Model model , BookVO vo) {
		
		
		vo.setMemberId("admin");		
		
		int result = bookDao.bookInsert(vo);
		
		System.out.println("도서 : " + result + " 건 입력완료 ------->");
		if(result > 0 ) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "에러");
		}
		
		return "redirect:/bookList";
	}
	
	@RequestMapping("/bookUpdateForm")
	public String bookUpdateForm(Model model , BookVO vo) {
		vo = bookDao.bookDetail(vo);
		System.out.println(vo.toString());
		
		model.addAttribute("books", vo);
		return "book/bookUpdateForm";
	}
}
