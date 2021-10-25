package co.ebook.prj.managerConfirm.service;

import java.util.List;

import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;

public interface ManagerConfirmService {
	List<ManagerConfirmVO> managerSelectList();
	
	ManagerConfirmVO managerSelect(ManagerConfirmVO vo);

	int managerConfirm(ManagerConfirmVO vo);

}
