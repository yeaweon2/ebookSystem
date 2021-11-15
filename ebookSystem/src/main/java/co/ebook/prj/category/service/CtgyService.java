package co.ebook.prj.category.service;

import java.util.List;

import co.ebook.prj.category.vo.CtgyVO;

public interface CtgyService {

	List<CtgyVO> ctgyList(CtgyVO vo);
	
	List<CtgyVO> ctgysList(CtgyVO vo);
	
	List<CtgyVO> ctgyDetailList(CtgyVO vo);
	
	int ctgyInsert(CtgyVO vo);
	
	int ctgyUpdate(CtgyVO vo);
	
	int ctgyDelete(CtgyVO vo);
	
	List<CtgyVO> ctgyMenuList();
	
	int ctgybookCntChk(CtgyVO vo); 
	
}
