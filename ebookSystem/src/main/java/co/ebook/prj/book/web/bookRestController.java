package co.ebook.prj.book.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

@RestController
public class bookRestController {

	@Autowired
	BookService bookDao;
	
	/*
	 * @Autowired private String filePath;
	 */		
	
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
		
		MultipartFile attchFile = vo.getAttchFile();
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

					// 기존파일 삭제
/*					if( vo.getBookCover() != null || !"".equals(vo.getBookCover()) ) {
						File oldFile =new File(vo.getBookCoverPath(), vo.getBookCover());

						if( oldFile.exists()) {
							oldFile.delete();
						}	
					} */
					
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

	   int result = bookDao.bookUpdate(vo);
	   System.out.println("BOOK수정 : " + result + " ----> ");
	   if( result > 0) {
		   model.addAttribute("msg", "Success");
	   }else {
		   model.addAttribute("msg", "Error");
	   }
	   
	   return vo;
   }
	
	@RequestMapping(value="/bookSrchList", method=RequestMethod.POST )
	   public List<BookVO> bookSrchList(Model model, @RequestBody BookSrchVO vo) {
		
		System.out.println("----------------------------->> ");
		System.out.println(vo.toString());
		List<BookVO> lists = bookDao.bookList(vo);	
		return lists;
	}
			
	
	
	
}
