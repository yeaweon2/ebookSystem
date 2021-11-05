package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;

public interface BookMapper {
	List<BookVO> bookList(BookSrchVO vo);
	
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookUseYnUpdate(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
	
	int bookCoverUpdate(BookVO vo);
	
	int bookListCount(BookSrchVO vo);
	
	List<BookVO> newBooks(BookVO vo);
	
	List<BookVO> bestSellerBook(BookVO vo);
	
	List<BookVO> likeBooks(BookVO vo);
}
