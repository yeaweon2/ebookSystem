package co.ebook.prj.cmmnty.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;                    

@Getter
@Setter
public class CmmntyVO {
	private int cmmntyId ;
	private int cmmntyNo ;
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
	
	
	
}
