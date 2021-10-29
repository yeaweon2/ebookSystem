package co.ebook.prj.member.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberDao;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
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
			
			memberDao.memberCdUpdate(vo);
			
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
	
//	멤버삭제
	@RequestMapping("/memberDelete")
	public String memberDelete(Model model, MemberVO vo) {
		memberDao.memberDelete(vo);
		
		return "redirect:memberList";
	}
	
	
//	멤버수정폼
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm(Model model, MemberVO vo, HttpSession session) {
		vo = memberDao.memberSelect(vo);
		// vo.setMemberId((String)session.getAttribute("id")); 개인회원 마이페이지수정시에 session필요
		model.addAttribute("member", vo);
		return "member/memberUpdateForm";
		
	}
	
//	멤버정보수정
	@RequestMapping("/memberUpdate")
	public String memberUpdate(Model model, MemberVO vo) {
		System.out.println("===============================>>>>>>>>"+vo.toString());
		memberDao.memberUpdate(vo);
		model.addAttribute("member", vo);
		return "redirect:memberList";
	}
	
//	마이페이지
	@RequestMapping("/myPage")
	public String myPage(Model model, MemberVO vo, HttpSession session) {
		vo = memberDao.memberSelect(vo);
		//vo.setMemberId((String)session.getAttribute("id"));
		model.addAttribute("member", vo);
		return "member/myPage";
	}
	
//	월정액가입메인페이지
	@RequestMapping("/ticketList")
	public String ticketList(Model model) {
		return "member/ticketList";
	}
	
//	월정액가입폼
	@RequestMapping("/subscription")
	public String subscription(Model model) {
		return "member/subscription";
	}
	

	
}
