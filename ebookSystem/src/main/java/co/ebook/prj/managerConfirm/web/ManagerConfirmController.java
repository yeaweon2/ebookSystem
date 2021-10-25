package co.ebook.prj.managerConfirm.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
//  매니저목록조회(매니저관리)
	@RequestMapping("/managerList")
	public String managerList(Model model) {
		List<ManagerConfirmVO> lists = managerCfDao.managerSelectList();	
		
		model.addAttribute("lists", lists);
		return "manager/managerList";
	}
	
//	매니저승인상태변경(업체승인)
	@ResponseBody
	@RequestMapping("/managerCfChange") 
	public void managerCfChange(Model model ,@RequestParam(value="managerArr[]") List<String> managerArr) {
		ManagerConfirmVO vo;
		 
		for(int i = 0; i < managerArr.size() ; i++ ) {
			vo = new ManagerConfirmVO();
			vo.setMemberId(managerArr.get(i));
			System.out.println(vo.getMemberId());
			int result2 = managerCfDao.managerConfirm(vo);
			System.out.println("=-------------------------------------->> result2 > " + result2 );
		}
	}
}
