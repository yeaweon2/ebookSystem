package co.ebook.prj.sche.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheController {
	
	@RequestMapping("/scheList")
	public String scheList(Model model) {
		
		return "sche/scheList";
	}
}
