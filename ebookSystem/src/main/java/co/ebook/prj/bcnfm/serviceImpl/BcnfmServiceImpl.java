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
	public List<BcnfmVO> bcnfmList() {
		return map.bcnfmList();
	}

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
		return map.bcnfmUpdate(vo);
	}

	@Override
	public int bcnfmDelete(BcnfmVO vo) {
		return map.bcnfmDelete(vo);
	}

	

}
