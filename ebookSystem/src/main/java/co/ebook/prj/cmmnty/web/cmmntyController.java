package co.ebook.prj.cmmnty.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class cmmntyController {
	
	@RequestMapping("/noticeList")
	public String noticeList(Model model) {
		return "notice/noticeList";
	}  
}
