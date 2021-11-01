package co.ebook.prj.book.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.book.mapper.BreplyMapper;
import co.ebook.prj.book.service.BreplyService;
import co.ebook.prj.book.vo.BreplyVO;

@Repository
public class BreplyServiceImpl implements BreplyService {

	@Autowired
	BreplyMapper map;

	@Override
	public List<BreplyVO> breplyList(BreplyVO vo) {
		return map.breplyList(vo);
	}

	@Override
	public int breplyInsert(BreplyVO vo) {
		return map.breplyInsert(vo);
	}

	@Override
	public int breplyUpdate(BreplyVO vo) {
		return map.breplyUpdate(vo);
	}

	@Override
	public int breplyDelete(BreplyVO vo) {
		return map.breplyDelete(vo);
	}

	@Override
	public BreplyVO breplyDetail(BreplyVO vo) {
		
		int breplyId = map.breplyMaxId(vo);
		vo.setBreplyId(breplyId);
		System.out.println("====================Max ID  구하기 >>");
		System.out.println(breplyId);
		
		return map.breplyDetail(vo);
	}
}
