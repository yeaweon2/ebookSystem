package co.ebook.prj.bcnfm.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BcnfmVO {
	private int rn;
	private int bcnfmNo;
	private int bcnfmId;
	private String bookId;
	private String bookNm;
	private String bookCover;
	private String bookCoverPath;
	private String memberNm;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date bcnfmReqDt;
	private String bcnfmReqNm;
	private String bcnfmStCd;
	private String bcnfmCnfmr;
	private String bookCnfmYn;
	private String fileCnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date bcnfmCnfmDt;
	private String bcnfmReject;
	private Date insDt;
	private Date udtDt;
	
	// 페이징 처리
	private int start;
	private int end;	
	
	private String bookFlCd;

	private String bookPublCo;
	private String bookWriter;	
	private String bcnfmReqSDt;
	private String bcnfmReqEDt;

	private String bcnfmCnfmSDt;
	private String bcnfmCnfmEDt;
	private String ctgyId;
	private String ctgyGrId;
	private String srchVal;
	private String srchTxt;
	private String srchCnfmCd;
	
	
	
	
}
