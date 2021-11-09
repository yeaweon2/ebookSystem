package co.ebook.prj.common.vo;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InquireTopVO {
	private String rn;
	private String cmmntyId;
	private String cmmntyTitle;
	private String cmmntyWriter;
	private String memberNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")	
	private String insDt;
}
