package co.ebook.prj.payHistory.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.ebook.prj.payHistory.mapper.PayMapper;
import co.ebook.prj.payHistory.service.PayService;
import co.ebook.prj.payHistory.vo.PayVO;

public class PayServiceImpl implements PayService {

	@Autowired
	PayMapper map;
	
	@Override
	public List<PayVO> subSelectList() {
		return null;
	}

	@Override
	public PayVO paySelect(PayVO vo) {
		return null;
	}

	@Override
	public int payInsert(PayVO vo) {
		return map.payInsert(vo);
	}

	@Override
	public int payUpdate(PayVO vo) {
		return 0;
	}

	@Override
	public int payDelete(PayVO vo) {
		return 0;
	}

}
