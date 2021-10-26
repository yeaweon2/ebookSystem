package co.ebook.prj.cart.mapper;

import java.util.List;

import co.ebook.prj.cart.vo.CartVO;

public interface CartMapper {
	
	List<CartVO> cartList();
	
	int cartInsert(CartVO vo);
	
	int cartDelete(CartVO vo);
}
