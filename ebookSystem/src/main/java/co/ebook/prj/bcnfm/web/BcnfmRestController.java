package co.ebook.prj.bcnfm.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="/bookCnfrmReq" , method=RequestMethod.POST) 
	public void bookCnfrmReq(Model model , @RequestParam(value="tdArr") String[]  tdArr) {
		System.out.println("--------------------->>> ");
		System.out.println(tdArr.length);
		BcnfmVO vo;
		for(int i = 0; i < tdArr.length ; i++ ) {
			vo = new BcnfmVO();
			vo.setBookId(tdArr[i]);
			bcnfmDao.bcnfmInsert(vo);	
		}
	}
}
