package co.ebook.prj.book.vo;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BookSrchVO {
	private String bookFlCd;
	private String bookNm;
	private String bookPublCo;
	private String bookWriter;
	private String bookManagerNm;
	private String bcnfmStCd;
	private String bookCnfmYn;
	private String srchCnfmCd;
	private String memberId;
	private String bookIsbn;
	private String ctgyId;
	private String ctgyGrId;
	// BOOK조회시 출간일 기간 
	
	private String bookPublSDt;
	
		
	private String bookPublEDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")		
	private String insDt;
	
	// 페이징 처리
	private int start;
	private int end;
}
