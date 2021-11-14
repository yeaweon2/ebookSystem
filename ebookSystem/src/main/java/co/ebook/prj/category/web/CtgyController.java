package co.ebook.prj.category.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;

@Controller
public class CtgyController {
	
	@Autowired 
	CtgyService ctgyDao;
	
	@RequestMapping("/ctgyList")
	public String ctgyList(Model model, CtgyVO vo) {
		List<CtgyVO> lists = ctgyDao.ctgyList(vo);
				
		if(lists.size() > 0) {
			model.addAttribute("msg", "성공");
			model.addAttribute("lists", lists);
		}else {
			model.addAttribute("msg", "자료가 없습니다.");
		}
		
		return "ctgy/ctgyList";
	}

}
