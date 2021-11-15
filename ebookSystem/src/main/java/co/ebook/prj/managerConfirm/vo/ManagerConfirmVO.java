package co.ebook.prj.managerConfirm.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class ManagerConfirmVO {
	private int mcnfmId;
	private String memberId;
	private String mcnfmStCd;
	private String mcnfmStNm;
	private String mcnfmCnfmr;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date mcnfmCnfmDt;
	private Date mcnfmReqDt;
	private Date mcnfmCntrSdt;
	private Date mcnfmCntrEdt;
	private Date insDt;
	private Date udtDt;
	private Date payDt;
	
	private String mcnfmBizno;
	private String mcnfmCoTel;
	private String mcnfmCoNm;
	private String mcnfmRpspr;
	private String mcnfmCntrFlCd;
	private String mcnfmCntrFlNm;
	private String mcnfmReject;
	private String mcnfmAtchNm;
	private String mcnfmAtchPath;
	private String mcnfmAmt;
	private String mcnfmCnfmrNm; 
	private int payAmt;
	private int payId;
	private String impUid;
	private String payStCd;
	private String payMthd;
	

	
}
