package co.ebook.prj.replycmmnty.service;

import java.util.List;

import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

public interface ReplyCmmntyService {
	List<ReplyCmmntyVO> replyCmmntyList(ReplyCmmntyVO vo) ;
	int replyCmmntInsert(ReplyCmmntyVO vo);
	int replyCmmntUpdate(ReplyCmmntyVO vo);
	int replyCmmntDelete(ReplyCmmntyVO vo);
}
