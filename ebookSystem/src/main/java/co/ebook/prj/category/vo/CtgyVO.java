package co.ebook.prj.category.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CtgyVO {
	private String ctgyId;
	private String ctgyNm;
	private String ctgyGrId;
	private String ctgyUseYn;
	private String ctgyWriter;
	private Date insDt;
	private Date udtDt;
	private String childCnt;
}
