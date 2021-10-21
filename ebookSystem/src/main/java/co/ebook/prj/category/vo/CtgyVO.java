package co.ebook.prj.category.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;

@Data
public class CtgyVO {
	private int ctgyId;
	private String ctgyNm;
	private String ctgyGrId;
	private String ctgyUseYn;
	private String ctgyWriter;
	private Date insDt;
	private Date udtDt;
	

	
}
