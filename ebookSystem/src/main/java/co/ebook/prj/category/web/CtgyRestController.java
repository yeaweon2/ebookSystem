package co.ebook.prj.category.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;

@RestController
public class CtgyRestController {

	@Autowired 
	CtgyService ctgyDao;	
	
	@RequestMapping(value="/ctgyDetailList", method=RequestMethod.POST)
	public List<CtgyVO> ctgyDetailList(Model model, @RequestBody CtgyVO vo ) {
		
		
		System.out.println("------------------------->>");
		System.out.println(vo.getCtgyId());
		
		
		List<CtgyVO> lists = ctgyDao.ctgyDetailList(vo);
		System.out.println(lists.size());
		System.out.println("------------------------->>");
		for(CtgyVO v : lists) {
			System.out.println(v.toString());
		}
		
		return lists; 
	}	
}
