package co.ebook.prj.lend.service;

import java.util.List;

import co.ebook.prj.lend.vo.LendVO;

public interface LendService {
	
	List<LendVO> lendList(LendVO vo);
	
	LendVO lendDetail(LendVO vo);
	
	int lendInsert(LendVO vo);
	
	int lendUpdate(LendVO vo);
	
	int lendDelete(LendVO vo);
	
	int lendDuplChk(LendVO vo);
}
