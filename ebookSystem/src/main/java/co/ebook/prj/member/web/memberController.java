package co.ebook.prj.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {

	@RequestMapping("/memberList")
	public String memberList(Model model) {
		return "member/memberList";
	}
}
