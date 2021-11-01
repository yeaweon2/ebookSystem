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
	public List<ReplyVO> replyList(ReplyVO vo) {
		return  map.replyList(vo);
	}

	@Override //댓글 글쓰기
	public int replyInsert(ReplyVO vo) {
		CmmntyVO cvo = new CmmntyVO();
		cvo.setCmmntyId(vo.getCmmntyId());
		cmap.cmmntyReplyCnt(cvo);
		return map.replyInsert(vo);
	}

	@Override //댓글 수정
	public int replyUpdate(ReplyVO vo) {
		return map.replyUpdate(vo);
	}

	@Override //댓글 삭제
	public int replyDelete(ReplyVO vo) {
		CmmntyVO cvo = new CmmntyVO();
		cvo.setCmmntyId(vo.getCmmntyId());
		cmap.cmmntyReplyDel(cvo);
		return map.replyDelete(vo);
	}

}
