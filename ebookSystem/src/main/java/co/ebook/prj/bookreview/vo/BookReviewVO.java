package co.ebook.prj.bookreview.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookReviewVO {
	private Integer reviewId;
	private String bookId;
	private String reviewTitle;
	private String reviewContents;
	private String reviewWriter;
	private int reviewHit;
	private String reviewLikeit;
	private int reviewReplyCnt;
	private String reviewAtchNm;
	private String reviewAtchPath;
	private String reviewDelYn;
	private Date insDt;
	private Date udtDt;
}
