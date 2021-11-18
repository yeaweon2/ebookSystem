package co.ebook.prj.report.service;

import java.util.List;

import co.ebook.prj.report.vo.BcnfmReportVO;
import co.ebook.prj.report.vo.BookReportVO;
import co.ebook.prj.report.vo.CtgyBookReportVO;

public interface BookReportService {
	BookReportVO getBookReport();
	List<CtgyBookReportVO> getCtgyBookCnt();
	List<BcnfmReportVO> getBcnfmCnt();
	
	List<BookReportVO> getBookMonthReport();
}


