package co.ebook.prj.member.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.category.vo.CtgyVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberDao;
	
	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberVO> lists = memberDao.memberSelectList();	
		model.addAttribute("lists", lists);
		return "member/memberList";
	}
	
	@RequestMapping("/memberJoin")
	public String memberJoin(Model model) {
		return "member/memberJoin";
	}
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		return "member/memberJoinForm";
	}
	
	@RequestMapping("/memberJoinSuccess")
	public String memberJoinSuccess(Model model, MemberVO vo) {
		memberDao.memberInsert(vo);
		return "member/memberJoinForm";
	}
	
	
	
	@RequestMapping("/managerJoinForm")
	public String managerJoinForm(Model model) {
		return "member/managerJoinForm";
	}
	
}
