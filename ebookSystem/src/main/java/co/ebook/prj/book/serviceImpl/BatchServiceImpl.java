package co.ebook.prj.book.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.book.mapper.BatchMapper;
import co.ebook.prj.book.service.BatchService;
import co.ebook.prj.book.vo.BatchVO;

@Repository
public class BatchServiceImpl implements BatchService {

	@Autowired
	BatchMapper map;
	
	@Override
	public List<BatchVO> batchList(BatchVO vo) {
		return map.batchList(vo);
	}

	@Override
	public int batchInsert(BatchVO vo) {
		return map.batchInsert(vo);
	}

	@Override
	public int batchDelete(BatchVO vo) {
		return map.batchDelete(vo);
	}

	@Override
	public int batchOrderUpdate(BatchVO vo) {
		return map.batchOrderUpdate(vo);
	}
}
