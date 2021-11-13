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
public class BoardController {
	@Autowired
	private CmmntyService cmmntyDao;

	@Autowired
	String filePath;
	
	// 자유게시판 전체조회
	@RequestMapping("/boardList")
	String boardList(Model model, CmmntyVO vo, Paging paging) {
		vo.setCmmntyFlCd("04");
		
		//페이징처리
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast()); 
		paging.setTotalRecord(cmmntyDao.getCount(vo));
		
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("boards", lists);
		return "cmmnty/boardList";
	}

	// 자유게시판 상세조회
	@RequestMapping("/boardSelectList")
	String boardSelectList(Model model, CmmntyVO vo) throws Exception {
		vo.setCmmntyFlCd("04");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);
		model.addAttribute("board", vo);
		return "cmmnty/boardSelectList";
	}

	// 자유게시판 게시글입력양식
	@RequestMapping("/boardInsertForm")
	String boardInsertForm(Model model, CmmntyVO vo) {

		return "cmmnty/boardInsertForm";
	}

	// 자유게시판 게시글입력
	@RequestMapping("/boardInsert")
	String boardInsert(Model model, CmmntyVO vo, HttpServletRequest request) throws Exception {
		
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String)session.getAttribute("id"));
		vo.setCmmntyFlCd("04");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("자유게시판:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:boardList";
	}

	// 자유게시판 게시글삭제
	@PostMapping("/boardDelete")
	public String boardDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("04");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:boardList";
	}

	// 자유게시판 게시글수정 양식
	@PostMapping("/boardUpdateForm")
	public String boardUpdateForm(Model model, CmmntyVO vo, HttpServletRequest request) {
		vo.setCmmntyFlCd("04");

		vo.setCmmntyWriter((String)request.getAttribute("id"));
		vo = cmmntyDao.cmmntySelectList(vo);

		model.addAttribute("board", vo);
		return "cmmnty/boardUpdateForm";
	}

	// 자유게시판 게시글수정
	@RequestMapping(value = "/boardUpdate")
	public String boardUpdate(Model model, CmmntyVO vo) {

		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:boardList";

	}

}
