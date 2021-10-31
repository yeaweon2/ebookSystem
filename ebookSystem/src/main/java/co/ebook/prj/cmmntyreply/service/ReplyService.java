package co.ebook.prj.cmmntyreply.service;

import java.util.List;

import co.ebook.prj.cmmntyreply.vo.ReplyVO;

public interface ReplyService {
	List<ReplyVO> replyCmmntyList(ReplyVO vo) ;
	int replyCmmntInsert(ReplyVO vo);
	int replyCmmntUpdate(ReplyVO vo);
	int replyCmmntDelete(ReplyVO vo);
}
