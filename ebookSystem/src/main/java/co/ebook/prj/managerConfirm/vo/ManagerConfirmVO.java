package co.ebook.prj.managerConfirm.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ManagerConfirmVO {
	private int mcnfmId;
	private String memberId;
	private Date mcnfmReqDt;
	private String mcnfmStCd;
	private String mcnfmStNm;
	private String mcnfmCnfmr;
	private Date mcnfmCnfmDt;
	private String mcnfmBizno;
	private String mcnfmCoTel;
	private String mcnfmCoNm;
	private String mcnfmRpspr;
	private String mcnfmCntrFlCd;
	private String mcnfmCntrFlNm;
	private Date mcnfmCntrSdt;
	private Date mcnfmCntrEdt;
	private String mcnfmReject;
	private String mcnfmAtchNm;
	private String mcnfmAtchPath;
	private Date insDt;
	private Date udtDt;
}
