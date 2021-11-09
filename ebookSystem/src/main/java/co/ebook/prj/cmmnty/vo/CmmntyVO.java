package co.ebook.prj.cmmnty.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
               

@Data
public class CmmntyVO {
	private Integer cmmntyId;			 //게시글번호
	private int cmmntyNo;				 //게시글정렬
	private String cmmntyWriter;		 //작성자
	private String cmmntyFlCd;			 //게시판 번호
	private String cmmntyTitle;			 //게시글 제목
	private String cmmntyContents;		 //게시글 내용
	private String cmmntyDelyn;			 //게시글 삭제여부
	private int cmmntyHit;				 //게시글 조회수
	private int cmmntyReplyCnt;			 //게시글 댓글수
	@DateTimeFormat(pattern = "yyyy-MM-dd ")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date insDt; 				 //작성일
	private Date udtDt;					 //수정일
	private String procDoneYn;			 //1:1문의 댓글여부
	
	private String cmmntyAtchNm;		 //첨부파일명
	private String cmmntyAtchPath;		 //첨부파일경로
	
	private MultipartFile attchFile;	 //첨부파일
	
	
	
	
}
