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
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BookSrchVO;
import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.category.vo.CtgyVO;
import co.ebook.prj.common.vo.Paging;

@RestController
public class bookRestController {

	@Autowired
	BookService bookDao;
	
	
	@Autowired private String filePath;
			
	
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
   
   
	@RequestMapping(value="/bookUpdate", method=RequestMethod.POST )
   public BookVO bookUpdate(Model model, BookVO vo ) {
		
		System.out.println("===============================>> 수정전");
		System.out.println(vo.toString());
		System.out.println("===============================>> ");
		System.out.println(vo.getAttchUpFlag());
		// 첨부파일 수정여부 체크
		if( "true".equals(vo.getAttchUpFlag())) {
			System.out.println("===============================>> 첨부파일 수정중 >> ");	
			MultipartFile attchFile = vo.getAttchFile();
			String fileName = "";
			String real_filePath = "";
			String folder = "/book/";
			
			try {
				if ( attchFile != null ) {
					if (!attchFile.getOriginalFilename().isEmpty()) {
						fileName = attchFile.getOriginalFilename();	
						//filePath = request.getServletContext().getRealPath("/");	// 파일 저장경로
						real_filePath =  filePath + folder;								// 파일이 저장될 최종폴더
	
						// UUID.randomUUID().toString() + "_" +
						File fileSave = new File(real_filePath, fileName);
						
						attchFile.transferTo(fileSave);			// 파일 업로드
	
						// 기존파일 삭제
						if( vo.getBookCover() != null || !"".equals( vo.getBookCover()) ) {
							File oldFile =new File(filePath + vo.getBookCoverPath(), vo.getBookCover());
							System.out.println("===============================>> 기존파일 삭제처리 >> ");	
							System.out.println(oldFile);
							
							if( oldFile.exists()) {
								oldFile.delete();
							}	
						} 
						
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
			vo.setBookCoverPath(folder);
	   }
		
	   int result = bookDao.bookUpdate(vo);
	   System.out.println("BOOK수정 : " + result + " ----> ");
	   if( result > 0) {
		   model.addAttribute("msg", "01");
	   }else {
		   model.addAttribute("msg", "02");
	   }
	   
	   return vo;
   }
	
	// 매니저 BOOK조회화면에서 조회버튼 클릭시
	@RequestMapping(value="/bookSrchList", method=RequestMethod.POST )
	   public HashMap<String,Object> bookSrchList(Model model, @RequestBody BookSrchVO svo, Paging paging , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		svo.setMemberId((String)session.getAttribute("id"));
		
		paging.setPageUnit(8);
		paging.setTotalRecord(bookDao.bookListCount(svo));	
		
		System.out.println("----------------------------->> ");
		System.out.println(svo.toString());
		System.out.println(paging.toString());
		
		
		List<BookVO> lists = bookDao.bookList(svo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if( lists != null ) {
			map.put("result", "01");
			map.put("lists", bookDao.bookList(svo));
			map.put("paging" , paging );
		
		}else {
			map.put("result", "02");
		}
		return map;
	}
	
	// BOOK검색화면에서 조회버튼 클릭시 
	@RequestMapping(value="/bookSrchPage", method=RequestMethod.POST )
	   public HashMap<String,Object> bookSrchPage(Model model, @RequestBody BookSrchVO svo, Paging paging , HttpServletRequest request) {
		
		
		System.out.println("-----------------here------------>> ");
		System.out.println(svo.toString());
		System.out.println("-----------------here------------>> ");
		
		paging.setPageUnit(8);
		paging.setTotalRecord(bookDao.bookSrchPageCount(svo));	
		
		System.out.println("----------------------------->> ");
		System.out.println(paging.toString());
		System.out.println(paging.toString());
		
		
		List<BookVO> lists = bookDao.bookSrchPageList(svo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if( lists != null ) {
			map.put("result", "01");
			map.put("lists", lists);
			map.put("paging" , paging );
		
		}else {
			map.put("result", "02");
		}
		return map;
	}	
	
			
	@RequestMapping(value="/bookLikeItUpdate", method=RequestMethod.POST )
	public HashMap<String,Object> bookLikeItUpdate(Model model, @RequestBody BookVO vo ) {
		System.out.println(vo.toString());
		
		int result = bookDao.bookLikeItUpdate(vo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		if( result >  0 ) {
			map.put("result", "01");
		}else {
			map.put("result", "02");
		}
		return map;
	}
	
	
	@RequestMapping(value="/ctgyRestBookList", method=RequestMethod.POST )
	public HashMap<String,Object> ctgyRestBookList(Model model, @RequestBody BookVO vo) {
		
		List<BookVO> bookLists = bookDao.ctgyBookList(vo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("result", "01");
		map.put("bookLists", bookLists);
	
		return map;
	}	
	
}
