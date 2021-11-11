package co.ebook.prj.cart.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.cart.service.CartService;
import co.ebook.prj.cart.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	CartService cartDao;
	
	@RequestMapping("/cartList")
	public String cartList(Model model, CartVO vo, HttpServletRequest request){
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));  
		List<CartVO> lists = cartDao.cartList(vo);
		model.addAttribute("lists", lists);
		return "cart/cartList";
	}
	
	@RequestMapping("/cartInsert")
	public String cartInsert(Model model, CartVO vo , HttpServletRequest request){
		
		HttpSession session = request.getSession();
		vo.setMemberId((String)session.getAttribute("id"));  
		System.out.println(vo.toString());
		cartDao.cartInsert(vo);
		
		List<CartVO> lists = cartDao.cartList(vo);
		model.addAttribute("lists", lists);
		
		return "cart/cartList"; 
	}
	
	
}
