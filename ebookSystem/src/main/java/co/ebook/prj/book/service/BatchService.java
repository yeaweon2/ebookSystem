package co.ebook.prj.book.service;

import java.util.List;

import co.ebook.prj.book.vo.BatchVO;

public interface BatchService {
	
	List<BatchVO> batchList(BatchVO vo);
	
	int batchInsert(BatchVO vo);
	
	int batchDelete(BatchVO vo);
	
	int batchOrderUpdate(BatchVO vo);
}
