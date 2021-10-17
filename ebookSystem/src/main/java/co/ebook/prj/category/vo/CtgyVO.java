package co.ebook.prj.category.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class CtgyVO {
	private String ctgyId;
	private String ctgyNm;
	private String ctgyGrId;
	private String ctgyUseYn;
	private String ctgyWriter;
	private Date insDt;
	private Date udtDt;
	
	
	
	public String getCtgyId() {
		return ctgyId;
	}



	public void setCtgyId(String ctgyId) {
		this.ctgyId = ctgyId;
	}



	public String getCtgyNm() {
		return ctgyNm;
	}



	public void setCtgyNm(String ctgyNm) {
		this.ctgyNm = ctgyNm;
	}



	public String getCtgyGrId() {
		return ctgyGrId;
	}



	public void setCtgyGrId(String ctgyGrId) {
		this.ctgyGrId = ctgyGrId;
	}



	public String getCtgyUseYn() {
		return ctgyUseYn;
	}



	public void setCtgyUseYn(String ctgyUseYn) {
		this.ctgyUseYn = ctgyUseYn;
	}



	public String getCtgyWriter() {
		return ctgyWriter;
	}



	public void setCtgyWriter(String ctgyWriter) {
		this.ctgyWriter = ctgyWriter;
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



	@Override
	public String toString() {
		return "CtgyVO [ctgyId=" + ctgyId + ", ctgyNm=" + ctgyNm + ", ctgyGrId=" + ctgyGrId + ", ctgyUseYn=" + ctgyUseYn
				+ ", ctgyWriter=" + ctgyWriter + ", insDt=" + insDt + ", udtDt=" + udtDt + "]";
	}
	
	
}
