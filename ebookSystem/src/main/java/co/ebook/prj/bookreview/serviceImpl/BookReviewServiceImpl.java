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
		map.bookMile(vo);
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

}
