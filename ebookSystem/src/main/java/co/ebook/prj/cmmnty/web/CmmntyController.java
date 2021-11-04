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
public class CmmntyController {
	// DAO연결하기
	@Autowired
	private CmmntyService cmmntyDao;

	// 공지사항 전체조회
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("notices", lists);
		return "cmmnty/noticeList";
	}

	// 공지사항 상세조회
	@RequestMapping("/noticeSelectList")
	String noticeSelectList(Model model, CmmntyVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("notice", vo);
		return "cmmnty/noticeSelectList";
	}

	// 공지사항 게시글입력양식
	@RequestMapping("/noticeInsertForm")
	String noticeInsertForm(Model model, CmmntyVO vo) {

		return "cmmnty/noticeInsertForm";
	}

	// 공지사항 게시글입력
	@RequestMapping("/noticeInsert")
	String noticeInsert(Model model, CmmntyVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String)session.getAttribute("id"));
		vo.setCmmntyFlCd("01");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("공지사항:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:noticeList";
	}

	// 공지사항 게시글삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:noticeList";
	}

	// 공지사항 게시글수정 양식
	@PostMapping("/noticeUpdateForm")
	public String noticeUpdateForm(Model model, CmmntyVO vo, HttpServletRequest request) {
		vo.setCmmntyFlCd("01");

		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("notice", vo);
		return "cmmnty/noticeUpdateForm";
	}

	// 공지사항 게시글수정
	@RequestMapping(value = "/noticeUpdate")
	public String noticeUpdate(Model model, CmmntyVO vo) {

		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:noticeList";

	}

}
