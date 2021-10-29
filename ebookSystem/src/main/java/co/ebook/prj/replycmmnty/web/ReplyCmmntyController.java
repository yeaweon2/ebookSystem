package co.ebook.prj.replycmmnty.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.replycmmnty.service.ReplyCmmntyService;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

@RestController
public class ReplyCmmntyController {

	@Autowired
	private ReplyCmmntyService replyDao;

	// 댓글조회
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public List<ReplyCmmntyVO> replyList(Model model, ReplyCmmntyVO vo) {
		List<ReplyCmmntyVO> lists = replyDao.replyCmmntyList(vo);
		return lists;
	}

	// 댓글입력
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public Map replyInsert(Model model, @RequestBody ReplyCmmntyVO vo, HttpServletRequest request) {

		HttpSession session = request.getSession();
		vo.setCreplyWriter((String) session.getAttribute("id")); //댓글입력시 이름으로저장
		System.out.println(vo.toString());
		
		if(vo.getCreplyClass() == '0') {
			vo.setCreplyGr(vo.getCreplyId());
		}else if(vo.getCreplyClass() =='1') {
			vo.setCreplyGr(vo.getCreplyGr());
		};
		
		
		int result = replyDao.replyCmmntInsert(vo); 
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			map.put("result", "success");
			map.put("lists", replyDao.replyCmmntyList(vo));
		} else {
			map.put("result", "fail");
		}

		return map;

	}

	// 댓글수정
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.PUT)
	public Map replyUpdate(Model model, @RequestBody ReplyCmmntyVO vo, HttpServletRequest request) {
		
		vo.setCreplyWriter((String) request.getAttribute("id"));

		int result = replyDao.replyCmmntUpdate(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (result > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	// 댓글삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.DELETE)
	public Map replyDelete(@RequestBody ReplyCmmntyVO vo, Model model) {

		System.out.println(vo.toString());
		System.out.println("=================================댓글삭제");
		int result = replyDao.replyCmmntDelete(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (result > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

}