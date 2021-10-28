package co.ebook.prj.category.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.category.mapper.CtgyMapper;
import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;

@Repository
public class CtgyServiceImpl implements CtgyService {

	@Autowired
	private CtgyMapper map;
	
	@Override
	public List<CtgyVO> ctgyList() {
		// 2021.10.17 최예원  카테고리 대분류 목록조회
		return map.ctgyList();
	}

	@Override
	public List<CtgyVO> ctgyDetailList(CtgyVO vo) {
		// 2021.10.17 최예원  카테고리 소분류 목록조회		
		return map.ctgyDetailList(vo);
	}

	@Override
	public int ctgyInsert(CtgyVO vo) {
		return map.ctgyInsert(vo);
	}

	@Override
	public int ctgyUpdate(CtgyVO vo) {
		return map.ctgyUpdate(vo);
	}

	@Override
	public int ctgyDelete(CtgyVO vo) {
		return map.ctgyDelete(vo);
	}

	// main화면에서 사용할 카테고리 자식노드 조회쿼리 
	@Override
	public List<CtgyVO> ctgysList() {
		return map.ctgysList();
	}

}
