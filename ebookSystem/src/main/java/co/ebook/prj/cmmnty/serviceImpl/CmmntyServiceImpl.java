package co.ebook.prj.cmmnty.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.cmmnty.mapper.CmmntyMapper;
import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;

@Repository
public class CmmntyServiceImpl implements CmmntyService {
	@Autowired
	private CmmntyMapper map;
	
	@Override //커뮤니티 목록조회
	public List<CmmntyVO> cmmntyList(CmmntyVO vo) {
		
		return map.cmmntyList(vo);
	}

	@Override //커뮤니티 목록상세조회
	public CmmntyVO cmmntySelectList(CmmntyVO vo) {
		map.cmmntyHit(vo);
		return map.cmmntySelectList(vo);
	}
	
	@Override //커뮤니티 글쓰기
	public int cmmntyInsert(CmmntyVO vo) {
		return map.cmmntyInsert(vo);
	}

	@Override //커뮤니티 글수정
	public int cmmntyUpdate(CmmntyVO vo) {
		return map.cmmntyUpdate(vo);
	}

	@Override //커뮤니티 글삭제
	public int cmmntyDelete(CmmntyVO vo) {
		return map.cmmntyDelete(vo);
	}

	@Override //글카운터
	public int getCount(CmmntyVO vo) {
		return map.getCount(vo);
	}

	@Override
	public List<CmmntyVO> cmmntyContents(CmmntyVO vo) {
		return map.cmmntyContents(vo);
	}
	
	


}
