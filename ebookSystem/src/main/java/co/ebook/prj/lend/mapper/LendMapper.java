package co.ebook.prj.lend.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BatchVO;
import co.ebook.prj.lend.vo.LendVO;

public interface LendMapper {
	List<LendVO> lendList(LendVO vo);
	
	LendVO lendDetail(LendVO vo);
	
	int lendInsert(LendVO vo);
	
	int lendUpdate(LendVO vo);
	
	int lendDelete(LendVO vo);
	
	int lendDuplChk(LendVO vo);
	
	List<BatchVO> readingBook(LendVO vo);
}
