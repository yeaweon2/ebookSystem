package co.ebook.prj.lend.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LendVO {
	private int lendId;
	private Date lendDate;
	private String bookId;
	private int lendHit;
	private Date insDt;
	private String memberId; 
	private String bookNm;
	private String bookPublCo;
	private String bookWriter;
	private String bookIntro;
	private String bookCover;
	private String bookCoverPath;
	private String bookFlCd;
	
}
