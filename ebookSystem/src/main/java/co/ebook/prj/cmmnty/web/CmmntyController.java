package co.ebook.prj.cmmnty.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;

@Controller
public class CmmntyController {
	@Autowired //2021.10.17 DAO연결하기
	private CmmntyService cmmntyDao; 
	
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		
		model.addAttribute("notices", lists);
		return "notice/noticeList";
	}		

}
