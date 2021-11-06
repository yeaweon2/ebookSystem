package co.ebook.prj.book.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	private String bookId;
	private String ctgyId;
	private String ctgyIdNm;
	private String ctgyGrNm;
	private String bookNm;
	private String bookFlCd;
	private String bookPublCo;
	private String bookWriter;
	private Date bookPublDt;
	private String bookUseyn;
	private String bookIntro;
	private String bookContent;
	private int bookHit;
	private int bookLikeit;
	private String bookCnfmYn;
	private String bookIsbn;
	private String bookWriterIntro;
	private String bookDesc;
	private String bookCover;
	private String bookCoverPath;
	private String memberId;
	private String memberNm;
	private MultipartFile attchFile;
	private String attchUpFlag;
	private int rank;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date insDt;
	private Date udtDt;
	private int bookNo;
	private String introSub; // 책소개 100자로 끊은 값 넣을시 사용
	private String bookStd; // 북조회 기준(베스트셀러, 추천순 등 ) 
	private String cnfmStNm;	// BOOK목록에서 승인상태명 보여주기위해 사용
	
	// 페이징 처리
	private int start;
	private int end;
}
