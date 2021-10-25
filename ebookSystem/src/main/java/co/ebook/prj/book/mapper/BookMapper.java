package co.ebook.prj.book.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BookVO;

public interface BookMapper {
	List<BookVO> bookList();
	
	List<BookVO> bestSellerBook();
	
	BookVO bookDetail(BookVO vo);
	
	int bookInsert(BookVO vo);
	
	int bookDelete(BookVO vo);
	
	int bookUpdate(BookVO vo);
}
