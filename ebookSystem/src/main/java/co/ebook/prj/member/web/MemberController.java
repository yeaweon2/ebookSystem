package co.ebook.prj.member.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;
import co.ebook.prj.subscription.service.SubscriptionService;
import co.ebook.prj.subscription.vo.SubscriptionVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberDao;
	
	@Autowired
	LoginService loginDao;
	
	@Autowired
	SubscriptionService subDao;
	
	
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
		System.out.println("============>>>>>>>>>>>>>>>여기여기>>>>" + vo.toString());
		
		SubscriptionVO sVo =  new SubscriptionVO();
		sVo.setMemberId(vo.getMemberId());
		sVo = subDao.subSelect(sVo);
		vo = memberDao.memberSelect(vo);
		
		model.addAttribute("sub", sVo);
		model.addAttribute("member", vo);
		
		
		
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
	public String myPage(Model model, MemberVO vo, SubscriptionVO sVo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));
		sVo = subDao.subSelect(sVo);
		model.addAttribute("sub", sVo);
		System.out.println("==============1===========1==========>>>>" +vo.toString());
		vo = memberDao.memberSelect(vo);
		model.addAttribute("member", vo);
		return"member/myPage";
	}
	
	
//	마이페이지수정완료
	@RequestMapping("/myPageUpdate")
	public String myPage(Model model, MemberVO vo) {
		System.out.println("===!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+vo.toString());
		memberDao.memberUpdate(vo);
		model.addAttribute("member", vo);
		return"redirect:myPage";
	}
	
	
//	월정액가입메인페이지
	@RequestMapping("/ticketList")
	public String ticketList(Model model) {
		return "member/ticketList";
	}
	
//	월정액가입폼
	@RequestMapping("/subscription")
	public String subscription(Model model, MemberVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/subscription";
	}
	
//	마이페이지 메인
	@RequestMapping("/myInfo")
	public String myInfo(Model model, MemberVO vo, SubscriptionVO sVo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));
		sVo = subDao.subSelect(sVo);
		model.addAttribute("sub", sVo);
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/myInfo";
	}
	
//	월정액 결제성공 후 데이터 저장
	@RequestMapping("/SuccessSup") 
	public String SuccessSup(Model model ,  MemberVO vo, SubscriptionVO sVo, HttpServletRequest request, String args[]) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));

		System.out.println("여기야여기============>"+vo.toString());
		System.out.println("여기야여기============>"+sVo.toString());
		
		
		// 날짜계산값 
	    
       /* Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("current: " + df.format(cal.getTime()));

        
        if(sVo.getSubspAmt() == 9900) {
        	sVo.setSubspEdt((Date)session.getAttribute("cal.add(Calendar.MONTH, 1)"));
        	
        	String pattern = "yyyy-MM-dd";
        	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        	String date = simpleDateFormat.format(new Date());
        	System.out.println(date);
        }
        if(sVo.getSubspAmt() == 25900) {
        	sVo.setSubspEdt((Date)session.getAttribute("cal.add(Calendar.MONTH, 3)"));
        	
        	String pattern = "yyyy-MM-dd";
        	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        	String date = simpleDateFormat.format(new Date());
        	System.out.println(date);
        }
        if(sVo.getSubspAmt() == 99000) {
        	sVo.setSubspEdt((Date)session.getAttribute("cal.add(Calendar.MONTH, 12)"));
        	
        	String pattern = "yyyy-MM-dd";
        	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        	String date = simpleDateFormat.format(new Date());
        	System.out.println(date);
        } */

        
        
        
        model.addAttribute("member", memberDao.memSubUpdate(vo));
		model.addAttribute("sub", subDao.subInsert(sVo));
		return "redirect:myInfo";
	} 
	
	
	

}