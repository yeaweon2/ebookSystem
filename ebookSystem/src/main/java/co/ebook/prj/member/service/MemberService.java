package co.ebook.prj.member.service;

import java.util.List;

import co.ebook.prj.member.vo.MemberVO;

public interface MemberService {
//	멤버전체조회
	List<MemberVO> memberSelectList();
	
//	멤버상세조회
	MemberVO memberSelect(MemberVO vo);
	
//	일반회원등록
	int memberInsert(MemberVO vo);  
	
//	업체회원등록
	int managerInsert(MemberVO vo);

//	멤버정보수정(관리자)
	int memberUpdate(MemberVO vo); 

//	멤버휴면상태 사용중으로 전환
	int memberCdUpdate(MemberVO vo);
	
//	회원가입시 멤버아이디중복체크
	int memberCheck(MemberVO vo);
	
//	회원가입시 멤버닉네임중복체크
	int nickNnCheck(MemberVO vo);
	
//	멤버등록승인
	int confirmUpdate(MemberVO vo);
	
//	멤버삭제
	int memberDelete(MemberVO vo);
	
//	월정액 승인시 
	int memSubUpdate(MemberVO vo);
	
//	마이페이지 수정
	int myPageUpdate(MemberVO vo);
}
