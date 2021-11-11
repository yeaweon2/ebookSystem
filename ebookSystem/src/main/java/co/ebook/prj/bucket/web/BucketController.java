package co.ebook.prj.bucket.web;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.bucket.service.BucketService;
import co.ebook.prj.bucket.vo.BucketVO;
import co.ebook.prj.bucket.vo.RutinVO;

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
	
	@RequestMapping("/bucketSearchList")
	@ResponseBody
	public List<BookVO> bucketSearchList(Model model, @RequestBody BookSrchVO vo ) {
		
		List<BookVO> lists = bucketDao.bucketSearChList(vo.getBookNm()); 
		return lists;
	}
	
	
	@RequestMapping("/bucketDone")
	@ResponseBody
	public HashMap<String,Object>  bucketDone(Model model, @RequestBody BucketVO vo, HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		int result = bucketDao.bucketUpdate(vo);
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "01");
			map.put("bucket", bucketDao.bucketDetail(vo));
		
		}else {
			map.put("result", "02");
		}
		return map;
		
	}
	
	@RequestMapping("/bucketDoneCancel")
	@ResponseBody
	public HashMap<String,Object>  bucketDoneCancel(Model model, @RequestBody BucketVO vo, HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		int result = bucketDao.bucketDoneCancelUpdate(vo);
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "01");
			map.put("bucket", bucketDao.bucketDetail(vo));
		
		}else {
			map.put("result", "02");
		}
		return map;
		
	}	
	
	
	
	@RequestMapping("/bucketDelete")
	@ResponseBody
	public HashMap<String,Object>  bucketDelete(Model model, @RequestBody BucketVO vo,  HttpServletRequest request ) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		int result = bucketDao.bucketDelete(vo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(result > 0 ) {
			map.put("result", "01");
			
		}else {
			map.put("result", "02");
		}
		return map;
	}	
	
	
	@RequestMapping("/bucketInsert")
	@ResponseBody
	public HashMap<String,Object>  bucketInsert(Model model, @RequestBody BucketVO vo,  HttpServletRequest request ) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		// 중복체크
		List<BucketVO> lists = bucketDao.bucketDuplChk(vo);
		
		if( lists.size() > 0 ) {
			map.put("result", "중복");
		} else {
			int result = bucketDao.bucketInsert(vo);
			
			if(result > 0 ) {
				map.put("result", "01");
				map.put("bucket", bucketDao.bucketDetail(vo));
			}else {
				map.put("result", "02");
			}
		}
		return map;
	}	
	
	@RequestMapping("/bookRutin")
	public String bookRutin(Model model , RutinVO vo, HttpServletRequest request ) {
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMM");
		Date today = new Date();
		String todayMM = format1.format(today);
		
		HttpSession session = request.getSession();

		vo.setGrDt(todayMM);
		vo.setMemberId((String)session.getAttribute("id"));
		
		List<RutinVO> loginRutin = bucketDao.bookLoginRutin(vo);
		List<RutinVO> lendRutin = bucketDao.bookLendRutin(vo);
		List<RutinVO> bucketRutin = bucketDao.bookBucketRutin(vo);
		
		
		
		model.addAttribute("todayMM", todayMM );
		model.addAttribute("loginRutin", loginRutin);
		model.addAttribute("lendRutin", lendRutin );
		model.addAttribute("bucketRutin", bucketRutin);
		
		return "bucket/bookRutin";
	}
	
	@RequestMapping("/bookRestRutin")
	@ResponseBody
	public HashMap<String, Object> bookRestRutin(Model model , @RequestBody RutinVO vo, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		List<RutinVO> loginRutin = bucketDao.bookLoginRutin(vo);
		List<RutinVO> lendRutin = bucketDao.bookLendRutin(vo);
		List<RutinVO> bucketRutin = bucketDao.bookBucketRutin(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("loginRutin", loginRutin);
		map.put("lendRutin", lendRutin);
		map.put("bucketRutin", bucketRutin);
		
		return map;		
	}
	
}
