package co.ebook.prj.managerConfirm.web;

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

import co.ebook.prj.managerConfirm.service.ManagerConfirmService;
import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;

@Controller
public class ManagerConfirmController {
	
	@Autowired
	ManagerConfirmService managerCfDao;
	
	@Autowired
	MemberService memberDao;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
	
	
		
//  매니저목록조회(매니저관리)
	@RequestMapping("/managerList")
	public String managerList(Model model) {
		List<ManagerConfirmVO> lists = managerCfDao.managerSelectList();	
		
		model.addAttribute("lists", lists);
		return "manager/managerList";
	}
	
	
//	매니저상세조회  
	@RequestMapping("/managerSelect")
	String managerSelect(Model model, ManagerConfirmVO vo, MemberVO mVo) {
		
		System.out.println("============" + vo.toString());
		System.out.println("============" + managerCfDao.managerSelect(vo));
		model.addAttribute("member", memberDao.memberSelect(mVo));
		model.addAttribute("managerConfirm", managerCfDao.managerSelect(vo));
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
			System.out.println("=========>>" + vo.getMcnfmId());
			int result2 = managerCfDao.managerConfirm(vo);
			System.out.println("=-------------------------------------->> result2 > " + result2 );
		}
	}
	
//	업체등록폼
	@RequestMapping("/managerRegist")
	public String managerRegist(Model model) {
		return "manager/managerRegist";
	}
	
//	업체등록 성공
	@RequestMapping("/managerRegistSuccess")
	public String managerRegistSuccess(Model model, ManagerConfirmVO vo) {
		managerCfDao.managerRegistInsert(vo);
		return "manager/registList";
	}
	
//	매니저정보수정폼
	@RequestMapping("managerUpdateForm")
	public String memberUpdateForm(Model model, ManagerConfirmVO vo, MemberVO mVo, HttpSession session) {
		vo = managerCfDao.managerSelect(vo);
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
		managerCfDao.managerUpdate(vo);
		managerCfDao.managerConfirm(vo);
		model.addAttribute("member", mVo);
		model.addAttribute("managerConfirm", vo);
		return "redirect:managerList";
	}
	
}

