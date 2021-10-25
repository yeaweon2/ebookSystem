package co.ebook.prj.cmmnty.service;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyService {
	//전체조회
	List<CmmntyVO> cmmntyList(CmmntyVO vo); 
	//한건조회
	CmmntyVO cmmntySelectList(CmmntyVO vo);
	int cmmntyInsert(CmmntyVO vo);
	int cmmntyUpdate(CmmntyVO vo);
	int cmmntyDelete(CmmntyVO vo);
}
