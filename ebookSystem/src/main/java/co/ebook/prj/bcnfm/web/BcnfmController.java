package co.ebook.prj.bcnfm.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.bcnfm.service.BcnfmService;
import co.ebook.prj.bcnfm.vo.BcnfmVO;
import co.ebook.prj.common.vo.Paging;

@Controller
public class BcnfmController {
	
	@Autowired
	BcnfmService bcnfmDao;
	
	// BOOK 승인목록 조회 
	@RequestMapping("/bcnfmList")
	public String bcnfmList(Model model, @ModelAttribute("vo") BcnfmVO vo, Paging paging){
		
		System.out.println("==================================>");
		System.out.println(vo.toString());
		System.out.println("==================================>");
		//페이징처리
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast()); 
		
		if( "01".equals(vo.getSrchVal())  ) {
			vo.setBookNm(vo.getSrchTxt());
		}else if( "02".equals(vo.getSrchVal())  ) {
			vo.setBookPublCo(vo.getSrchTxt());
		}else if( "03".equals(vo.getSrchVal())  ) {
			vo.setBookWriter(vo.getSrchTxt());
		}
		
		paging.setTotalRecord(bcnfmDao.bcnfmListCount(vo));
		
		List<BcnfmVO> lists = bcnfmDao.bcnfmList(vo);
		model.addAttribute("lists", lists);
		return "bcnfm/bcnfmList";
	}
	
}
