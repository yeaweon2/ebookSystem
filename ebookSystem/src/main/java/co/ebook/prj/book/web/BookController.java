package co.ebook.prj.book.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.service.BreplyService;
import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.book.vo.BreplyVO;
import co.ebook.prj.category.service.CtgyService;
import co.ebook.prj.category.vo.CtgyVO;
import co.ebook.prj.common.vo.Paging;

@Controller
public class BookController {
	
	@Autowired
	BookService bookDao;
	
	@Autowired
	BreplyService breplyDao;
	
	@Autowired 
	CtgyService ctgyDao;
	
	//@Autowired
	//String filePath;

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
		String real_filePath = "";
		String folder = "/book/";
		String filePath = "";
		
		try {
			if ( attchFile != null ) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();	
					filePath = request.getServletContext().getRealPath("/fileUp");	// 파일 저장경로
					real_filePath =  filePath + folder;								// 파일이 저장될 최종폴더

					// UUID.randomUUID().toString() + "_" +
					File fileSave = new File( real_filePath , fileName);
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
		List<BookVO> bests = bookDao.bestSellerBook();
		
		List<BookVO> news = bookDao.newBooks();
		
		List<BookVO> likes = bookDao.likeBooks();
		System.out.println("============================= 베스트셀러 >> ");
		System.out.println( bests );
		System.out.println( news );
		System.out.println( likes );
		System.out.println("============================= 베스트셀러 >> ");
		
		model.addAttribute("bests", bests);
		model.addAttribute("news", news);
		model.addAttribute("likes", likes);

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
	@ResponseBody
	public HashMap<String,Object> bookDelete(Model model , @RequestBody BookVO vo) {
		System.out.println("//----------------------------------------");
		System.out.println(vo.toString());
		
		int result = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		vo = bookDao.bookChkCnt(vo);
		
		if( vo.getLendCnt() > 0 ) {
			map.put("result", "03");
		}else if( vo.getBcnfmId() != null || "".equals(vo.getBcnfmId()) ){
			map.put("result", "04");
		}else {
			// 승인처리된 도서의 경우 사용여부만 변경 , 삭제불가 
			if( "Y".equals(vo.getBookCnfmYn())){
				result = bookDao.bookUseYnUpdate(vo);	
			}  else {
				// 승인 미처리된 도서의 경우 삭제처리
				result = bookDao.bookDelete(vo);
			}
			
			if( result > 0 ) {
				map.put("result", "01");	
			}else {
				map.put("result", "02");	
			}
		}
		
		return map;
	}
	
	
	@RequestMapping("/bookCartInsert")
	public String bookCartInsert(Model model , BookVO vo ) {
		return "book/bookCartForm";
	}	
	
	@RequestMapping("/menuSrchBook")
	public String menuSrchBook(Model model , BookVO svo, Paging paging ) {
		
		paging.setPageUnit(8);
		paging.setTotalRecord(bookDao.bookSrchPageCount(svo));	
		
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());	
		
		System.out.println("----------------------------->> ");
		System.out.println(paging.toString());
		System.out.println(paging.toString());
		
		List<BookVO> lists = bookDao.bookSrchPageList(svo);
		model.addAttribute("lists", lists);
		return "book/bookSrchList";
	}
	
	
	@RequestMapping("ctgyBookList")
	public String ctgyBookList(Model model, BookVO vo) {
		
		List<CtgyVO> ctgyLists = ctgyDao.ctgyMenuList();
		
		
		List<BookVO> bookLists = bookDao.ctgyBookList(vo);
		
		if(bookLists.size() > 0) {
			model.addAttribute("msg", "01");
			model.addAttribute("bookLists", bookLists);
			model.addAttribute("ctgyLists", ctgyLists);
		}else {
			model.addAttribute("msg", "02");
		}
		
		return "book/ctgyBookList";
	}	
	
	// BOOK검색화면에서 조회버튼 클릭시 
		@RequestMapping("/bookSrchList")
		public String bookSrchList(Model model, BookVO svo, Paging paging , HttpServletRequest request) {
			System.out.println("-----------------here------------>> ");
			System.out.println(svo.toString());
			System.out.println("-----------------here------------>> ");
			
			//페이징처리
			svo.setStart(paging.getFirst());
			svo.setEnd(paging.getLast()); 
			
			paging.setPageUnit(8);
			paging.setTotalRecord(bookDao.bookSrchPageCount(svo));	
			
			System.out.println("----------------------------->> ");
			System.out.println(paging.toString());
			System.out.println(paging.toString());
			
			
			List<BookVO> lists = bookDao.bookSrchPageList(svo);
			model.addAttribute("lists", lists);
			return "book/bookSrchList";
		}
			
}

