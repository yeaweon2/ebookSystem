package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BatchVO;

public interface BatchMapper {
	
	List<BatchVO> batchList(BatchVO vo);
	
	int batchInsert(BatchVO vo);
	
	int batchDelete(BatchVO vo);
	
	int batchOrderUpdate(BatchVO vo);
}
