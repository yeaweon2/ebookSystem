package co.ebook.prj.cmmnty.mapper;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyMapper {
	List<CmmntyVO> cmmntyList(CmmntyVO vo);
	List<CmmntyVO> cmmntySelectList(CmmntyVO vo);
	int cmmntyInsert(CmmntyVO vo);
	int cmmntyUpdate(CmmntyVO vo);
	int cmmntyDelete(CmmntyVO vo);
}
