package co.ebook.prj.replycmmnty.mapper;

import java.util.List;

import co.ebook.prj.replycmmnty.vo.ReplyCmmntyVO;

public interface ReplyCmmntyMapper {
	List<ReplyCmmntyVO> replyCmmntyList(ReplyCmmntyVO vo);
	int replyCmmntInsert(ReplyCmmntyVO vo);
	int replyCmmntUpdate(ReplyCmmntyVO vo);
	int replyCmmntDelete(ReplyCmmntyVO vo);

}
