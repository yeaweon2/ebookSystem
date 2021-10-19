package co.ebook.prj.book.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {
	private String bookId;
	private String ctgyId;
	private String bookNm;
	private String bookFlCd;
	private String bookPublCo;
	private String bookWriter;
	private Date bookPublDt;
	private int bookAmt;
	private int bookDiscnt;
	private String bookUseyn;
	private String bookIntro;
	private String bookContent;
	private int bookHit;
	private int bookLikeit;
	private String bookCnfmYn;
	private String bookIsbn;
	private String bookWriterIntro;
	private String bookDesc;
	private String bookCover;
	private String bookCoverPath;
	private String memberId;
	private Date insDt;
	private Date udtDt;
	private int bookNo;

}
