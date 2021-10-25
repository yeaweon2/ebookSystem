package co.ebook.prj.cmmnty.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.replycmmnty.service.ReplyCmmntyService;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

@Controller
public class CmmntyController {
	// 211017 DAO연결하기
	@Autowired
	private CmmntyService cmmntyDao;
	
	@Autowired
	private ReplyCmmntyService replyDao;

	// 211017 커뮤니티 전체조회
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("notices", lists);
		return "cmmnty/noticeList";
	}

	// 211018 커뮤니티 상세조회
	@RequestMapping("/noticeSelectList")
	String noticeSelectList(Model model, CmmntyVO vo) throws Exception {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);
		 //댓글리스트조회
		 if( vo.getCmmntyReplyCnt() > 0) {
			 ReplyCmmntyVO rVo = new ReplyCmmntyVO();
			 rVo.setCmmntyId(vo.getCmmntyId());
			 
			 List<ReplyCmmntyVO> lists = replyDao.ReplycmmntyList(rVo);
			 
			 model.addAttribute("replys", lists);
		 }
		 
		model.addAttribute("notice", vo);
		return "cmmnty/noticeSelectList";
	}

	// 211019 커뮤니티 글입력양식
	@RequestMapping("/noticeInsertForm")
	String noticeInsertForm() {
		return "cmmnty/noticeInsertForm";
	}

	// 211019커뮤니티 글입력
	@RequestMapping("/noticeInsert")
	String noticeInsert(Model model, CmmntyVO vo) throws Exception {
		cmmntyDao.cmmntyInsert(vo);
		vo.setCmmntyWriter("admin");
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

	// 211020 커뮤니티 글삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:noticeList";
	}

	// 211021 커뮤니티 글수정양식
	@PostMapping("/noticeUpdateForm")
	public String noticeUpdateForm(Model model, CmmntyVO vo){
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		vo = cmmntyDao.cmmntySelectList(vo);
		
		model.addAttribute("notice", vo);
		return "cmmnty/noticeUpdateForm";
	}

	// 211020 커뮤니티 글수정
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
