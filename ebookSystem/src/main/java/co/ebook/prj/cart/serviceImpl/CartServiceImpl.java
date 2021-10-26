package co.ebook.prj.cart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.ebook.prj.cart.mapper.CartMapper;
import co.ebook.prj.cart.service.CartService;
import co.ebook.prj.cart.vo.CartVO;

public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper map;
	
	@Override
	public List<CartVO> cartList() {
		return map.cartList();
	}

	@Override
	public int cartInsert(CartVO vo) {
		return map.cartInsert(vo);
	}

	@Override
	public int cartDelete(CartVO vo) {
		return map.cartDelete(vo);
	}

}
