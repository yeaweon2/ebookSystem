package co.ebook.prj.managerConfirm.mapper;

import java.util.List;

import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
import co.ebook.prj.payHistory.vo.PayVO;

public interface ManagerConfirmMapper {
//	매니저전체조회
	List<ManagerConfirmVO> managerSelectList();
	
//	매니저상세조회
	ManagerConfirmVO managerSelect(ManagerConfirmVO vo);
	
//	매니저승인상태변경(관리자:승인중 -> 승인)
	int managerConfirm(ManagerConfirmVO vo);
	
//	매니저승인신청수정(관리자:승인상태 N -> Y)
	int managerconfirmUpdate(ManagerConfirmVO vo);
	
//	매니저승인신청(업체등록신청)
	int managerRegistInsert(ManagerConfirmVO vo);
	
//	매니저정보수정(매니저정보수정)
	int managerUpdate(ManagerConfirmVO vo);
	
//	매니저계약체결
	int manSubUpdate(ManagerConfirmVO vo);
	
//	결제내역
	int payInsert(PayVO vo);
}
