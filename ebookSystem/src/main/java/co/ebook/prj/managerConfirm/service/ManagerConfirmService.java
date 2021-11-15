package co.ebook.prj.managerConfirm.service;

import java.util.List;

import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;

public interface ManagerConfirmService {
//	매니저전체조회
	List<ManagerConfirmVO> managerSelectList();
	
//	매니저상세조회
	ManagerConfirmVO managerSelect(ManagerConfirmVO vo);
	
//	매니저승인상태변경
	int managerConfirm(ManagerConfirmVO vo);
	
//	매니저승인신청수정
	int managerconfirmUpdate(ManagerConfirmVO vo);
	
//	매니저승인신청
	int managerRegistInsert(ManagerConfirmVO vo);
	
//	매니저정보수정
	int managerUpdate(ManagerConfirmVO vo);
	
//	매니저계약체결
	int manSubUpdate(ManagerConfirmVO vo);
	
//	결제내역
	int payInsert(ManagerConfirmVO vo);
	
//	결제내역조회
	ManagerConfirmVO paySelect(ManagerConfirmVO vo);
}
