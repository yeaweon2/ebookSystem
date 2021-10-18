package co.ebook.prj.cmmnty.service;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyService {
	List<CmmntyVO> cmmntyList(CmmntyVO vo);
	List<CmmntyVO> cmmntySelectList(CmmntyVO vo);
	int CmmntyInsert(CmmntyVO vo);
	int CmmntyUpdate(CmmntyVO vo);
	int CmmntyDelete(CmmntyVO vo);
}
