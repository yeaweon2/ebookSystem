package co.ebook.prj.common.vo;

import lombok.Data;

@Data
public class ReviewTopVO {
	private String rn;
	private String reviewTitle;
	private String reviewContents;
	private String reviewWriter ;
	private String reviewWriterNm;
	private String bookNm;
	private String bookCover;
	private String bookCoverPath; 
	private String bookPublCo;
	private String bookWriter;
}