package co.ebook.prj.cmmntyreply.mapper;

import java.util.List;

import co.ebook.prj.cmmntyreply.vo.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> replyCmmntyList(ReplyVO vo);
	int replyCmmntInsert(ReplyVO vo);
	int replyCmmntUpdate(ReplyVO vo);
	int replyCmmntDelete(ReplyVO vo);

}
