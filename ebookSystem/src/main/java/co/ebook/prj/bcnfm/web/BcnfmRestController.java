package co.ebook.prj.bcnfm.web;

import java.util.HashMap;
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
	public HashMap<String,Object> bookCnfrmReq(Model model , @RequestParam(value="tdArr[]") List<String> tdArr) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		BcnfmVO vo;
		int cnt = 0;
		for(int i = 0; i < tdArr.size() ; i++ ) {
			vo = new BcnfmVO();
			vo.setBookId(tdArr.get(i));
			
			BcnfmVO result = bcnfmDao.bcnfmReqDuplChk(vo);
			if( result.getBcnfmId() == 0 ) {		// 미처리건 ==> insert
				bcnfmDao.bcnfmInsert(vo);	
			}else {
				if("01".equals(result.getBcnfmStCd())){		// 처리중일경우 break
					map.put("bookNm", vo.getBookNm());
					map.put("bcnfmStCd", "01");
					break;
				}else if("02".equals(result.getBcnfmStCd())){	// 승인완료건	break
					map.put("bookNm", vo.getBookNm());
					map.put("bcnfmStCd", "02");
					break;
				}else {					// 보류건	==> insert
					bcnfmDao.bcnfmInsert(vo);
				}
			}
			cnt++;
		}
		
		if( tdArr.size() == cnt ) {
			map.put("bookNm", "all");
			map.put("bcnfmStCd", "00");	
		}
		
		return map;
	}
	

	// 관리자 승인 처리
	@RequestMapping(value="/bookCnfrmCancel" , method=RequestMethod.POST) 
	public void bookCnfrmCancel(Model model , @RequestBody List<BcnfmVO> lists , HttpSession session) {
		
		System.out.println("==========================>> ");
		System.out.println(lists.toString());
		System.out.println("==========================>> ");
		
		for(BcnfmVO vo : lists) {
			
			
			
			
			
			vo.setBcnfmStCd("01");
			bcnfmDao.bcnfmDelete(vo);
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
	@RequestMapping(value="/bookAdminCnfmCancel" , method=RequestMethod.POST) 
	public void bookAdminCnfmCancel(Model model , @RequestBody List<BcnfmVO> lists , HttpSession session) {
		
		System.out.println(lists.toString());
		
		for(BcnfmVO vo : lists) {
			vo.setBcnfmStCd("01");
			bcnfmDao.bcnfmCancelBookUpdate(vo);
			bcnfmDao.bcnfmUpdate(vo);
		}
	}		
	
	// 관리자 승인 처리
	@RequestMapping(value="/bookAdminReject" , method=RequestMethod.POST) 
	public HashMap<String,Object> bookAdminReject(Model model , @RequestBody List<BcnfmVO> lists , HttpSession session) {
		
		System.out.println(lists.toString());
		int result = 0;
		for(BcnfmVO vo : lists) {
			vo.setBcnfmCnfmr((String)session.getAttribute("id"));
			vo.setBcnfmStCd("03");
			
			int v = bcnfmDao.bcnfmUpdate(vo);
			result = result + v;
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "01");
		}else {
			map.put("result", "02");
		}
		return map;
	}		
	
	
}

