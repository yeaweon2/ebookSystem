package co.ebook.prj.bookreview.mapper;

import java.util.List;

import co.ebook.prj.bookreview.vo.BookReviewVO;
import co.ebook.prj.lend.vo.LendVO;

public interface BookReviewMapper {
	
	List<BookReviewVO> bookReviewList(BookReviewVO vo);

	List<BookReviewVO> reviewList(BookReviewVO vo);

	BookReviewVO reviewSelectList(BookReviewVO vo);

	int bookReviewInsert(BookReviewVO vo);

	int bookReviewUpdate(BookReviewVO vo);

	int bookReviewDelete(BookReviewVO vo);
	
	int reviewLikeItUpdate(BookReviewVO vo);
	
	//대여리스트
	List<LendVO> reviewLendList(LendVO vo);
	
	//조회수
	int reviewHit(BookReviewVO vo);
	
	//전체카운트
	int getCount(BookReviewVO vo);
	
	//마일리지적립
	int memberMile(BookReviewVO vo);
	
	//마일리지삭제
	int memberMileDel(BookReviewVO vo);
}
