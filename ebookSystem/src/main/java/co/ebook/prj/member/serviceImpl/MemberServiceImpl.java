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

//	회원추가 (21.10.17.김유리)
	@Override
	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

//	회원정보수정 (21.10.17.김유리)
	@Override
	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

//	회원삭제 (21.10.17.김유리)
	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

}
