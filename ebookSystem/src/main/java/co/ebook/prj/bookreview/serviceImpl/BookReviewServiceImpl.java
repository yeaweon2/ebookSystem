package co.ebook.prj.bookreview.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.bookreview.mapper.BookReviewMapper;
import co.ebook.prj.bookreview.service.BookReviewService;
import co.ebook.prj.bookreview.vo.BookReviewVO;

@Repository
public class BookReviewServiceImpl implements BookReviewService {
	@Autowired
	private BookReviewMapper map;
	
	@Override
	public List<BookReviewVO> bookReviewList(BookReviewVO vo) {
		return map.bookReviewList(vo);
	}

	@Override
	public int bookReviewInsert(BookReviewVO vo) {
		map.memberMile(vo);
		return map.bookReviewInsert(vo);
	}

	@Override
	public int bookReviewUpdate(BookReviewVO vo) {
		return map.bookReviewUpdate(vo);
	}

	@Override
	public int bookReviewDelete(BookReviewVO vo) {
		return map.bookReviewDelete(vo);
	}

	@Override
	public List<BookReviewVO> reviewList(BookReviewVO vo) {
		return map.reviewList(vo);
	}

	@Override
	public BookReviewVO reviewSelectList(BookReviewVO vo) {
		map.reviewHit(vo);
		return map.reviewSelectList(vo);
	}

	@Override
	public int bookReviewLikeItUpdate(BookReviewVO vo) {
		return map.reviewLikeItUpdate(vo);
	}

	@Override
	public int getCount(BookReviewVO vo) {
		return map.getCount(vo);
	}


}
