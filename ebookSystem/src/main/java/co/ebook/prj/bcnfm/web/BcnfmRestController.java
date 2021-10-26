package co.ebook.prj.bcnfm.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.bcnfm.service.BcnfmService;
import co.ebook.prj.bcnfm.vo.BcnfmVO;

@RestController
public class BcnfmRestController {
	   
	@Autowired
	BcnfmService bcnfmDao;
	
	// BOOK 등록후 승인 신청
	@RequestMapping(value="/bookCnfrmReq" , method=RequestMethod.POST) 
	public void bookCnfrmReq(Model model , @RequestParam(value="tdArr[]") List<String> tdArr) {
		BcnfmVO vo;
		for(int i = 0; i < tdArr.size() ; i++ ) {
			vo = new BcnfmVO();
			vo.setBookId(tdArr.get(i));
			bcnfmDao.bcnfmInsert(vo);
		}
	}
	
	// 관리자 승인 처리
	@RequestMapping(value="/bookAdminCnfm" , method=RequestMethod.POST) 
	public void bookAdminCnfm(Model model , @RequestBody List<BcnfmVO> lists , HttpSession session) {
		
		System.out.println(lists.toString());
		
		for(BcnfmVO vo : lists) {
			vo.setBcnfmCnfmr((String)session.getAttribute("id"));
			vo.setBcnfmStCd("02");
			bcnfmDao.bcnfmUpdate(vo);
		}
	}	
	
	// 관리자 승인 처리
	@RequestMapping(value="/bookAdminReject" , method=RequestMethod.POST) 
	public void bookAdminReject(Model model , @RequestBody List<BcnfmVO> lists , HttpSession session) {
		
		System.out.println(lists.toString());
		
		for(BcnfmVO vo : lists) {
			vo.setBcnfmCnfmr((String)session.getAttribute("id"));
			vo.setBcnfmStCd("03");
			bcnfmDao.bcnfmUpdate(vo);
		}
	}		
	
	
}

