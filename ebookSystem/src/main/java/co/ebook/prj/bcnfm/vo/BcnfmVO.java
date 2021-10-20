package co.ebook.prj.bcnfm.vo;

import java.util.Date;

public class BcnfmVO {
	private int bcnfmId;
	private String bookId;
	private Date bcnfmReqDt;
	private String bcnfmStCd;
	private String bcnfmCnfmr;
	private Date bcnfmCnfmDt;
	private String bcnfmReject;
	private Date insDt;
	private Date udtDt;
	
	public int getBcnfmId() {
		return bcnfmId;
	}
	public void setBcnfmId(int bcnfmId) {
		this.bcnfmId = bcnfmId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public Date getBcnfmReqDt() {
		return bcnfmReqDt;
	}
	public void setBcnfmReqDt(Date bcnfmReqDt) {
		this.bcnfmReqDt = bcnfmReqDt;
	}
	public String getBcnfmStCd() {
		return bcnfmStCd;
	}
	public void setBcnfmStCd(String bcnfmStCd) {
		this.bcnfmStCd = bcnfmStCd;
	}
	public String getBcnfmCnfmr() {
		return bcnfmCnfmr;
	}
	public void setBcnfmCnfmr(String bcnfmCnfmr) {
		this.bcnfmCnfmr = bcnfmCnfmr;
	}
	public Date getBcnfmCnfmDt() {
		return bcnfmCnfmDt;
	}
	public void setBcnfmCnfmDt(Date bcnfmCnfmDt) {
		this.bcnfmCnfmDt = bcnfmCnfmDt;
	}
	public String getBcnfmReject() {
		return bcnfmReject;
	}
	public void setBcnfmReject(String bcnfmReject) {
		this.bcnfmReject = bcnfmReject;
	}
	public Date getInsDt() {
		return insDt;
	}
	public void setInsDt(Date insDt) {
		this.insDt = insDt;
	}
	public Date getUdtDt() {
		return udtDt;
	}
	public void setUdtDt(Date udtDt) {
		this.udtDt = udtDt;
	}
	
	
}
