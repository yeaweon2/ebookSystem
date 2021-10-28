package co.ebook.prj.book.service;

import java.util.List;

import co.ebook.prj.book.vo.BookVO;

public interface BookService {
	
	List<BookVO> bookList();
	
	List<BookVO> bestSellerBook();
	
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
	
	int bookCoverUpdate(BookVO vo);	
	
	
}
