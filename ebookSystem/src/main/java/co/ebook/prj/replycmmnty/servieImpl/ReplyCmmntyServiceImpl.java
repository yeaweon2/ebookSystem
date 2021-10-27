package co.ebook.prj.replycmmnty.servieImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.cmmnty.mapper.CmmntyMapper;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.replycmmnty.mapper.ReplyCmmntyMapper;
import co.ebook.prj.replycmmnty.service.ReplyCmmntyService;
import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

@Repository
public class ReplyCmmntyServiceImpl implements ReplyCmmntyService {
	@Autowired
	private ReplyCmmntyMapper map;
	@Autowired
	private CmmntyMapper cmap;
	
	@Override //댓글 전체조회
	public List<ReplyCmmntyVO> replyCmmntyList(ReplyCmmntyVO vo) {
		return  map.replyCmmntyList(vo);
	}

	@Override //댓글 글쓰기
	public int replyCmmntInsert(ReplyCmmntyVO vo) {
		CmmntyVO cvo = new CmmntyVO();
		cvo.setCmmntyId(vo.getCmmntyId());
		cmap.cmmntyReplyCnt(cvo);
		return map.replyCmmntInsert(vo);
	}

	@Override //댓글 수정
	public int replyCmmntUpdate(ReplyCmmntyVO vo) {
		return map.replyCmmntUpdate(vo);
	}

	@Override //댓글 삭제
	public int replyCmmntDelete(ReplyCmmntyVO vo) {
		return map.replyCmmntDelete(vo);
	}

}
