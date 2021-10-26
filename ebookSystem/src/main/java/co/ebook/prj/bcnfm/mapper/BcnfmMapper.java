package co.ebook.prj.bcnfm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.ebook.prj.bcnfm.vo.BcnfmVO;

public interface BcnfmMapper {
	
	List<BcnfmVO> bcnfmList();
	
	BcnfmVO bcnfmDetail(BcnfmVO vo);
	
	int bcnfmInsert(BcnfmVO vo);
	
	int bcnfmUpdate(BcnfmVO vo);
	
	int bcnfmDelete(BcnfmVO vo);
	
	int bcnfmIdUpdate(BcnfmVO vo);
}
