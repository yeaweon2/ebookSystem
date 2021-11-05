package co.ebook.prj.book.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.service.BreplyService;
import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.book.vo.BreplyVO;
import co.ebook.prj.common.vo.Paging;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
	@Autowired
	BreplyService breplyDao;
	
	@Autowired
	String filePath;

	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	
	@RequestMapping("/bookList")
	public String bookList(Model model , BookVO vo , BookSrchVO svo, Paging paging , HttpServletRequest request ) {
		
		HttpSession session = request.getSession();
		svo.setMemberId((String)session.getAttribute("id"));
		
		System.out.println("================================>");
		
		System.out.println(svo.toString());
		paging.setPageUnit(8);
		
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());	
		
		paging.setTotalRecord(bookDao.bookListCount(svo));		
		
		List<BookVO> lists = bookDao.bookList(svo);

		if(lists.size() > 0) {
			model.addAttribute("msg", "성공");
			model.addAttribute("lists", lists);
	//		model.addAttribute("paging", paging );
		}else {
			model.addAttribute("msg", "자료가 없습니다.");
		}		
		
		return "book/bookList";
	}
	
	@RequestMapping("/bookInsertForm")
	public String bookInsertForm() {
		return "book/bookInsertForm";
	}
	
	// MultipartHttpServletRequest request
	@PostMapping("/bookInsert")
	public String bookInsert(Model model , BookVO vo, MultipartFile attchFile , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int result = 0;
		vo.setMemberId((String)session.getAttribute("id"));	
		String fileName = "";
		
		String folder = "/book/";
		
		try {
			if ( attchFile != null ) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();	
					//filePath = request.getServletContext().getRealPath("/fileUp");	// 파일 저장경로
					filePath =  filePath + folder;								// 파일이 저장될 최종폴더

					// UUID.randomUUID().toString() + "_" +
					File fileSave = new File( filePath , fileName);
					System.out.println("----------------------------------------------> fileSave");
					System.out.println(fileSave);
					System.out.println("----------------------------------------------> fileSave");
					
					attchFile.transferTo(fileSave);			// 파일 업로드
				}else {
					filePath = "";
					fileName = "";
				}
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}			
		
		System.out.println("----------------------------->> ");
		System.out.println( fileName );
		System.out.println( folder );
		System.out.println("----------------------------->> ");
		
		vo.setBookCover(fileName);
		vo.setBookCoverPath(folder);
	
		result = bookDao.bookInsert(vo);

		System.out.println("도서 : " + result + " 건 입력완료 ------->");
		if(result > 0 ) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "에러");
		}
		
		return "redirect:/bookList";
	}
	
	@RequestMapping("/bookUpdateForm")
	public String bookUpdateForm(Model model , BookVO vo) {
		vo = bookDao.bookDetail(vo);
		System.out.println(vo.toString());
		
		model.addAttribute("books", vo);
		return "book/bookUpdateForm";
	}
	
	@RequestMapping("/bestSeller")
	public String bestSeller(Model model , BookVO vo) {
		List<BookVO> lists = bookDao.bestSellerBook();
		// 쿼리 수정해야함 
		model.addAttribute("lists", lists);
		
		return "book/bestSeller";
	}

	
	@RequestMapping("/bookDetail")
	public String bookDetail(Model model , BookVO vo ) {
		String view = "";
		vo = bookDao.bookDetail(vo);

		if( vo != null ) {
			
			BreplyVO rvo = new BreplyVO();
			rvo.setBookId(vo.getBookId());
			List<BreplyVO> rlist = breplyDao.breplyList(rvo);
			
			model.addAttribute("msg", "성공");
			model.addAttribute("book", vo);
			if( rlist != null ) {
				model.addAttribute("replys", rlist);	
			}
			
			
			view = "book/bookDetail";
		}else {
			model.addAttribute("msg", "자료가 없습니다.");
			view = "redirect:home";
		}		
		
		return view;
	}
	
	@RequestMapping("/bookDelete")
	public String bookDelete(Model model , BookVO vo) {
		System.out.println("//----------------------------------------");
		System.out.println(vo.toString());
		
		int result = 0;
		// 승인처리된 도서의 경우 사용여부만 변경 , 삭제불가 
		if( "Y".equals(vo.getBookCnfmYn())){
			result = bookDao.bookUseYnUpdate(vo);	
		}  else {
			// 승인 미처리된 도서의 경우 삭제처리
			result = bookDao.bookDelete(vo);
		}
		
		String view = "";
		if( result > 0 ) {
			model.addAttribute("msg", "01");	// 성공
		}else {
			model.addAttribute("msg", "02");	// 에러	
		}
		view = "redirect:bookList";
		
		return view;
	}
	
	
	@RequestMapping("/bookCartInsert")
	public String bookCartInsert(Model model , BookVO vo ) {
		return "book/bookCartForm";
	}	
	
}
