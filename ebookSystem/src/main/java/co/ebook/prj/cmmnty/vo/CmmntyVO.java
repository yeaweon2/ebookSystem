package co.ebook.prj.cmmnty.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class CmmntyVO {
	private int cmmntyId ;
	private String cmmntyWriter;
	private String cmmntyFlCd;
	private String cmmntyTitle;
	private String cmmntyContents;
	private String cmmntyDelyn;
	private int cmmntyHit;
	private int cmmntyReplyCnt;
	private String cmmntyAtchNm;
	private String cmmntyAtchPath;
	private Date insDt;
	private Date udtDt;
	
	public int getCmmntyId() {
		return cmmntyId;
	}
	public void setCmmntyId(int cmmntyId) {
		this.cmmntyId = cmmntyId;
	}
	public String getCmmntyWriter() {
		return cmmntyWriter;
	}
	public void setCmmntyWriter(String cmmntyWriter) {
		this.cmmntyWriter = cmmntyWriter;
	}
	public String getCmmntyFlCd() {
		return cmmntyFlCd;
	}
	public void setCmmntyFlCd(String cmmntyFlCd) {
		this.cmmntyFlCd = cmmntyFlCd;
	}
	public String getCmmntyTitle() {
		return cmmntyTitle;
	}
	public void setCmmntyTitle(String cmmntyTitle) {
		this.cmmntyTitle = cmmntyTitle;
	}
	public String getCmmntyContents() {
		return cmmntyContents;
	}
	public void setCmmntyContents(String cmmntyContents) {
		this.cmmntyContents = cmmntyContents;
	}
	public String getCmmntyDelyn() {
		return cmmntyDelyn;
	}
	public void setCmmntyDelyn(String cmmntyDelyn) {
		this.cmmntyDelyn = cmmntyDelyn;
	}
	public int getCmmntyHit() {
		return cmmntyHit;
	}
	public void setCmmntyHit(int cmmntyHit) {
		this.cmmntyHit = cmmntyHit;
	}
	public int getCmmntyReplyCnt() {
		return cmmntyReplyCnt;
	}
	public void setCmmntyReplyCnt(int cmmntyReplyCnt) {
		this.cmmntyReplyCnt = cmmntyReplyCnt;
	}
	public String getCmmntyAtchNm() {
		return cmmntyAtchNm;
	}
	public void setCmmntyAtchNm(String cmmntyAtchNm) {
		this.cmmntyAtchNm = cmmntyAtchNm;
	}
	public String getCmmntyAtchPath() {
		return cmmntyAtchPath;
	}
	public void setCmmntyAtchPath(String cmmntyAtchPath) {
		this.cmmntyAtchPath = cmmntyAtchPath;
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
