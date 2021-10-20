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
	//211017 DAO연결하기
	@Autowired 
	private CmmntyService cmmntyDao; 
	
	//211017 공지사항전체조회
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("notices", lists);
		return "notice/noticeList";
	}		
	
	//211018 공지사항세부조회
	@RequestMapping("/noticeSelectList")
	String noticeSelectList(Model model, CmmntyVO vo) {
		System.out.println("-------------------------------------");
		System.out.println(vo.getCmmntyId());
		
		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		List<CmmntyVO> lists = cmmntyDao.cmmntySelectList(vo);
		model.addAttribute("notices", lists);
		return "notice/noticeSelectList";
	}
	
	//211019 공지사항글쓰기양식
	@RequestMapping("/noticeWriterForm")
	String noticeWriterForm() {
		return "notice/noticeWriterForm";
	}
	
	//211019 공지사항글쓰기입력
	@RequestMapping("/noticeInsert")
	String noticeInsert(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		vo.setCmmntyWriter("admin");
		int lists = cmmntyDao.cmmntyInsert(vo);
		
		System.out.println("공지사항:"+ lists +"건 입력완료 --------------");
		if(lists > 0) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "실패");
		}
		return "redirect:noticeList";
	}
	
}
