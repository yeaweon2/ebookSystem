package co.ebook.prj.cmmnty.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;

@Controller
public class MyWrtingController {
	@Autowired
	private CmmntyService cmmntyDao;
	
	
	@RequestMapping("/myWriting")
	String inquireList(Model model, CmmntyVO vo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		
		List<CmmntyVO> list = cmmntyDao.cmmntyList(vo);
		model.addAttribute("lists", list);
		return "cmmnty/myWriting";
	}
	
}
