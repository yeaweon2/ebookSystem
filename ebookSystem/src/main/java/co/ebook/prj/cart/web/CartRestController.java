package co.ebook.prj.cart.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.ebook.prj.bcnfm.vo.BcnfmVO;
import co.ebook.prj.cart.service.CartService;
import co.ebook.prj.cart.vo.CartVO;

@RestController
public class CartRestController {

	@Autowired
	CartService cartDao;
	
	
	// 카트에 담기전에 중복체크
	@RequestMapping(value="/cartDuplCheck" , method=RequestMethod.POST) 
	public HashMap<String, Object> cartDuplCheck(Model model , @RequestBody CartVO vo, HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));
		
		vo = cartDao.cartDuplCheck(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (vo != null) {
			map.put("result", "01");
			map.put("book", vo);
		} else {
			map.put("result", "02");
		}
		return map;
	}	
	
	@RequestMapping(value="/cartDelete" , method=RequestMethod.DELETE) 
	public List<CartVO> cartDelete(Model model, @RequestBody List<CartVO> lists, HttpServletRequest request ) {
		
		System.out.println("============================>");
		
		HttpSession session = request.getSession();
		
		for(CartVO vo : lists) {
			vo.setMemberId((String)session.getAttribute("id"));
			cartDao.cartDelete(vo);
		}
		CartVO param = new CartVO();
		param.setMemberId((String)session.getAttribute("id"));
		List<CartVO> cartLists = cartDao.cartList(param);
		return cartLists;
		
	}	
	
	@RequestMapping("/cartRestList")
	public List<CartVO> cartRestList(Model model, @RequestBody CartVO vo, HttpServletRequest request){
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));  
		List<CartVO> lists = cartDao.cartList(vo);
		return lists;
	}	
}
