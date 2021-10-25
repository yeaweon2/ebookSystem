package co.ebook.prj.book.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import co.ebook.prj.book.vo.BookVO;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
	/*
	 * @Autowired private String filePath; // 파일이 저장될 경로 (개발시 절대경로로 파일저장되도록 사용할 것)
	 */
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	
	@RequestMapping("/bookList")
	public String bookList(Model model , BookVO vo ) {
		
		List<BookVO> lists = bookDao.bookList();

		if(lists.size() > 0) {
			model.addAttribute("msg", "성공");
			model.addAttribute("lists", lists);
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
		
		int result = 0;
		vo.setMemberId("admin");	
		String fileName = "";
		String filePath= "";
		try {
			if ( attchFile != null ) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();	
					//filePath = request.getServletContext().getRealPath("/");	// 파일 저장경로
					filePath =  filePath + "/book/";								// 파일이 저장될 최종폴더

					// UUID.randomUUID().toString() + "_" +
					File fileSave = new File(filePath, fileName);
					
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
		System.out.println( filePath );
		System.out.println("----------------------------->> ");
		
		vo.setBookCover(fileName);
		vo.setBookCoverPath(filePath);
	
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

		if( vo != null) {
			model.addAttribute("msg", "성공");
			model.addAttribute("book", vo);
			view = "book/bookDetail";
		}else {
			model.addAttribute("msg", "자료가 없습니다.");
			view = "redirect:home";
		}		
		
		return view;
	}
		
	
}
