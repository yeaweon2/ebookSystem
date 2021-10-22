package co.ebook.prj.cmmnty.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;

@Controller
public class CmmntyController {
	// 211017 DAO연결하기
	@Autowired
	private CmmntyService cmmntyDao;

	// 211017 공지사항 전체조회
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("notices", lists);
		return "notice/noticeList";
	}

	// 211018 공지사항 상세조회
	@RequestMapping("/noticeSelectList")
	String noticeSelectList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);
		 if( vo.getCmmntyReplyCnt() > 0) {
			//댓글가져와야함
		 }
		model.addAttribute("notice", vo);
		return "notice/noticeSelectList";
	}

	// 211019 공지사항 글입력양식
	@RequestMapping("/noticeInsertForm")
	String noticeInsertForm() {
		return "notice/noticeInsertForm";
	}

	// 211019 공지사항 글입력
	@RequestMapping("/noticeInsert")
	String noticeInsert(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		int lists = cmmntyDao.cmmntyInsert(vo);

		System.out.println("공지사항:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "성공");
		} else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:noticeList";
	}

	// 211020 공지사항 글삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:noticeList";
	}

	// 211021 공지사항 글수정양식
	@PostMapping("/noticeUpdateForm")
	public String noticeUpdateForm(Model model, CmmntyVO vo){
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		vo = cmmntyDao.cmmntySelectList(vo);
		
		model.addAttribute("notice", vo);
		return "notice/noticeUpdateForm";
	}

	// 211020 공지사항 글수정
	@RequestMapping(value="/noticeUpdate")
	public String noticeUpdate(Model model, CmmntyVO vo) {
		System.out.println("============== 수 정 >>");
		System.out.println(vo.toString());
		
		
		
		int list = cmmntyDao.cmmntyUpdate(vo);
		if(list != 0) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:noticeList";
		
	}
	
}
