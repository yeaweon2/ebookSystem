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
import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	  
	@Autowired
	BookService bookDao;
	
	@Autowired
	CtgyService ctgyDao;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// best seller 
		List<BookVO> lists = bookDao.bestSellerBook();
		model.addAttribute("lists", lists);
		
		// 카테고리 
		List<CtgyVO> ctgyGrs = ctgyDao.ctgyList();
		
		List<CtgyVO> ctgys = ctgyDao.ctgysList();
		
		model.addAttribute("ctgyGrs", ctgyGrs);
		model.addAttribute("ctgys", ctgys);
		
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
