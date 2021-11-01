package co.ebook.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.member.mapper.MemberMapper;
import co.ebook.prj.member.service.MemberService;
import co.ebook.prj.member.vo.MemberVO;

@Repository
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper map;
	
//	회원 전체리스트 조회 (21.10.17.김유리)
	@Override
	public List<MemberVO> memberSelectList() {  
		return map.memberSelectList();
	}

//	회원 상세조회 (21.10.17.김유리)
	@Override
	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

//	개인회원추가 (21.10.17.김유리)
	@Override
	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

//	회원정보수정 (21.10.17.김유리)
	@Override
	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

//	휴면회원 사용중으로 전환 (21.10.17.김유리)
	@Override
	public int memberCdUpdate(MemberVO vo) {
		return map.memberCdUpdate(vo);
	}
	
//  회원중복체크 (21.10.22.김유리)
	@Override
	public int memberCheck(MemberVO vo) {
		return map.memberCheck(vo);
	}

//  닉네임중복체크 (21.10.23.김유리)
	@Override
	public int nickNnCheck(MemberVO vo) {
		return map.nickNnCheck(vo);
	}

//	업체회원추가 (21.10.25.김유리)
	@Override
	public int managerInsert(MemberVO vo) {
		return map.managerInsert(vo);
	}

//	매니저(업체회원) 승인상태변경 (21.10.25.김유리)
	@Override
	public int confirmUpdate(MemberVO vo) {
		return map.confirmUpdate(vo);
	}

//	회원정보 삭제 (21.10.27.김유리)
	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

}
