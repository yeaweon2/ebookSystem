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
import co.ebook.prj.common.vo.Paging;

@Controller
public class inquireController {
	@Autowired
	private CmmntyService cmmntyDao;

	@Autowired
	String filePath;
	
	// 1:1문의 전체조회
	@RequestMapping("/inquireList")
	String inquireList(Model model, CmmntyVO vo, Paging paging, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		vo.setCmmntyFlCd("03");
		
		//페이징처리
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast()); 
		paging.setTotalRecord(cmmntyDao.getCount(vo));
		
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("inquires", lists);
		return "cmmnty/inquireList";
	}
	// 1:1문의 상세조회
	@RequestMapping("/inquireSelectList")
	String noticeSelectList(Model model, CmmntyVO vo) throws Exception {
		vo.setCmmntyFlCd("03");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("inquire", vo);
		return "cmmnty/inquireSelectList";
	}

	// 1:1문의 게시글입력양식
	@RequestMapping("/inquireInsertForm")
	String inquireInsertForm(Model model, CmmntyVO vo) {

		return "cmmnty/inquireInsertForm";
	}

	// 1:1문의 게시글입력
	@RequestMapping("/inquireInsert")
	String inquireInsert(Model model, CmmntyVO vo, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String)session.getAttribute("id"));
		vo.setCmmntyFlCd("03");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("자유게시판:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:inquireList";
	}

	// 1:1문의 게시글삭제
	@PostMapping("/inquireDelete")
	public String inquireDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("03");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:inquireList";
	}

	// 1:1문의 게시글수정 양식>>>>>>>>>>>>>>>>>>>>>>>
	@PostMapping("/inquireUpdateForm")
	public String inquireUpdateForm(Model model, CmmntyVO vo, HttpServletRequest request) {
		vo.setCmmntyFlCd("03");
		 
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("inquires", vo);
		return "cmmnty/inquireUpdateForm";
	}

	// 1:1문의 게시글수정
	@RequestMapping(value = "/inquireUpdate")
	public String inquireUpdate(Model model, CmmntyVO vo) {

		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:inquireList";

	}

}
