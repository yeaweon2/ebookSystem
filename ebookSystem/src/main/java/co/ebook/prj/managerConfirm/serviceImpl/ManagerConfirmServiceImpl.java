package co.ebook.prj.managerConfirm.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.managerConfirm.mapper.ManagerConfirmMapper;
import co.ebook.prj.managerConfirm.service.ManagerConfirmService;
import co.ebook.prj.managerConfirm.vo.ManagerConfirmVO;
import co.ebook.prj.member.mapper.MemberMapper;
import co.ebook.prj.member.vo.MemberVO;

@Repository
public class ManagerConfirmServiceImpl implements ManagerConfirmService {
	@Autowired
	ManagerConfirmMapper map;
	
	@Autowired
	MemberMapper mapp;
	
//	매니저(업체회원)승인상태변경 (21.10.26.김유리)
	@Override
	public int managerConfirm(ManagerConfirmVO vo) {
		MemberVO mVo = new MemberVO();
		mVo.setMcnfmId(vo.getMcnfmId());
		
		mapp.confirmUpdate(mVo);
		return map.managerConfirm(vo);
	}
	
//	매니저(업체회원) 상세조회
	@Override
	public ManagerConfirmVO managerSelect(ManagerConfirmVO vo) {
		return map.managerSelect(vo);
	}

//	매니저(업체회원) 전체리스트 조회 (21.10.25.김유리)
	@Override
	public List<ManagerConfirmVO> managerSelectList() {
		return map.managerSelectList();
	}

//	매니저승인정보수정
	@Override
	public int managerconfirmUpdate(ManagerConfirmVO vo) {
		return map.managerconfirmUpdate(vo);
	}

//	매니저등록신청
	@Override
	public int managerRegistInsert(ManagerConfirmVO vo) {
		return map.managerRegistInsert(vo);
	}

//	매니저정보수정
	@Override
	public int managerUpdate(ManagerConfirmVO vo) {
		MemberVO mVo = new MemberVO();
		mVo.setMemberId(vo.getMemberId());
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + vo + mVo);
		mapp.confirmUpdate(mVo);
		return map.managerUpdate(vo);
	}

	@Override
	public int manSubUpdate(ManagerConfirmVO vo) {
		return map.manSubUpdate(vo);
	}

	@Override
	public int payInsert(ManagerConfirmVO vo) {
		return map.payInsert(vo);
	}

	@Override
	public ManagerConfirmVO paySelect(ManagerConfirmVO vo) {
		return map.paySelect(vo);
	}
}
