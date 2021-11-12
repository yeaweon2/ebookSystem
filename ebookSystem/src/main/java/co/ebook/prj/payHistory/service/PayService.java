package co.ebook.prj.payHistory.service;

import java.util.List;

import co.ebook.prj.payHistory.vo.PayVO;

public interface PayService {

//	계약내역 전체조회
	List<PayVO> subSelectList();

//	회원한명내역 조회
	PayVO paySelect(PayVO vo);
	
//	계약
	int payInsert(PayVO vo);
	
//	내역수정
	int payUpdate(PayVO vo);
	
//	계약기간만료
	int payDelete(PayVO vo);
	

}
