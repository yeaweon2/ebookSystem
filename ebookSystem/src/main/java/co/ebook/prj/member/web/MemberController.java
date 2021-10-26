package co.ebook.prj.member.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.bcnfm.vo.BcnfmVO;
import co.ebook.prj.category.vo.CtgyVO;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberDao;
	
//  멤버전체조회(멤버관리)
	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberVO> lists = memberDao.memberSelectList();	
		
		model.addAttribute("lists", lists);
		return "member/memberList";
	}
	
//	멤버상세조회
	@RequestMapping("/memberSelect")
	String memberSelect(Model model, MemberVO vo) {
		System.out.println("============" + vo.toString());
		System.out.println("============" + memberDao.memberSelect(vo));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/memberSelect";
	}

//	멤버회원가입
	@RequestMapping("/memberJoin")
	public String memberJoin(Model model) {
		return "member/memberJoin";
	}

//  개인회원가입폼
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		return "member/memberJoinForm";
	}
	
//	개인회원가입성공 시 
	@RequestMapping("/memberJoinSuccess")
	public String memberJoinSuccess(Model model, MemberVO vo) {
		memberDao.memberInsert(vo);
		return "main/home";
	}
	
//	기업회원가입폼
	@RequestMapping("/managerJoinForm")
	public String managerJoinForm(Model model) {
		return "manager/managerJoinForm";
	}
	
//	기업회원가입성공 시 
	@RequestMapping("/managerJoinSuccess")
	public String managerJoinSuccess(Model model, MemberVO vo) {
		memberDao.managerInsert(vo);
		return "main/home";
	}
	
//	멤버상태코드변경(휴면회원해제)
	@ResponseBody
	@RequestMapping("/memberCdChange") 
	public void memberCdChange(Model model ,@RequestParam(value="memArr[]") List<String> memArr) {
		MemberVO vo;
		for(int i = 0; i < memArr.size() ; i++ ) {
			vo = new MemberVO();
			vo.setMemberId(memArr.get(i));
			
			memberDao.memberDelete(vo);
		}
		
	}
	
//	아이디중복체크
	@ResponseBody
	@RequestMapping("/checkMemberId") 
	//public int checkMemberId(Model model ,@RequestParam(value="memberChkId") String memberId) {
	public int checkMemberId(Model model ,@RequestParam(value="memberId") String memberId) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		
		int checkCnt = memberDao.memberCheck(vo);
		return checkCnt;
		// return memberDao.memberCheck(vo); 
	}
	
//	닉네임중복체크
	@ResponseBody
	@RequestMapping("/checkNickName") 
	public int checkNickName(Model model ,@RequestParam(value="memberNicknm") String memberNicknm) {
		MemberVO vo = new MemberVO();
		vo.setMemberNicknm(memberNicknm);
		
		 return memberDao.nickNnCheck(vo); 
	}
}
