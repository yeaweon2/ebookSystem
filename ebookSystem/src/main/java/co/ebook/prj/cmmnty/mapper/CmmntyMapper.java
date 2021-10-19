package co.ebook.prj.cmmnty.mapper;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyMapper {
	List<CmmntyVO> cmmntyList(CmmntyVO vo);
	List<CmmntyVO> cmmntySelectList(CmmntyVO vo);
	int CmmntyInsert(CmmntyVO vo);
	int CmmntyUpdate(CmmntyVO vo);
	int CmmntyDelete(CmmntyVO vo);
}
