package co.ebook.prj.cmmnty.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.ebook.prj.cmmnty.service.CmmntyService;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.common.vo.Paging;

@Controller
public class CmmntyController {

	@Autowired
	private CmmntyService cmmntyDao;

	@Autowired
	String filePath;

	// 공지사항 전체조회
	@RequestMapping("/noticeList")
	String noticeList(Model model, CmmntyVO vo, Paging paging) {
		vo.setCmmntyFlCd("01");
		
			//페이징처리
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast()); 
			paging.setTotalRecord(cmmntyDao.getCount(vo));
		
		List<CmmntyVO> lists = cmmntyDao.cmmntyList(vo);
		model.addAttribute("notices", lists);
		return "cmmnty/noticeList";
	}
	// 파일 다운로드
	@GetMapping("/download")
	public void download(HttpServletResponse response, CmmntyVO vo ) throws Exception {
		String fileName = vo.getCmmntyAtchNm();
		String real_filePath = "";
		String folder = "/notice/";
		real_filePath = filePath + folder;
		
		String encodeVal = URLEncoder.encode(fileName, "utf-8");

		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodeVal + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		try(
				FileInputStream fis = new FileInputStream(real_filePath+fileName);
				OutputStream out = response.getOutputStream();
				){
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while((readCount = fis.read(buffer)) != -1){
				out.write(buffer,0,readCount);
			}
		}catch(Exception ex){
			throw new RuntimeException("file Save Error");
		}
		  
	}
	
	// 공지사항 상세조회
	@RequestMapping("/noticeSelectList")
	String noticeSelectList(Model model, CmmntyVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));

		vo.setCmmntyFlCd("01");
		vo.setCmmntyDelyn("N");
		vo = cmmntyDao.cmmntySelectList(vo);
		
		model.addAttribute("notice", vo);
		return "cmmnty/noticeSelectList";
	}

	// 공지사항 게시글입력양식
	@RequestMapping("/noticeInsertForm")
	String noticeInsertForm(Model model, CmmntyVO vo) {

		return "cmmnty/noticeInsertForm";
	}

	// 공지사항 게시글입력
	@RequestMapping("/noticeInsert")
	String noticeInsert(Model model, CmmntyVO vo, MultipartFile attchFile, HttpServletRequest request)
			throws Exception {

		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		vo.setCmmntyFlCd("01");
		
		//파일 업로드
		String fileName = "";
		String real_filePath = "";
		String folder = "/notice/";

		try {
			if (attchFile != null) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();
					real_filePath = filePath + folder;
					File fileSave = new File(real_filePath, fileName);

					attchFile.transferTo(fileSave);
				} else {
					filePath = "";
					fileName = "";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("----------------------------->> ");
		System.out.println(fileName);
		System.out.println(folder);
		System.out.println("----------------------------->> ");

		vo.setCmmntyAtchNm(fileName);
		vo.setCmmntyAtchPath(folder);

		int lists = cmmntyDao.cmmntyInsert(vo);
		System.out.println("공지사항:" + lists + "건 입력완료 --------------");
		if (lists > 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:noticeList";
	}

	// 공지사항 게시글삭제
	@PostMapping("/noticeDelete")
	public String noticeDelete(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");
		cmmntyDao.cmmntyDelete(vo);

		return "redirect:noticeList";
	}

	// 공지사항 게시글수정 양식
	@PostMapping("/noticeUpdateForm")
	public String noticeUpdateForm(Model model, CmmntyVO vo) {
		vo.setCmmntyFlCd("01");

		vo = cmmntyDao.cmmntySelectList(vo);
		model.addAttribute("notice", vo);
		return "cmmnty/noticeUpdateForm";
	}

	// 공지사항 게시글수정
	@RequestMapping(value = "/noticeUpdate")
	public String noticeUpdate(Model model, CmmntyVO vo, MultipartFile attchFile, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setCmmntyWriter((String) session.getAttribute("id"));
		vo.setCmmntyFlCd("01");
		
		System.out.println(vo.toString());
		System.out.println("==================================>>파일값가져오니?");

		String fileName = "";
		String real_filePath = "";
		String folder = "/notice/";

		try {
			if (attchFile != null) {
				if (!attchFile.getOriginalFilename().isEmpty()) {
					fileName = attchFile.getOriginalFilename();
					real_filePath = filePath + folder;
					File fileSave = new File(real_filePath, fileName);

					System.out.println(vo.toString());
					System.out.println("값가져와야지~~~~!!!!!!!!!!!!!!!!");

					attchFile.transferTo(fileSave);
					
					if (vo.getCmmntyAtchNm() != null || !"".equals(vo.getCmmntyAtchNm())) {
						File oldFile = new File(filePath + vo.getCmmntyAtchPath(), vo.getCmmntyAtchNm());
						System.out.println("===============================>> 기존파일 삭제처리 >> ");
						System.out.println(oldFile);

						if (oldFile.exists()) {
							oldFile.delete();
						}
					}

				} else {
					filePath = "";
					fileName = "";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		vo.setCmmntyAtchNm(fileName);
		vo.setCmmntyAtchPath(folder);

		int list = cmmntyDao.cmmntyUpdate(vo);
		if (list != 0) {
			model.addAttribute("msg", "01");
		} else {
			model.addAttribute("msg", "02");
		}
		return "redirect:noticeList";

	}

}
