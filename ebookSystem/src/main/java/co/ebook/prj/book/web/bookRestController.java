package co.ebook.prj.book.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;

@RestController
public class bookRestController {

	@Autowired
	BookService bookDao;
	
   @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
   
   
	@RequestMapping(value="/bookUpdate", method=RequestMethod.PUT, consumes="application/json"  )
   public BookVO bookUpdate(Model model, @RequestBody BookVO vo) {
		System.out.println(vo.toString());
	   int result = bookDao.bookUpdate(vo);
	   System.out.println("BOOK수정 : " + result + " ----> ");
	   if( result > 0) {
		   model.addAttribute("msg", "Success");
	   }else {
		   model.addAttribute("msg", "Error");
	   }
	   
	   return vo;
   }
}
