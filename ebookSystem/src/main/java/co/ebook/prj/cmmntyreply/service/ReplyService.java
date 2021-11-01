package co.ebook.prj.cmmntyreply.service;

import java.util.List;

import co.ebook.prj.cmmntyreply.vo.ReplyVO;

public interface ReplyService {
	List<ReplyVO> replyList(ReplyVO vo) ;
	int replyInsert(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
	int replyDelete(ReplyVO vo);
}
