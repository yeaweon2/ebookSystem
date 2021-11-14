package co.ebook.prj.bcnfm.service;

import java.util.List;

import co.ebook.prj.bcnfm.vo.BcnfmVO;

public interface BcnfmService {
	
	List<BcnfmVO> bcnfmList(BcnfmVO vo);
	
	BcnfmVO bcnfmDetail(BcnfmVO vo);
	
	int bcnfmInsert(BcnfmVO vo);
	
	int bcnfmUpdate(BcnfmVO vo);
	
	int bcnfmDelete(BcnfmVO vo);
	
	int bcnfmListCount(BcnfmVO vo);
	
	// BOOK 승인신청전 중복체크
	BcnfmVO bcnfmReqDuplChk(BcnfmVO vo);
	
}
