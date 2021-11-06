package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;

public interface BookMapper {
	// 매니저 BOOK조회화면
	List<BookVO> bookList(BookSrchVO vo);
	
	// BOOK검색화면
	List<BookVO> bookSrchPageList(BookSrchVO vo);
	
	// BOOK상세화면
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookUseYnUpdate(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
	
	int bookCoverUpdate(BookVO vo);
	
	int bookListCount(BookSrchVO vo);
	
	int bookSrchPageCount(BookSrchVO vo);
	
	List<BookVO> newBooks();
	
	List<BookVO> bestSellerBook();
	
	List<BookVO> likeBooks();
}
