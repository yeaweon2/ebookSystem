package co.ebook.prj.replycmmnty.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.ebook.prj.replycmmnty.service.ReplyCmmntyService;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;


@Controller
public class ReplyCmmntyController {
	
	@Autowired
	private ReplyCmmntyService replyDao;
	
	// 211019커뮤니티 글입력
	@RequestMapping(value="/ReplycmmntInsert", method=RequestMethod.POST)
	String ReplycmmntInsert(Model model, ReplyCmmntyVO vo) throws Exception {
		replyDao.ReplycmmntInsert(vo);
		int lists = replyDao.ReplycmmntInsert(vo);
		if (lists > 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		
		return "notice/noticeSelect";
	}

}
