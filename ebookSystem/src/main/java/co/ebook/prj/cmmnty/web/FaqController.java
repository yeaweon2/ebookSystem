package co.ebook.prj.cmmnty.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// FAQ 게시글입력양식
	@RequestMapping("/faqInsertForm")
	String faqInsertForm(Model model, CmmntyVO vo, HttpServletRequest request) {

		HttpSession session = request.getSession();
		return "cmmnty/faqInsertForm";
	}

	// FAQ 게시글입력
	@RequestMapping("/faqInsert")
	String faqInsert(Model model, CmmntyVO vo) throws Exception {
		vo.setCmmntyFlCd("02");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("FAQ:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:faqList";
	}

	// FAQ 게시글삭제
	@PostMapping("/faqDelete")
	public String faqDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("04");
		vo.setCmmntyWriter("admin");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:faqList";
	}

	// FAQ 게시글수정 양식
	@PostMapping("/faqUpdateForm")
	public String faqUpdateForm(Model model, CmmntyVO vo, HttpServletRequest request) {
		vo.setCmmntyFlCd("04");

		vo.setCmmntyWriter((String) request.getAttribute("id"));
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("board", vo);
		return "cmmnty/faqUpdateForm";
	}

	// FAQ 게시글수정
	@RequestMapping(value = "/faqUpdate")
	public String faqUpdate(Model model, CmmntyVO vo) {

		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:faqList";

	}

}
