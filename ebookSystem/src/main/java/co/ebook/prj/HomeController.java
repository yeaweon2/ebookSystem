package co.ebook.prj;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	  
	@Autowired
	BookService bookDao;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// best seller 
		List<BookVO> lists = bookDao.bestSellerBook();
		model.addAttribute("lists", lists);
		return "main/home";  
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		
		return "main/about";  
	}
	
}
