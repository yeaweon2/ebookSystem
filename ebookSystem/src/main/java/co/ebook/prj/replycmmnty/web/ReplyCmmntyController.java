package co.ebook.prj.replycmmnty.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
	public List<ReplyCmmntyVO> ReplycmmntyList(Model model, ReplyCmmntyVO vo) {

		List<ReplyCmmntyVO> lists = replyDao.ReplycmmntyList(vo);
		return lists;
	}

	// 댓글입력
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public void replyInsert(Model model, @RequestBody ReplyCmmntyVO vo) {
		System.out.println("======================>");
		System.out.println(vo.toString());
		
		vo.setCreplyWriter("admin");
		
//		  int result = replyDao.ReplycmmntInsert(vo); 
//		  HashMap<String, Object> map = new HashMap<String, Object>(); 
//		  if (result > 0) { 
//			  map.put("result", "success");
//			  map.put("reply", map); 
//		  } else { 
//			  map.put("result", "fail"); } 
//		  
//		  return map;
		 
	}

	// 댓글수정
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.PUT)
	public Map ReplyUpdate(Model model, @RequestBody ReplyCmmntyVO vo) {
		int result = replyDao.ReplycmmntInsert(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			map.put("result", "success");
			map.put("reply", map);
		} else {
			map.put("result", "fail");
		}
		return map;
	}
}