package co.ebook.prj.replycmmnty.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	public Map replyInsert(Model model, @RequestBody ReplyCmmntyVO vo) {

		vo.setCreplyWriter("admin");
		
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
		   System.out.println(vo.toString());
		   System.out.println("===============댓글수정");
		   
		   vo.setCreplyWriter((String)request.getAttribute("id"));
		   
		  int result = replyDao.replyCmmntUpdate(vo);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      if (result > 0) {
	         map.put("result", "success");
	         map.put("reply", replyDao.replyCmmntUpdate(vo));
	      } else {
	         map.put("result", "fail");
	      }
	      return map;
	   }
	   
	 
	   //댓글삭제
	   @RequestMapping(value="/replyDelete{creplyId}", method=RequestMethod.DELETE)
	   public Map replyDelete (@PathVariable int creplyId, ReplyCmmntyVO vo, Model model){
	      vo.setCreplyId(creplyId);
	      int result = replyDao.replyCmmntDelete(vo);
	      HashMap<String,Object> map = new HashMap<String,Object>();
	      
	      if(result > 0) {
	         map.put("result", "success");   
	      } else {
	         map.put("result", "fail");
	      }
	      
	      return map; 
	   }


}