package co.ebook.prj.replycmmnty.servie;

import java.util.List;

import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

public interface ReplyCmmntyService {
	List<ReplyCmmntyVO> ReplycmmntyList(ReplyCmmntyVO vo);
	ReplyCmmntyVO ReplycmmntySelectList(ReplyCmmntyVO vo);
	int ReplycmmntInsert(ReplyCmmntyVO vo);
	int ReplycmmntUpdate(ReplyCmmntyVO vo);
	int ReplycmmntDelete(ReplyCmmntyVO vo);
}
