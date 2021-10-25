package co.ebook.prj.book.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import co.ebook.prj.book.vo.BookVO;

@RestController
public class bookRestController {

	@Autowired
	BookService bookDao;
	
	@Autowired
	private String filePath;		
		
	
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }
   
   
	@RequestMapping(value="/bookUpdate", method=RequestMethod.PUT, consumes="application/json"  )
   public BookVO bookUpdate(Model model, @RequestBody BookVO vo , MultipartFile bookCover, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(vo.toString());
		String fileName = "";
	
		
		try {
			if ( bookCover != null ) {
				if (!bookCover.getOriginalFilename().isEmpty()) {
					fileName = bookCover.getOriginalFilename();	
					filePath = request.getServletContext().getRealPath("/");	// 파일 저장경로
					filePath =  filePath + "\\book\\";							// 파일이 저장될 최종폴더

					// UUID.randomUUID().toString() + "_" +
					File fileSave = new File(filePath, fileName);
					
					bookCover.transferTo(fileSave);			// 파일 업로드
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
		
		if(!"".equals(fileName)) {
			vo.setBookCover(fileName);
			vo.setBookCoverPath(filePath);	
		}else {
			vo.setBookCover("");
			vo.setBookCoverPath("");
		}
		
		
	   int result = bookDao.bookUpdate(vo);
	   System.out.println("BOOK수정 : " + result + " ----> ");
	   if( result > 0) {
		   model.addAttribute("msg", "Success");
	   }else {
		   model.addAttribute("msg", "Error");
	   }
	   
	   return vo;
   }
}
