package co.ebook.prj.lend.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.ebook.prj.bcnfm.vo.BcnfmVO;
import co.ebook.prj.bucket.vo.BucketVO;
import co.ebook.prj.lend.service.LendService;
import co.ebook.prj.lend.vo.LendVO;

@Controller
public class LendController {

	@Autowired
	LendService lendDao;
	
	
	@RequestMapping("/lendInsert")
	@ResponseBody
	public HashMap<String, Object> lendInsert(Model model, HttpServletRequest request, @RequestBody List<LendVO> lists) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int result = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if( id == null || "".equals(id)) {
			map.put("result", "04");	// 세션 종료됨
		}else {
			for(LendVO vo : lists) {
				vo.setMemberId(id);	
				System.out.println("=================================>");
				System.out.println(vo.toString());
				
				int duplchk = lendDao.lendDuplChk(vo);
				
				if( duplchk > 0 ) {
					map.put("result", "03");	// 중복
				}else {
					result = lendDao.lendInsert(vo);
					if( result > 0 ) {
						map.put("result", "01");	//성공
					}else {
						map.put("result", "02");	//실패
					}
				}
			}
		}
		
		return map;
	}
	
	@RequestMapping("/lendInsertOne")
	@ResponseBody
	public HashMap<String, Object> lendInsertOne(Model model, HttpServletRequest request, @RequestBody LendVO vo) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int result = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if( id == null || "".equals(id)) {
			map.put("result", "04");	// 세션 종료됨
		}else {
			vo.setMemberId(id);	
			System.out.println("=================================>");
			System.out.println(vo.toString());
			
			int duplchk = lendDao.lendDuplChk(vo);
			
			if( duplchk > 0 ) {
				map.put("result", "03");	// 중복
			}else {
				result = lendDao.lendInsert(vo);
				if( result > 0 ) {
					map.put("result", "01");	//성공
				}else {
					map.put("result", "02");	//실패
				}
			}
		}
		
		return map;
	}
	

	@RequestMapping("/lendList")
	public String lendList(Model model, HttpServletRequest request, LendVO vo) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		List<LendVO> lists = lendDao.lendList(vo);
		model.addAttribute("lends", lists);
		
		return "lend/lendList";
	}
	
	
	@RequestMapping("/lendDelete")
	@ResponseBody
	public HashMap<String, Object> lendDelete(Model model, HttpServletRequest request, @RequestBody LendVO vo) {
			
		int	result = lendDao.lendDelete(vo);			
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0 ) {
			map.put("result", "01");
		} else {
			map.put("result", "02");
		}
		
		return map;
	}
	
	
	
	
}
