package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;

public interface BookMapper {
	// 매니저 BOOK조회화면
	List<BookVO> bookList(BookSrchVO vo);
	
	// BOOK검색화면
	List<BookVO> bookSrchPageList(BookVO vo);
	
	// BOOK상세화면
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookUseYnUpdate(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
	
	int bookCoverUpdate(BookVO vo);
	
	int bookListCount(BookSrchVO vo);
	
	int bookSrchPageCount(BookVO vo);
	
	List<BookVO> newBooks();
	
	List<BookVO> bestSellerBook();
	
	List<BookVO> likeBooks();
	
	// BOOK 상세보기시 조회수 업데이트
	int bookHitUpdate(BookVO vo);
	
	// BOOK 추천 클릭시 업데이트
	int bookLikeItUpdate(BookVO vo);
	
	// 카테고리별 BOOK 조회
	List<BookVO> ctgyBookList(BookVO vo);
	
	BookVO bookChkCnt(BookVO vo);
}
