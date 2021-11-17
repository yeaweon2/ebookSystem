package co.ebook.prj.bcnfm.mapper;

import java.util.List;

import co.ebook.prj.bcnfm.vo.BcnfmVO;

public interface BcnfmMapper {
	
	List<BcnfmVO> bcnfmList(BcnfmVO vo);
	
	BcnfmVO bcnfmDetail(BcnfmVO vo);
	
	int bcnfmInsert(BcnfmVO vo);
	
	int bcnfmUpdate(BcnfmVO vo);
	
	int bcnfmDelete(BcnfmVO vo);
	
	int bcnfmIdUpdate(BcnfmVO vo);
	
	int bcnfmListCount(BcnfmVO vo); 
	
	BcnfmVO bcnfmReqDuplChk(BcnfmVO vo);
	
	int bcnfmCancelBookUpdate(BcnfmVO vo);
	
	int bcnfmAdminUpdate(BcnfmVO vo);
}
