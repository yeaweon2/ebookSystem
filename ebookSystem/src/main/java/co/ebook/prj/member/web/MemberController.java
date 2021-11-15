package co.ebook.prj.member.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.managerConfirm.mapper.ManagerConfirmMapper;
import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
import co.ebook.prj.member.mapper.MemberMapper;
import co.ebook.prj.member.vo.MemberVO;
import co.ebook.prj.subscription.service.SubscriptionService;
import co.ebook.prj.subscription.vo.SubscriptionVO;

@Controller
public class MemberController {

	@Autowired
	MemberMapper memberDao;
	
	@Autowired
	LoginService loginDao;
	
	@Autowired
	SubscriptionService subDao;
	
	@Autowired
	String filePath;
	
	@Autowired
	ManagerConfirmMapper manCoDao;
	
	
	
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
		return "redirect:home";
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
		return "redirect:home";
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
		vo = memberDao.memberSelect(vo);
		model.addAttribute("member", vo);
		return"member/myPage";
	}
	
		
//	마이페이지수정완료
	@RequestMapping("/myPageUpdate")
	public String myPage(Model model, MemberVO vo, MultipartFile attchFile, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int result = 0;
		vo.setMemberId((String)session.getAttribute("id"));	
		String fileName = "";
		String real_filePath = "";
		String folder = "/profile/";
		
		try {
			if ( attchFile != null ) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();	
					//filePath = request.getServletContext().getRealPath("/fileUp");	// 파일 저장경로
					real_filePath =  filePath + folder;								// 파일이 저장될 최종폴더

					// UUID.randomUUID().toString() + "_" +
					File fileSave = new File( real_filePath , fileName);
					System.out.println("----------------------------------------------> fileSave");
					System.out.println(fileSave);
					System.out.println("----------------------------------------------> fileSave");
					
					attchFile.transferTo(fileSave);			// 파일 업로드
				}else {
					filePath = "";
					fileName = "";
				}
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}			
		
		System.out.println( fileName );
		System.out.println( folder );
		
		vo.setMemberProfileNm(fileName);
		vo.setMemberProfilePath(folder);
	
		result = memberDao.myPageUpdate(vo);
		model.addAttribute("member", vo);
		
		session.setAttribute("subYn", "'Y'");
		session.setAttribute("memf",     vo.getMemberProfilePath());
		session.setAttribute("memfn",    vo.getMemberProfileNm());
		session.setAttribute("mile",     vo.getMemberMile());
		
		return "member/myInfo";
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
		ManagerConfirmVO mVo = new ManagerConfirmVO();
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));
		mVo.setMemberId((String)session.getAttribute("id"));
		
		sVo = subDao.subSelect(sVo);
		manCoDao.managerSelect(mVo);
		manCoDao.paySelect(mVo);
		
		model.addAttribute("sub", sVo);
		model.addAttribute("member", memberDao.memberSelect(vo));
		model.addAttribute("pay", manCoDao.paySelect(mVo));
		
		return "member/myInfo";
	}
	
//	월정액 결제성공 후 데이터 저장
	@RequestMapping("/SuccessSup") 
	public String SuccessSup(Model model , MemberVO vo, SubscriptionVO sVo, HttpServletRequest request, String args[]) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		sVo.setMemberId((String)session.getAttribute("id"));

		System.out.println("여기야여기==============================>"+vo.toString());
		System.out.println("여기야여기============================>"+sVo.toString());
		
		
		model.addAttribute("member", memberDao.memSubUpdate(vo));
		model.addAttribute("sub", subDao.subInsert(sVo));
		System.out.println("==============================?????????????????????" + vo);
		
		session.setAttribute("subYn", "'Y'");
		
		return "redirect:myInfo";
	} 
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}