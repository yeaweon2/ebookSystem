package co.ebook.prj.bcnfm.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.bcnfm.service.BcnfmService;
import co.ebook.prj.bcnfm.vo.BcnfmVO;

@Controller
public class BcnfmController {
	
	@Autowired
	BcnfmService bcnfmDao;
	
	// BOOK 승인목록 조회 
	@RequestMapping("/bcnfmList")
	public String bcnfmList(Model model, BcnfmVO vo){
		List<BcnfmVO> lists = bcnfmDao.bcnfmList();
		model.addAttribute("lists", lists);
		return "bcnfm/bcnfmList";
	}
	
}
