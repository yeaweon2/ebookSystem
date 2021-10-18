package co.ebook.prj.book.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.book.mapper.BookMapper;
import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookVO;

@Repository
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookMapper map;
	
	@Override
	public List<BookVO> bookList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookVO bookDetail(BookVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int bookInsert(BookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int bookDelete(BookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int bookUpdate(BookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
