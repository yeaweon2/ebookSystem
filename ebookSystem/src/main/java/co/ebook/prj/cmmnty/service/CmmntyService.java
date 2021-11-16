package co.ebook.prj.cmmnty.service;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyService {
	
	//전체조회(컨텐츠X)
	List<CmmntyVO> cmmntyList(CmmntyVO vo); 
	
	//FAQ전체조회

	
	//한건 상세조회
	CmmntyVO cmmntySelectList(CmmntyVO vo);
	
	//글입력
	int cmmntyInsert(CmmntyVO vo);
	
	//글수정
	int cmmntyUpdate(CmmntyVO vo);
	
	//글삭제
	int cmmntyDelete(CmmntyVO vo);
	
	//글카운터
	int getCount(CmmntyVO vo);
	
}
