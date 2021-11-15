package co.ebook.prj.bookreview.service;

import java.util.List;

import co.ebook.prj.bookreview.vo.BookReviewVO;
import co.ebook.prj.lend.vo.LendVO;

public interface BookReviewService {

	List<BookReviewVO> bookReviewList(BookReviewVO vo);

	List<BookReviewVO> reviewList(BookReviewVO vo);

	BookReviewVO reviewSelectList(BookReviewVO vo);

	int bookReviewInsert(BookReviewVO vo);

	int bookReviewUpdate(BookReviewVO vo);

	int bookReviewDelete(BookReviewVO vo);
	
	//좋아요
	int bookReviewLikeItUpdate(BookReviewVO vo);
	
	//글카운터
	int getCount(BookReviewVO vo);
	
	//대여리스트
	List<LendVO> reviewLendList(LendVO vo);
}
