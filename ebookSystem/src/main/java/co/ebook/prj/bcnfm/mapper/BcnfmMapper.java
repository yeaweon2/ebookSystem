package co.ebook.prj.bcnfm.mapper;

import java.util.List;

import co.ebook.prj.bcnfm.vo.BcnfmVO;

public interface BcnfmMapper {
	List<BcnfmVO> bcnfmList();
	BcnfmVO bcnfmDetail();
	int bcnfmInsert();
	int bcnfmUpdate();
	int bcnfmDelete();
}
