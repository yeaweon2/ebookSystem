package co.ebook.prj.bookreview.service;

import java.util.List;

import co.ebook.prj.bookreview.vo.BookReviewVO;

public interface BookReviewService {
	List<BookReviewVO> bookReviewList(BookReviewVO vo);
	BookReviewVO bookReviewSelectList(BookReviewVO vo);
	int bookReviewInsert(BookReviewVO vo);
	int bookReviewUpdate(BookReviewVO vo);
	int bookReviewDelete(BookReviewVO vo);
}
