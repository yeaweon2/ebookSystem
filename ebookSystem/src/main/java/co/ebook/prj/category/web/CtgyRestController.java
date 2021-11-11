package co.ebook.prj.category.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;

@RestController
public class CtgyRestController {

	@Autowired 
	CtgyService ctgyDao;	
	
	@RequestMapping(value="/ctgyDetailList", method=RequestMethod.POST)
	public List<CtgyVO> ctgyDetailList(Model model, @RequestBody CtgyVO vo ) {
		
		System.out.println("------------------------->>");
		System.out.println(vo.getCtgyId());
		
		List<CtgyVO> lists = ctgyDao.ctgyDetailList(vo);
		
		return lists; 
	}	
	
	
	//등록
	@RequestMapping(value="/ctgyInsert" ,method=RequestMethod.POST) 
	public HashMap<String,Object> ctgyLcodeInsert(Model model , @RequestBody CtgyVO vo ) { 
		vo.setCtgyWriter("admin");
		int result = ctgyDao.ctgyInsert(vo);
		
		System.out.println("카테고리 : " + result + " 건 입력완료 ======> ");
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "입력완료");
		}else {
			map.put("result", "오류발생");
		}
		return map;
	}
	
	
	@RequestMapping(value="/ctgyUpdate" ,method=RequestMethod.PUT) 
	public HashMap<String,Object> ctgyUpdate(Model model , @RequestBody CtgyVO vo ) {
		vo.setCtgyWriter("admin");
		int result = ctgyDao.ctgyUpdate(vo);
		System.out.println("카테고리 : " + result + " 건 수정완료 ======> ");
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "입력완료");
		}else {
			map.put("result", "오류발생");
		}
		return map;
	}
	
	@RequestMapping(value="/ctgyDelete" ,method=RequestMethod.DELETE) 
	public HashMap<String,Object> ctgyDelete(Model model , @RequestBody CtgyVO vo ) {
		
		int result = ctgyDao.ctgyDelete(vo);
		System.out.println("카테고리 : " + result + " 건 삭제완료 ======> ");
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "입력완료");
		}else {
			map.put("result", "오류발생");
		}
		return map;
	}
	
	@RequestMapping(value="/ctgyLcodeList", method=RequestMethod.GET)
	public List<CtgyVO> ctgyLcodeList(Model model,  CtgyVO vo ) {
		
		List<CtgyVO> lists = ctgyDao.ctgyList();
		
		return lists; 
	}		
	
}
