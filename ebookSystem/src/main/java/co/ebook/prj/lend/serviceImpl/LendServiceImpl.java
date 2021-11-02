package co.ebook.prj.lend.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.lend.mapper.LendMapper;
import co.ebook.prj.lend.service.LendService;
import co.ebook.prj.lend.vo.LendVO;

@Repository
public class LendServiceImpl implements LendService {

	@Autowired
	LendMapper map;
	
	@Override
	public List<LendVO> lendList(LendVO vo) {
		return map.lendList(vo);
	}

	@Override
	public LendVO lendDetail(LendVO vo) {
		return map.lendDetail(vo);
	}

	@Override
	public int lendInsert(LendVO vo) {
		
		return map.lendInsert(vo) ;
	}

	@Override
	public int lendUpdate(LendVO vo) {
		return map.lendUpdate(vo);
	}

	@Override
	public int lendDelete(LendVO vo) {
		return map.lendDelete(vo);
	}
}
