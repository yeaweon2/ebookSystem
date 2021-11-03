package co.ebook.prj.subscription.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.ebook.prj.subscription.mapper.SubscriptionMapper;
import co.ebook.prj.subscription.service.SubscriptionService;
import co.ebook.prj.subscription.vo.SubscriptionVO;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	
	@Autowired
	SubscriptionMapper map;
	
//	전체조회
	@Override
	public List<SubscriptionVO> subSelectList() {
		return map.subSelectList();
	}

//	한건조회
	@Override
	public SubscriptionVO subSelect(SubscriptionVO vo) {
		return map.subSelect(vo);
	}

//	월정액가입
	@Override
	public int subInsert(SubscriptionVO vo) {
		return map.subInsert(vo);
	}

//	월정액수정
	@Override
	public int subUpdate(SubscriptionVO vo) {
		return map.subUpdate(vo);
	}

//	월정액만료
	@Override
	public int subDelete(SubscriptionVO vo) {
		return map.subDelete(vo);
	}

}
