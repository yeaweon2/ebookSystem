package co.ebook.prj.cmmntyreply.web;

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

import co.ebook.prj.cmmntyreply.service.ReplyService;
import co.ebook.prj.cmmntyreply.vo.ReplyVO;

@RestController
public class ReplyRestController {

	@Autowired
	private ReplyService replyDao;

	// 댓글조회
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public List<ReplyVO> replyList(Model model, ReplyVO vo) {
		System.out.println(vo.toString());
		System.out.println("===========================댓글리스트");
		List<ReplyVO> lists = replyDao.replyList(vo);
		
		for(ReplyVO v : lists) {
			System.out.println(v.toString());	
		}
		
		model.addAttribute("list", lists);
		return lists;
	}

	// 댓글입력
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public Map replyInsert(Model model, @RequestBody ReplyVO vo, HttpServletRequest request) {

		HttpSession session = request.getSession();
		vo.setCreplyWriter((String) session.getAttribute("id")); //댓글입력시 이름으로저장
		
		int result = replyDao.replyInsert(vo); 
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			map.put("result", "success");
			map.put("lists", replyDao.replyList(vo));
		} else {
			map.put("result", "fail");
		}

		return map;

	}

	// 댓글수정
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.PUT)
	public Map replyUpdate(Model model, @RequestBody ReplyVO vo, HttpServletRequest request) {
		
		vo.setCreplyWriter((String) request.getAttribute("id"));

		int result = replyDao.replyUpdate(vo);
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
	public Map replyDelete(@RequestBody ReplyVO vo, Model model) {

		int result = replyDao.replyDelete(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (result > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

}