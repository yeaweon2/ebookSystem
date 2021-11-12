package co.ebook.prj.bookreview.mapper;

import java.util.List;

import co.ebook.prj.bookreview.vo.BookReviewVO;

public interface BookReviewMapper {
	
	List<BookReviewVO> bookReviewList(BookReviewVO vo);

	List<BookReviewVO> reviewList(BookReviewVO vo);

	BookReviewVO reviewSelectList(BookReviewVO vo);

	int bookReviewInsert(BookReviewVO vo);

	int bookReviewUpdate(BookReviewVO vo);

	int bookReviewDelete(BookReviewVO vo);
	
	int reviewLikeItUpdate(BookReviewVO vo);
	
	//조회수
	int reviewHit(BookReviewVO vo);
	
	//전체카운트
	int getCount(BookReviewVO vo);
	
	//마일리지
	int memberMile(BookReviewVO vo);


}
