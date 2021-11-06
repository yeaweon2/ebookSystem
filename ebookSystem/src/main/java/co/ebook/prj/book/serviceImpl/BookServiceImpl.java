package co.ebook.prj.book.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.book.mapper.BookMapper;
import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;

@Repository
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookMapper map;
	
	@Override
	public List<BookVO> bookList(BookSrchVO vo) {
		return map.bookList(vo);
	}

	@Override
	public List<BookVO> bestSellerBook() { 
		return map.bestSellerBook();
	}	

	@Override
	public BookVO bookDetail(BookVO vo) {
		return map.bookDetail(vo);
	}

	@Override
	public int bookInsert(BookVO vo) {
		// 2021.10.07 최예원 도서입력
		return map.bookInsert(vo);
	}

	@Override
	public int bookDelete(BookVO vo) {
		return map.bookDelete(vo);
	}

	@Override
	public int bookUpdate(BookVO vo) {
		return map.bookUpdate(vo);
	}

	@Override
	public int bookCoverUpdate(BookVO vo) {
		return map.bookCoverUpdate(vo);
	}

	@Override
	public int bookUseYnUpdate(BookVO vo) {
		return map.bookUseYnUpdate(vo);
	}

	@Override
	public int bookListCount(BookSrchVO vo) {
		return map.bookListCount(vo);
	}

	@Override
	public List<BookVO> newBooks() {
		return map.newBooks();
	}

	@Override
	public List<BookVO> likeBooks() {
		return map.likeBooks();
	}

	@Override
	public List<BookVO> bookSrchPageList(BookSrchVO vo) {
		return map.bookSrchPageList(vo);
	}

	@Override
	public int bookSrchPageCount(BookSrchVO vo) {
		return map.bookSrchPageCount(vo);
	}
}
