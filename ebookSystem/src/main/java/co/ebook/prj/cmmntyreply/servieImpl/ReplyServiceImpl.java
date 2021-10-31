package co.ebook.prj.cmmntyreply.servieImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.cmmnty.mapper.CmmntyMapper;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.cmmntyreply.mapper.ReplyMapper;
import co.ebook.prj.cmmntyreply.service.ReplyService;
import co.ebook.prj.cmmntyreply.vo.ReplyVO;

@Repository
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper map;
	@Autowired
	private CmmntyMapper cmap;
	
	@Override //댓글 전체조회
	public List<ReplyVO> replyCmmntyList(ReplyVO vo) {
		return  map.replyCmmntyList(vo);
	}

	@Override //댓글 글쓰기
	public int replyCmmntInsert(ReplyVO vo) {
		CmmntyVO cvo = new CmmntyVO();
		cvo.setCmmntyId(vo.getCmmntyId());
		cmap.cmmntyReplyCnt(cvo);
		return map.replyCmmntInsert(vo);
	}

	@Override //댓글 수정
	public int replyCmmntUpdate(ReplyVO vo) {
		return map.replyCmmntUpdate(vo);
	}

	@Override //댓글 삭제
	public int replyCmmntDelete(ReplyVO vo) {
		CmmntyVO cvo = new CmmntyVO();
		cvo.setCmmntyId(vo.getCmmntyId());
		cmap.cmmntyReplyDel(cvo);
		return map.replyCmmntDelete(vo);
	}

}
