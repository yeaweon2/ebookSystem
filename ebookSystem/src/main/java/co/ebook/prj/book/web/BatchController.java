package co.ebook.prj.book.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.ebook.prj.book.service.BatchService;
import co.ebook.prj.book.service.BookService;
import co.ebook.prj.book.vo.BatchVO;
import co.ebook.prj.book.vo.BookVO;

@Controller
public class BatchController {

	@Autowired
	BatchService batchDao;
	
	@Autowired
	BookService bookDao;	
	
	@Autowired
	String filePath;	
	
	
	@RequestMapping("/bookFileUpload")
	public String bookFileUpload(Model model , BatchVO vo ) {
		
		BookVO bvo = new BookVO();
		bvo.setBookId(vo.getBookId());
		bvo = bookDao.bookDetail(bvo);
		
		model.addAttribute("book", bvo);
		 
		List<BatchVO> list = batchDao.batchList(vo);
		model.addAttribute("list", list);
		
		return "book/bookFileUpload";
	}	
		
	
	
	@RequestMapping("/batchInsert")
	@ResponseBody
	public List<BatchVO> batchInsert(Model model, BatchVO vo, MultipartHttpServletRequest  mtfRequest ,HttpServletRequest request ) {
		
		List<BatchVO> list = null;
		
		String folder = "/bookfile/";
		filePath =  filePath + folder;		
		
		HttpSession session = request.getSession();
		vo.setBatchWriter((String)session.getAttribute("id"));
		
		List<MultipartFile> fileList = mtfRequest.getFiles("fileList");
		
		int no = 1;
		if(fileList.isEmpty() == false){
			for(MultipartFile mfile :  fileList) {
				try {
					if ( mfile != null ) {
						if (!mfile.getOriginalFilename().isEmpty()) {
							System.out.println("------------- file start -------------"); 
							System.out.println("filename : " + mfile.getOriginalFilename()); 
							System.out.println(vo.toString());
							System.out.println("----------------------------------------->>");				
							
							vo.setBatchOrd(no);
							vo.setBatchNm(mfile.getOriginalFilename());
							vo.setBatchPath(folder);
							no++;
	
													// 파일이 저장될 최종폴더
	
							// UUID.randomUUID().toString() + "_" +
							File fileSave = new File( filePath , mfile.getOriginalFilename());
							System.out.println("----------------------------------------------> fileSave");
							System.out.println(fileSave);
							System.out.println("----------------------------------------------> fileSave");
							
							mfile.transferTo(fileSave);
							
							batchDao.batchInsert(vo);
							
							list = batchDao.batchList(vo);
						}
					}	
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}						
			}
		}
		return list;
	}
	
	@RequestMapping("/batchOrderUpdate")
	@ResponseBody
	public HashMap<String,Object> batchOrderUpdate(Model model, @RequestBody List<BatchVO> list ) {
	
		int result = 0;
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		for(BatchVO vo : list ) {
			System.out.println(vo.toString());
			System.out.println("==========================>>");
			
			result = batchDao.batchOrderUpdate(vo);	
		}
		
		if(result > 0 ) {
			map.put("result", "입력완료");
		}else {
			map.put("result", "오류발생");
		}
		return map;		
	}	
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public HashMap<String, Object> batchDelete(Model model, @RequestBody BatchVO vo) {
		
		System.out.println(vo.toString());
		System.out.println("==========================>>");
		int	result = batchDao.batchDelete(vo);		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0 ) {
			map.put("result", "01");
		} else {
			map.put("result", "02");
		}
		
		return map;
	}
	
}
