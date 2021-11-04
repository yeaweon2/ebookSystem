package co.ebook.prj.cmmnty.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;

@Controller
public class FaqController {
	@Autowired
	private CmmntyService cmmntyDao;

	// FAQ 전체조회
	@RequestMapping("/faqList")
	String faqList(Model model, CmmntyVO vo) {
		
		vo.setCmmntyFlCd("02");
		vo.setCmmntyDelyn("N");
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		System.out.println(lists);
		model.addAttribute("faqs", lists);
		return "cmmnty/faqList";
	}
	

	// FAQ 게시글입력
	@RequestMapping("/faqInsert")
	String faqInsert(Model model, CmmntyVO vo, HttpServletRequest request ) throws Exception {
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String)session.getAttribute("id"));
		
		vo.setCmmntyFlCd("02");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("FAQ:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:faqList";
	}

	// FAQ 게시글삭제
	@GetMapping("/faqDelete")
	public String faqDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("02");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:faqList";
	}

	// FAQ 게시글수정
	@RequestMapping(value = "/faqUpdate")
	public String faqUpdate(Model model, CmmntyVO vo) {
		
		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:faqList";

	}

}
