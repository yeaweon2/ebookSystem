package co.ebook.prj.replycmmnty.servieImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.replycmmnty.mapper.ReplyCmmntyMapper;
import co.ebook.prj.replycmmnty.service.ReplyCmmntyService;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

@Repository
public class ReplyCmmntyServiceImpl implements ReplyCmmntyService {
	@Autowired
	private ReplyCmmntyMapper map;
	
	@Override //댓글 전체조회
	public List<ReplyCmmntyVO> ReplycmmntyList(ReplyCmmntyVO vo) {
		return  map.ReplycmmntyList(vo);
	}

	@Override //댓글 글쓰기
	public int ReplycmmntInsert(ReplyCmmntyVO vo) {
		return map.ReplycmmntInsert(vo);
	}

	@Override //댓글 수정
	public int ReplycmmntUpdate(ReplyCmmntyVO vo) {
		return map.ReplycmmntUpdate(vo);
	}

	@Override //댓글 삭제
	public int ReplycmmntDelete(ReplyCmmntyVO vo) {
		return map.ReplycmmntDelete(vo);
	}

}
