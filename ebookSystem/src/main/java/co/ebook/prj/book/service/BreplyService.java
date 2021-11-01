package co.ebook.prj.book.service;

import java.util.List;

import co.ebook.prj.book.vo.BreplyVO;

public interface BreplyService {
	
	List<BreplyVO> breplyList(BreplyVO vo);
	
	BreplyVO breplyDetail(BreplyVO vo);
	
	int breplyInsert(BreplyVO vo);
	
	int breplyUpdate(BreplyVO vo);
	
	int breplyDelete(BreplyVO vo);
	
}
