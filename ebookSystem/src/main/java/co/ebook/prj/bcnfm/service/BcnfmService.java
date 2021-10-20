package co.ebook.prj.bcnfm.service;

import java.util.List;

import co.ebook.prj.bcnfm.vo.BcnfmVO;

public interface BcnfmService {
	
	List<BcnfmVO> bcnfmList();
	BcnfmVO bcnfmDetail();
	int bcnfmInsert();
	int bcnfmUpdate();
	int bcnfmDelete();
}
