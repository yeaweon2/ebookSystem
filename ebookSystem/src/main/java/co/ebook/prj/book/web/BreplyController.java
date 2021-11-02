package co.ebook.prj.book.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.book.service.BreplyService;
import co.ebook.prj.book.vo.BreplyVO;

@RestController
public class BreplyController {
	
	@Autowired
	BreplyService breplyDao; 	
	
	@RequestMapping("/breplyInsert")
	@ResponseBody
	public BreplyVO breplyInsert(Model model, @RequestBody BreplyVO vo, HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
				
		vo.setBreplyWriter((String)session.getAttribute("id"));
		vo.setBreplyCloseYn("N");
		
		vo.setBreplyClass(0);
		System.out.println("---------------------------댓글등록 >>");
		System.out.println(vo.toString());
		
		int result = breplyDao.breplyInsert(vo);
		if( result > 0 ) {
			vo = breplyDao.breplyDetail(vo);		
			model.addAttribute("msg", "01");	
		}else {
			model.addAttribute("msg", "02");
		}
		
		return vo;
	}
	
	@RequestMapping("/breplyDelete")
	@ResponseBody
	public BreplyVO breplyDelete(Model model, @RequestBody BreplyVO vo, HttpServletRequest request ) {
		
		int result = breplyDao.breplyDelete(vo);
		if( result > 0 ) {
			vo = breplyDao.breplyDetail(vo);		
			model.addAttribute("msg", "01");	
		}else {
			model.addAttribute("msg", "02");
		}
		
		return vo;
	}
	
	@RequestMapping("/breplyUpdate")
	@ResponseBody
	public BreplyVO breplyUpdate(Model model, @RequestBody BreplyVO vo, HttpServletRequest request ) {
		
		System.out.println("===================================>>");
		System.out.println(vo.toString());
		
		int result = breplyDao.breplyUpdate(vo);
		if( result > 0 ) {
			vo = breplyDao.breplyDetail(vo);		
			model.addAttribute("msg", "01");	
		}else {
			model.addAttribute("msg", "02");
		}
		
		return vo;
	}	
	
	@RequestMapping("/breplyChildInsert")
	@ResponseBody
	public BreplyVO breplyChildInsert(Model model, @RequestBody BreplyVO vo, HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
				
		vo.setBreplyWriter((String)session.getAttribute("id"));
		vo.setBreplyCloseYn("N");
		
		vo.setBreplyClass(1);
		System.out.println("---------------------------자식 댓글 등록 >>");
		System.out.println(vo.toString());
		
		
		int result = breplyDao.breplyInsert(vo);
		if( result > 0 ) {
			vo = breplyDao.breplyDetail(vo);		
			model.addAttribute("msg", "01");	
		}else {
			model.addAttribute("msg", "02");
		}
		
		return vo;
	}
	
}
