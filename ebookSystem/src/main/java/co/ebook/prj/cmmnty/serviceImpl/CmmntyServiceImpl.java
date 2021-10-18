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
	
	@Override //2021.10.17 커뮤니티 목록조회
	public List<CmmntyVO> cmmntyList(CmmntyVO vo) {
		return map.cmmntyList(vo);
	}

	@Override //20201.10.17 커뮤니티 상세목록조회
	public List<CmmntyVO> cmmntySelectList(CmmntyVO vo) {
		return map.cmmntySelectList(vo);
	}
	
	@Override //2021.10.17 커뮤니티 글쓰기
	public int CmmntyInsert(CmmntyVO vo) {
		return map.CmmntyInsert(vo);
	}

	@Override //2021.10.17 커뮤니티 글수정
	public int CmmntyUpdate(CmmntyVO vo) {
		return map.CmmntyUpdate(vo);
	}

	@Override //2021.10.17 커뮤니티 글삭제
	public int CmmntyDelete(CmmntyVO vo) {
		return map.CmmntyDelete(vo);
	}

}
