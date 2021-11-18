package co.ebook.prj.report.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.ebook.prj.report.service.BookReportService;
import co.ebook.prj.report.vo.BcnfmReportVO;
import co.ebook.prj.report.vo.BookReportVO;
import co.ebook.prj.report.vo.CtgyBookReportVO;

@Controller
public class ReportController {
	
	@Autowired
	BookReportService reportDao;
	
	@RequestMapping("/bookReport")
	public String bookReport(Model model, BookReportVO vo, CtgyBookReportVO cvo , BcnfmReportVO bvo ) {
		vo = reportDao.getBookReport();
		List<BookReportVO> months = reportDao.getBookMonthReport();
		List<CtgyBookReportVO> clist = reportDao.getCtgyBookCnt();
		List<BcnfmReportVO> blist = reportDao.getBcnfmCnt();
		
		System.out.println("==========================>");
		System.out.println(vo.toString());
		System.out.println("==========================>");
		model.addAttribute("mlist", months );
		model.addAttribute("list", vo );
		model.addAttribute("clist", clist );
		model.addAttribute("blist", blist );
		
		return "admin/bookReport";
	}
	
	@RequestMapping("/manReport")
	public String manReport(Model model) { 
		return "admin/manReport";
	}
	
	@RequestMapping("/memReport")
	public String memReport(Model model) { 
		return "admin/memReport";
	}	
}
