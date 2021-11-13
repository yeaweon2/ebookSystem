package co.ebook.prj.bookreview.web;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.bookreview.service.BookReviewService;
import co.ebook.prj.bookreview.vo.BookReviewVO;

@RestController
public class BookReviewRestController {
	
	@Autowired
	 BookReviewService bookReviewDao;
	
	@RequestMapping(value = "/reviewLikeItUpdate", method = RequestMethod.POST)
	public HashMap<String,Object> reviewLikeItUpdate(Model model, @RequestBody BookReviewVO vo){
		
		int result = bookReviewDao.bookReviewLikeItUpdate(vo);
		System.out.println(result);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if( result >  0 ) {
			map.put("result", "01");
		}else {
			map.put("result", "02");
		}
		return map;
	}
}
