package co.ebook.prj.bcnfm.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.bcnfm.mapper.BcnfmMapper;
import co.ebook.prj.bcnfm.service.BcnfmService;
import co.ebook.prj.bcnfm.vo.BcnfmVO;

@Repository
public class BcnfmServiceImpl implements BcnfmService {
	
	@Autowired
	BcnfmMapper map;

	@Override
	public BcnfmVO bcnfmDetail(BcnfmVO vo) {
		return map.bcnfmDetail(vo);
	}

	@Override
	public int bcnfmInsert(BcnfmVO vo) {
		System.out.println("===========================>");
		System.out.println(vo.toString());
		System.out.println("===========================>");
		int reusult = map.bcnfmInsert(vo);		// 승인신청 insert
		map.bcnfmIdUpdate(vo);					// book테이블에 승인번호 update
		return reusult;
	}

	@Override
	public int bcnfmUpdate(BcnfmVO vo) {
		map.bcnfmAdminUpdate(vo);				// book테이블에 승인여부 업데이트
		return map.bcnfmUpdate(vo);
	}

	// 승인신청취소시에만 처리
	@Override
	public int bcnfmDelete(BcnfmVO vo) {
		map.bcnfmCancelBookUpdate(vo);
		return map.bcnfmDelete(vo);
	}

	@Override
	public int bcnfmListCount(BcnfmVO vo) {
		return map.bcnfmListCount(vo);
	}

	@Override
	public List<BcnfmVO> bcnfmList(BcnfmVO vo) {
		return map.bcnfmList(vo);
	}

	@Override
	public BcnfmVO bcnfmReqDuplChk(BcnfmVO vo) {
		return map.bcnfmReqDuplChk(vo);
	}

	@Override
	public int bcnfmCancelBookUpdate(BcnfmVO vo) {
		return map.bcnfmCancelBookUpdate(vo);
	}

	

}
