package co.ebook.prj.book.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
	@RequestMapping("/bookList")
	public String bookList() {
		return "book/bookList";
	}
	
	@RequestMapping("/bookInsertForm")
	public String bookInsertForm() {
		return "book/bookInsertForm";
	}
}
