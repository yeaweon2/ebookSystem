package co.ebook.prj.book.service;

import java.util.List;

import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;

public interface BookService {
	
	List<BookVO> bookList(BookSrchVO vo);

	List<BookVO> bookSrchPageList(BookSrchVO vo);
	
	List<BookVO> newBooks();
	
	List<BookVO> bestSellerBook();
	
	List<BookVO> likeBooks();
	
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookUseYnUpdate(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
	
	int bookCoverUpdate(BookVO vo);	
	
	int bookListCount(BookSrchVO vo);
	
	int bookSrchPageCount(BookSrchVO vo);
	
	int bookLikeItUpdate(BookVO vo);
	
		
}
