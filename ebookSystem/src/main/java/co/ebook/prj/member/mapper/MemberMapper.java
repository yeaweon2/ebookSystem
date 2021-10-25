package co.ebook.prj.member.mapper;

import java.util.List;

import co.ebook.prj.member.vo.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	
	MemberVO memberSelect(MemberVO vo);
	
	int memberInsert(MemberVO vo);
	
	int managerInsert(MemberVO vo);

	int memberUpdate(MemberVO vo);

	int memberDelete(MemberVO vo);
	
	int memberCheck(MemberVO vo);
	
	int nickNnCheck(MemberVO vo);
	
	int confirmUpdate(MemberVO vo);
}
