package co.ebook.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.report.mapper.BookReportMapper;
import co.ebook.prj.report.service.BookReportService;
import co.ebook.prj.report.vo.BcnfmReportVO;
import co.ebook.prj.report.vo.BookReportVO;
import co.ebook.prj.report.vo.CtgyBookReportVO;

@Repository
public class BookReportServiceImpl implements BookReportService {
	
	@Autowired
	BookReportMapper map;
	
	@Override
	public BookReportVO getBookReport() {
		return map.getBookReport();
	}

	@Override
	public List<CtgyBookReportVO> getCtgyBookCnt() {
		return map.getCtgyBookCnt();
	}

	@Override
	public List<BcnfmReportVO> getBcnfmCnt() {
		return map.getBcnfmCnt();
	}

	@Override
	public List<BookReportVO> getBookMonthReport() {
		return map.getBookMonthReport();
	}

}
