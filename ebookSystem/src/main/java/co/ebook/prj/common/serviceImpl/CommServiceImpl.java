package co.ebook.prj.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.common.mapper.CommCodeMapper;
import co.ebook.prj.common.service.CommService;
import co.ebook.prj.common.vo.BookCnfmTopVO;
import co.ebook.prj.common.vo.BucketTopVO;
import co.ebook.prj.common.vo.CommCodeVO;
import co.ebook.prj.common.vo.InquireTopVO;
import co.ebook.prj.common.vo.ReviewTopVO;

@Repository
public class CommServiceImpl implements CommService {
	
	@Autowired
	CommCodeMapper map;

	@Override
	public List<CommCodeVO> commCodeList() {
		return map.commCodeList();
	}

	@Override
	public List<BucketTopVO> bucketTop(String id) {
		return map.bucketTop(id);
	}

	@Override
	public List<BookCnfmTopVO> bookCnfmTop(String id) {
		return map.bookCnfmTop(id);
	}

	@Override
	public List<InquireTopVO> inquireTop() {
		return map.inquireTop();
	}

	@Override
	public List<ReviewTopVO> reviewTop() {
		return map.reviewTop();
	}

}
