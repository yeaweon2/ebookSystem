package co.ebook.prj.cmmnty.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;                    

@Getter
@Setter
@ToString
public class CmmntyVO {
	private int cmmntyId;
	private int cmmntyNo;
	private String cmmntyWriter;
	private String cmmntyFlCd;
	private String cmmntyTitle;
	private String cmmntyContents;
	private String cmmntyDelyn;
	private int cmmntyHit;
	private int cmmntyReplyCnt;
	private String cmmntyAtchNm;
	private String cmmntyAtchPath;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date insDt;
	private Date udtDt;
	
	
	
	
	
}
