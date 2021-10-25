package co.ebook.prj.managerConfirm.mapper;

import java.util.List;

import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;

public interface ManagerConfirmMapper {
	List<ManagerConfirmVO> managerSelectList();
	
	ManagerConfirmVO managerSelect(ManagerConfirmVO vo);
	
	int managerConfirm(ManagerConfirmVO vo);
}
