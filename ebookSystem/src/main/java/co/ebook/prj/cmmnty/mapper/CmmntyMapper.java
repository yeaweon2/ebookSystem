package co.ebook.prj.cmmnty.mapper;

import java.util.List;

import co.ebook.prj.cmmnty.vo.CmmntyVO;

public interface CmmntyMapper {
	//전체조회
	List<CmmntyVO> cmmntyList(CmmntyVO vo);
	
	//FAQ전체조회
	List<CmmntyVO> cmmntyContents(CmmntyVO vo);
	
	//단건조회
	CmmntyVO cmmntySelectList(CmmntyVO vo);
	int cmmntyInsert(CmmntyVO vo);
	
	//수정
	int cmmntyUpdate(CmmntyVO vo);
	
	//삭제
	int cmmntyDelete(CmmntyVO vo);
	
	//조회수
	int cmmntyHit(CmmntyVO vo);
	
	//댓글증가
	int cmmntyReplyCnt(CmmntyVO vo);
	
	//댓글감소
	int cmmntyReplyDel(CmmntyVO vo);
	
	//답변여부
	int cmmntyProcYN(CmmntyVO vo);
	
	//전체카운트
	int getCount(CmmntyVO vo);
	
	
}
