package co.ebook.prj.bucket.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.bucket.service.BucketService;
import co.ebook.prj.bucket.vo.BucketVO;

@Controller
public class BucketController {
	
	@Autowired
	BucketService bucketDao;
	
	@RequestMapping("/bucketList")
	public String bucketList(Model model, HttpServletRequest request, BucketVO vo) {
		
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		List<BucketVO> lists = bucketDao.bucketList(vo);
		model.addAttribute("lists", lists);
		return "bucket/bucketList";
	}
}
