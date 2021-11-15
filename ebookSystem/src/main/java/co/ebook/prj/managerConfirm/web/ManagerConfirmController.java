package co.ebook.prj.managerConfirm.web;

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

import co.ebook.prj.login.mapper.LoginMapper;
import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.vo.LoginVO;
import co.ebook.prj.managerConfirm.service.ManagerConfirmService;
import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;
import co.ebook.prj.subscription.vo.SubscriptionVO;

@Controller
public class ManagerConfirmController {
	
	
	@Autowired
	MemberService memberDao;
	
	@Autowired
	LoginMapper loginDao;
	
	
	@Autowired
	ManagerConfirmService manCoDao;
	
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	
		
//  매니저목록조회(매니저관리)
	@RequestMapping("/managerList")
	public String managerList(Model model) {
		List<ManagerConfirmVO> lists = manCoDao.managerSelectList();	
		
		model.addAttribute("lists", lists);
		return "manager/managerList";
	}
	
	
//	매니저상세조회  
	@RequestMapping("/managerSelect")
	String managerSelect(Model model, ManagerConfirmVO vo, MemberVO mVo) {
		
		System.out.println("============" + vo.toString());
		System.out.println("============" + manCoDao.managerSelect(vo));
		model.addAttribute("member", memberDao.memberSelect(mVo));
		model.addAttribute("managerConfirm", manCoDao.managerSelect(vo));
		return "manager/managerSelect";
	}
	
	
//	매니저승인상태변경(업체승인)
	@ResponseBody
	@RequestMapping("/managerCfChange") 
	public void managerCfChange(Model model ,@RequestParam(value="managerArr[]") List<String> managerArr) {
		ManagerConfirmVO vo;
		
		 
		for(int i = 0; i < managerArr.size() ; i++ ) {
			vo = new ManagerConfirmVO();
			vo.setMcnfmId(Integer.parseInt(managerArr.get(i)));

			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^-------------------------------------" + vo.toString());
			int result2 = manCoDao.managerConfirm(vo);
			
		}
	}
	
//	업체등록폼
	@RequestMapping("/managerRegist")
	public String managerRegist(Model model) {
		return "manager/managerRegist";
	}
	
//	업체등록 성공
	@RequestMapping("/managerRegistSuccess")
	public String managerRegistSuccess(Model model, ManagerConfirmVO vo, MemberVO mVo, HttpSession session) {
		
		vo.setMemberId((String)session.getAttribute("id"));
		
		manCoDao.managerRegistInsert(vo);
		manCoDao.managerconfirmUpdate(vo);
		
		model.addAttribute("man", manCoDao.managerSelect(vo));
		return "manager/registSelect";
	}

	
	
//	업체정보등록 페이지 호출
	@RequestMapping("/registSelect")
	public String registSelect(Model model, ManagerConfirmVO vo, MemberVO mVo, HttpSession session) {
		vo.setMemberId((String)session.getAttribute("id"));
		
		model.addAttribute("man", manCoDao.managerSelect(vo));
		return "manager/registSelect";
	}
	
	
	
	
//	계약결제성공 후 데이터 저장
	@RequestMapping("/SuccessPay") 
	public String SuccessPay(Model model , ManagerConfirmVO mVo,  HttpServletRequest request, String args[]) {
		
		MemberVO vo = new MemberVO();
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		mVo.setMemberId((String)session.getAttribute("id"));

		
		System.out.println("!!!!!!!!!!!!!여기야여기============================>"+mVo.toString());
		
		
		
		memberDao.memSubUpdate(vo);
		manCoDao.manSubUpdate(mVo);
		
		model.addAttribute("man", manCoDao.managerSelect(mVo));
		
		System.out.println("!!!!!!-----------------------" +mVo.toString());
		
		
		manCoDao.payInsert(mVo);
		
		model.addAttribute("pay", manCoDao.paySelect(mVo));
		
		System.out.println("??????????==============================?????????????????????" + vo);
		
		session.setAttribute("subYn", "'Y'");
		
		return "redirect:myInfo";
	} 
	
	
	

	//	매니저정보수정폼
	@RequestMapping("managerUpdateForm")
	public String memberUpdateForm(Model model, ManagerConfirmVO vo, MemberVO mVo, HttpSession session) {
		vo = manCoDao.managerSelect(vo);
		mVo = memberDao.memberSelect(mVo);
		// vo.setMemberId((String)session.getAttribute("id")); 개인회원 마이페이지수정시에 session필요
		model.addAttribute("member", mVo);
		model.addAttribute("managerConfirm", vo);
		return "manager/managerUpdateForm";
		
	}
	
//	매니저정보수정
	@RequestMapping("/managerUpdate")
	public String managerUpdate(Model model, ManagerConfirmVO vo, MemberVO mVo) {
		memberDao.memberUpdate(mVo);
		manCoDao.managerUpdate(vo);
		manCoDao.managerConfirm(vo);
		model.addAttribute("member", mVo);
		model.addAttribute("managerConfirm", vo);
		return "redirect:managerList";
	}
	
	
	
}

