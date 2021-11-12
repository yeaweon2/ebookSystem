package co.ebook.prj.bookreview.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookReviewVO {
	private Integer reviewId; 		//리뷰번호
	private Integer reviewNo;		//게시글정렬
	private String bookId;			//책id
	private String reviewTitle;		//리뷰제목
	private String reviewContents;  //리뷰내용
	private String reviewWriter;	//리뷰작성자
	private int reviewHit;			//리뷰조회수
	private int reviewLikeit;	//리뷰좋아요수
	private int reviewReplyCnt;		//리뷰댓글수
	private String reviewAtchNm;	//첨부파일
	private String reviewAtchPath;	//첨부파일경로
	private String reviewDelYn;		//리뷰삭제여부
	private Date insDt;				//작성일
	private Date udtDt;				//수정일
	
	private String bookCover;
	private String bookCoverPath;
	private String bookNm;
	private String bookWriter;
	
	private int start;					 //페이징 시작
	private int end;					 //페이징 끝
	
	

}
