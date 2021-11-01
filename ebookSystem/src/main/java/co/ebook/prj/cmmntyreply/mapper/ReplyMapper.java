package co.ebook.prj.cmmntyreply.mapper;

import java.util.List;

import co.ebook.prj.cmmntyreply.vo.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> replyList(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
	int replyDelete(ReplyVO vo);

}
