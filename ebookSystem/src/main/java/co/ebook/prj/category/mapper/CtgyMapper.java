package co.ebook.prj.category.mapper;

import java.util.List;

import co.ebook.prj.category.vo.CtgyVO;

public interface CtgyMapper {
	List<CtgyVO> ctgyList();
	
	List<CtgyVO> ctgysList();
	
	List<CtgyVO> ctgyDetailList(CtgyVO vo);
	
	int ctgyInsert(CtgyVO vo);
	
	int ctgyUpdate(CtgyVO vo);
	
	int ctgyDelete(CtgyVO vo);	
}
