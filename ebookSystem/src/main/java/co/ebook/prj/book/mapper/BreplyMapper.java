package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BreplyVO;

public interface BreplyMapper {
	
	List<BreplyVO> breplyList(BreplyVO vo);
	
	BreplyVO breplyDetail(BreplyVO vo);

	int breplyMaxId(BreplyVO vo);
	
	int breplyInsert(BreplyVO vo);
	
	int breplyUpdate(BreplyVO vo);
	
	int breplyDelete(BreplyVO vo);
}
