package co.ebook.prj.subscription.service;

import java.util.List;

import co.ebook.prj.subscription.vo.SubscriptionVO;


public interface SubscriptionService {
//	월정액내역 전체조회
	List<SubscriptionVO> subSelectList();

//	회원한명내역 조회
	SubscriptionVO subSelect(SubscriptionVO vo);
	
//	월정액가입
	int subInsert(SubscriptionVO vo);
	
//	월정액수정
	int subUpdate(SubscriptionVO vo);
	
//	월정액만료
	int subDelete(SubscriptionVO vo);
	
	}
