package co.ebook.prj.bcnfm.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BcnfmVO {
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
	private String fileCnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date bcnfmCnfmDt;
	private String bcnfmReject;
	private Date insDt;
	private Date udtDt;
}
