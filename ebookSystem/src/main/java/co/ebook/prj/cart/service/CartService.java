package co.ebook.prj.cart.service;

import java.util.List;

import co.ebook.prj.cart.vo.CartVO;

public interface CartService {

	List<CartVO> cartList(CartVO vo);
	
	int cartInsert(CartVO vo);
	
	int cartDelete(CartVO vo);
	
	CartVO cartDuplCheck(CartVO vo);
}
